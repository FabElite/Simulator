#define __CADENCE_C

#include "nrf_gpio.h"
#include "cmp_spi.h"
#include "nrf_drv_spi.h"
#include "app_error.h"
#include "app_util_platform.h"
#include "string.h"
#include "ads1220.h"
#include "nrf_drv_gpiote.h"
#include "nrf_delay.h"
#include "global.h"
#include "app_error.h"
#include "nrf_gpiote.h"
#include "cadence.h"
#include "lis2dh.h"
#include "nrf_log.h"
#include "arm_math.h"
#include "app_uart.h"

#define TEST_LENGTH_SAMPLES  320
#define BLOCK_SIZE            32
#define ORDINE_FILTRO		   2
// circa la soglia che misura l'accelerometro con 1g positivo
#define ONE_G_ACCELERATION    1024
#define TREASHOULD_PERCENTAGE 0.5
#define ONE_G_POS_ACC_THREASHOULD (ONE_G_ACCELERATION*TREASHOULD_PERCENTAGE)
#define ONE_G_NEG_ACC_THREASHOULD (ONE_G_ACCELERATION*(-TREASHOULD_PERCENTAGE))

volatile uint8_t *cadence_p_buffer_rx_lis2dh;
volatile raw_data_acc buffer_input_acc[ORDINE_FILTRO+1];
volatile filt_data_acc buffer_last_out_acc[ORDINE_FILTRO+1];
static volatile raw_data_acc raw_gage_assey;
volatile filt_data_acc new_acc_filt = {0,0};
//volatile filt_data_acc new_acc_filt_MM = {0,0};
volatile filt_data_acc old_acc_filt = {0,0};
volatile bool flag_positive_zero_crossing = 0;
volatile bool flag_minimum_acc = 0;

static uint8_t A_evt_cnt = 0;
	
/* ----------------------------------------------------------------------
** I coefficienti a del filtro IIR
** ------------------------------------------------------------------- */
const float32_t a_coeff[ORDINE_FILTRO + 1] = {
	1.0f,   -1.936974987626536f,   0.938919572836420f
};
/* ----------------------------------------------------------------------
** I coefficienti b del filtro IIR
** ------------------------------------------------------------------- */
const float32_t b_coeff[ORDINE_FILTRO + 1] = {
	0.010175882703628f,   -0.018407180197373f,   0.010175882703628f
};


uint32_t init_cadence (void)
{
	uint32_t err_code = NRF_SUCCESS;
	uint8_t buffer_tx[20];
	uint8_t *p_buffer_tx = buffer_tx;
	volatile uint8_t *p_buffer_rx_lis2dh;
	
	err_code = lis2dh_configure();
	APP_ERROR_CHECK(err_code);
	// abilitazioni degli interrupt
	lis2dh_enable_int1_and_int2();
	
	p_buffer_rx_lis2dh = lis2dh_get_rx_address();
//	valore = *p_buffer_rx_ads1220;
	lis2dh_read_registers(LIS2DH_WHO_AM_I, 2);
	while(lis2dh_get_fl_spi_xfer_done() == false)
	{
		__SEV();
		__WFE();
		__WFE();
	}
	__NOP();
	printf("\n\rWHO AM I: %d\n\r", *p_buffer_rx_lis2dh);
	nrf_delay_ms(100);
	
	// abilito solo l'asse y con una campionatura di 200hz
	buffer_tx[0] = 0x72; //ctrl1
	buffer_tx[1] = 0x00;
	buffer_tx[2] = 0x10;
	buffer_tx[3] = 0x08;
	buffer_tx[4] = 0x00;
	buffer_tx[5] = 0x42;
	err_code = lis2dh_write_registers(LIS2DH_CTRL_REG1, p_buffer_tx, 6);
	APP_ERROR_CHECK(err_code);
	while(lis2dh_get_fl_spi_xfer_done() == false)
	{
		__SEV();
		__WFE();
		__WFE();
	}
	__NOP();
	
	err_code = lis2dh_read_registers(LIS2DH_CTRL_REG1,6);
	APP_ERROR_CHECK(err_code);
	while(lis2dh_get_fl_spi_xfer_done() == false)
	{
		__SEV();
		__WFE();
		__WFE();
	}
	__NOP();
	printf("\n\rctrl_reg1: %d\n\rctrl_reg2: %d\n\rctrl_reg3: %d\n\rctrl_reg4: %d\n\rctrl_reg5: %d\n\rctrl_reg6: %d\n\r", *p_buffer_rx_lis2dh, *(p_buffer_rx_lis2dh+1), *(p_buffer_rx_lis2dh+2), *(p_buffer_rx_lis2dh+3), *(p_buffer_rx_lis2dh+4), *(p_buffer_rx_lis2dh+5));
	nrf_delay_ms(100);
	
	// assegno l'indirizzo dove pesco il buffer della spi.
	cadence_p_buffer_rx_lis2dh = lis2dh_get_rx_address();
	
	// pulisco la flag
	lis2dh_clear_new_int1();
	err_code = lis2dh_read_registers(LIS2DH_CTRL_OUT_Y_H, 1);
	APP_ERROR_CHECK(err_code);
	while(lis2dh_get_fl_spi_xfer_done() == false)
	{
		__SEV();
		__WFE();
		__WFE();
	}
	
	return err_code;
}

bool cadence_algoritm (void)
{
	static bool fl_reached_min_pos_treashould = false;
//	static bool fl_reached_min_neg_treashould = false;
	static uint32_t old_zero_crossing = 0;
	static uint32_t new_zero_crossing = 0;
	static float32_t delta_zero_crossing_in_sec = 0;
	static uint32_t delta_zero_crossing;
	static float32_t cadence_rad_s = 0;
	static float32_t cadence_rpm = 0;
	
	// printf ("\r\n%d,%f",buffer_input_acc[(ORDINE_FILTRO)].value, new_acc_filt.value_filtered);
	
	// se supero una soglia minima durante una rotazione setto la flag di superamento della
	// soglia minima a 1
	if ((new_acc_filt.value_filtered) > ONE_G_POS_ACC_THREASHOULD)
	{
		fl_reached_min_pos_treashould = !false;
	}
	
//	// se supero una soglia minima durante una rotazione setto la flag di superamento della
//	// soglia minima a 1
//	if ((last_acc_filt.value_filtered) < 1G_NEG_ACC_THREASHOULD)
//	{
//		fl_reached_min_neg_treashould = !false;
//	}
	
	// entro qui solo se ho attraverso positivamente lo 0
	if ( (old_acc_filt.value_filtered <0) && (new_acc_filt.value_filtered >0) )
	{
		old_zero_crossing = new_zero_crossing;
		new_zero_crossing = new_acc_filt.time_of_the_sample;
		
		// ++++++++++++++++++ spiegazione algoritmo ++++++++++++++++++++++
		// se nel momento di attraversamento della soglia minima positiva
		// ho superato la soglia minima positiva la resetto e calcolo il
		// delta tra i due attraversamenti positivi
		// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		if (fl_reached_min_pos_treashould)
		{
			// resetto immediatamente la flag
			fl_reached_min_pos_treashould = false;
			
			// calcolo il delta tra due attraversamenti dello 0 non tengo
			// conto dell'overflow del registro del tempo in quanto è un
			// 32bit che si aggiorna ogni ms, va quindi in overflow ogni 
			// 2 mesi circa quindi non serve un if di verifica
			delta_zero_crossing = ((new_zero_crossing - old_zero_crossing));
			delta_zero_crossing_in_sec = (float32_t)delta_zero_crossing/1024;
			// se la cadenza è compresa tra 20 e 200rpm
			if ( (delta_zero_crossing_in_sec >= (float32_t)0.3) && (delta_zero_crossing_in_sec <= (float32_t)3))
			{
				cadence_rad_s = (2*PI)/(delta_zero_crossing_in_sec);
				cadence_rpm = (60/delta_zero_crossing_in_sec);
				//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "OK\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
			}
			// se la cadenza è sotto i 20rpm la considero pari a 0
			else if (delta_zero_crossing_in_sec > 3)
			{
				cadence_rad_s = 0;
				cadence_rpm = 0;
				//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "SATL\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
			}
			// se la cadenza è sopra i 200rpm saturo i valori di cadenza
			else
			{
				cadence_rad_s = 21;
				cadence_rpm = 201;
				//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "SATH\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
			}
		}
		// cioè se tra uno zero crossing positivo e l'altra non raggiungo la
		// soglia minima significa che non ho completato una rotazione e pongo a zero la cadenza
		else
		{
			cadence_rad_s = 0.1;
			cadence_rpm = 1;
			//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "NOROT\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
		}
		//stampa_ble();
		return (!false);
	}
	return false;
}

void cadence_process_new_acc_data(void)
{
	raw_data_acc nuovo_valore_acquisito;
	filt_data_acc nuovo_valore_filtrato;
	nuovo_valore_filtrato.value_filtered = 0;
//	// mm sta per media mobile
//	filt_data_acc accumulatore_MM;
//	accumulatore_MM.value_filtered = 0;
	
	for (int i = 0; i < (ORDINE_FILTRO); i++)
	{
		buffer_last_out_acc[i] = buffer_last_out_acc[i+1];
		buffer_input_acc[i] = buffer_input_acc[i+1];
	}
	nuovo_valore_acquisito.value = ( (int16_t)((*cadence_p_buffer_rx_lis2dh)+(*(cadence_p_buffer_rx_lis2dh+1)<<8) ) >>4);
	nuovo_valore_acquisito.time_of_the_sample = get_time_int1_read();
	
	// per stampare su uart
	//acc_y_per_uart = nuovo_valore_acquisito;
	
	buffer_input_acc[ORDINE_FILTRO] = nuovo_valore_acquisito;
	
	nuovo_valore_filtrato.value_filtered += (nuovo_valore_acquisito.value * b_coeff[0]);
	for (int i = 1; i <= (ORDINE_FILTRO); i++)
	{
		nuovo_valore_filtrato.value_filtered += ( b_coeff[i] * buffer_input_acc[ORDINE_FILTRO-i].value );
		nuovo_valore_filtrato.value_filtered -= ( a_coeff[i] * buffer_last_out_acc[ORDINE_FILTRO-i].value_filtered ) ;
	}
	nuovo_valore_filtrato.time_of_the_sample = get_time_int1_read();
//	if (nuovo_valore_filtrato.valure_filtered == NAN)
//	{
//		__NOP();
//	}
	buffer_last_out_acc[ORDINE_FILTRO] = nuovo_valore_filtrato;


	
//	// aggiorno buffer di input e parto con il calcolo della sommatoria
//	for (int i = 0; i < (LUNGHEZZA_FILTRO-1); i++)
//	{
//		buffer_input_acc[i] =  buffer_input_acc[i+1];
//		accumulatore.value_filtered += ((buffer_input_acc[i].value) *a_coeff[(LUNGHEZZA_FILTRO-1)-i] );
//		accumulatore_MM.value_filtered += ((buffer_input_acc[i].value));
//	}
//	
//	// converto l'ultimo dato ricevuto e lo metto nell'ultima locazione del buffer
//	int16_t temp = ( (int16_t)((*cadence_p_buffer_rx_lis2dh) + (*(cadence_p_buffer_rx_lis2dh+1)<<8) ) >>4);
//	buffer_input_acc[(LUNGHEZZA_FILTRO-1)].value = temp;
//	buffer_input_acc[(LUNGHEZZA_FILTRO-1)].time_of_the_sample = get_time_int1_read();
//	
//	
//	acc_y_per_uart = buffer_input_acc[(LUNGHEZZA_FILTRO-1)];
//	
//	// carico l'accumulatore con l'ultimo valore da sommare relativo all'ultimo valore acquisito
//	accumulatore.value_filtered += (buffer_input_acc[(LUNGHEZZA_FILTRO-1)].value * a_coeff[0] );
//	accumulatore_MM.value_filtered += (buffer_input_acc[(LUNGHEZZA_FILTRO-1)].value);
//	accumulatore_MM.value_filtered =  (accumulatore_MM.value_filtered / LUNGHEZZA_FILTRO );
//	// associo il campione in uscita dal filtro al tempo del campione più vecchio,
//	// avendo questo subito il ritardo del filtro
//	accumulatore.time_of_the_sample = buffer_input_acc[0].time_of_the_sample;
//	
//	old_acc_filt = new_acc_filt;
//	new_acc_filt = accumulatore;
//	new_acc_filt_MM = accumulatore_MM;

	old_acc_filt = new_acc_filt;
	new_acc_filt = nuovo_valore_filtrato;
	
	cadence_algoritm();
	
	return;
}