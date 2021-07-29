/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite srl

  @File Name
    AplSpd.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include "AplSpd.h"
#include "DplSpd.h"
/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#define FILTER_ORDER (3)
#define ARRAY_DIMESION (FILTER_ORDER*2+1)

float32_t a[ARRAY_DIMESION] =  {1, -5.974537726669403, 14.87593090869705, -19.75830093440877, 14.76469664819539, -5.88552548497545, 0.9777365894103591};
float32_t b[ARRAY_DIMESION] =  {1.659679040416131e-06, 0, -4.979037121248392e-06, 0, 4.979037121248392e-06, 0, -1.659679040416131e-06};

raw_speed_sample in_spd[ARRAY_DIMESION];
raw_speed_sample out_spd[ARRAY_DIMESION];

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
static bool cadence_algoritm (void);

/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */

static void cadence_process_new_acc_data(void)
{
    raw_speed_sample zNuovoValoreFiltrato;
    
    // sposto tutte le posizioni degli input/output
	for (int i = 0; i < (ARRAY_DIMESION-1); i++)
	{
		out_spd[i] = out_spd[i+1];
		in_spd[i] = in_spd[i+1];
	}
    in_spd[ARRAY_DIMESION-1].speedDutyCycle = g_new_speed_data.speedDutyCycle;
    in_spd[ARRAY_DIMESION-1].acquisition_time_ms = g_new_speed_data.acquisition_time_ms;
    
    zNuovoValoreFiltrato.speedDutyCycle = ( b[0] * g_new_speed_data.speedDutyCycle );
    zNuovoValoreFiltrato.acquisition_time_ms = g_new_speed_data.acquisition_time_ms;
    
    for (int i = 1; i <= (ARRAY_DIMESION-1); i++)
	{
		zNuovoValoreFiltrato.speedDutyCycle += ( b[i] * in_spd[(ARRAY_DIMESION-1)-i].speedDutyCycle );
		zNuovoValoreFiltrato.speedDutyCycle -= ( a[i] * out_spd[(ARRAY_DIMESION-1)-i].speedDutyCycle ) ;
	}
    
    out_spd[ARRAY_DIMESION-1] = zNuovoValoreFiltrato;
}

static bool cadence_algoritm (void)
{
	static bool fl_reached_min_pos_treashould = false;
	static uint32_t old_zero_crossing = 0;
	static uint32_t new_zero_crossing = 0;
	static float32_t delta_zero_crossing_in_sec = 0;
	static uint32_t delta_zero_crossing;
	static float32_t cadence_rpm = 0;
	
    raw_speed_sample new_acc_filt = out_spd[ARRAY_DIMESION-1];
    raw_speed_sample old_acc_filt = out_spd[ARRAY_DIMESION-2];
    
    // se supero una soglia minima durante una rotazione setto la flag di superamento della
	// soglia minima a 1
    // qui va messo il valore minimo di ampiezza di velocità che si considera accettabile
	if (new_acc_filt.speedDutyCycle > 0)
	{
		fl_reached_min_pos_treashould = true;
	}

	// entro qui solo se ho attraverso positivamente lo 0
	if ( (old_acc_filt.speedDutyCycle<0) && (new_acc_filt.speedDutyCycle >0) )
	{
		old_zero_crossing = new_zero_crossing;
		new_zero_crossing = new_acc_filt.acquisition_time_ms;
		
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
			delta_zero_crossing = (new_zero_crossing - old_zero_crossing);
			delta_zero_crossing_in_sec = (float32_t)delta_zero_crossing/1000;
			// se la cadenza è compresa tra 20 e 200rpm
			if ( (delta_zero_crossing_in_sec >= (float32_t)0.3) && (delta_zero_crossing_in_sec <= (float32_t)3))
			{
				cadence_rpm = (60/delta_zero_crossing_in_sec);
				//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "OK\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
			}
			// se la cadenza è sotto i 20rpm la considero pari a 0
			else if (delta_zero_crossing_in_sec > 3)
			{
				cadence_rpm = 0;
				//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "SATL\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
			}
			// se la cadenza è sopra i 200rpm saturo i valori di cadenza
			else
			{
				cadence_rpm = 201;
				//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "SATH\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
			}
		}
		// cioè se tra uno zero crossing positivo e l'altra non raggiungo la
		// soglia minima significa che non ho completato una rotazione e pongo a zero la cadenza
		else
		{
			cadence_rpm = 1;
			//lunghezza_stringa_ble_uart = sprintf (data_array_ble_uart, "NOROT\nacc: %f\ncad: %f\ndelta: %f",new_acc_filt.value_filtered , cadence_rpm, delta_zero_crossing_in_sec);
		}
		return true;
	}
	return false;
}
/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */
void AplSpd_Init(void)
{
    DplSpd_Init();
    
}

/* *****************************************************************************
 End of File
 */
