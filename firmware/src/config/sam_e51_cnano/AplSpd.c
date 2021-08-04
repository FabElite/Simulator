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
#include "AplHmi.h"
#include "DplSpd.h"
#include "peripheral/tc/plib_tc2.h"
/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#define FILTER_ORDER (3)
#define ARRAY_DIMESION (FILTER_ORDER*2+1)
#define DECIMATORE (50)

float32_t a[ARRAY_DIMESION] =  {1, -3.715705136675553, 6.844048006251084, -7.775665435282946, 5.779749696018359, -2.640774843037108, 0.604948500073028};
float32_t b[ARRAY_DIMESION] =  {0.01556498175509638, 0, -0.04669494526528914, 0, 0.04669494526528914, 0, -0.01556498175509638};

raw_speed_sample in_spd[ARRAY_DIMESION];
raw_speed_sample out_spd[ARRAY_DIMESION];
volatile static float32_t cadence_rpm = 0;

raw_speed_sample new_acc_filt;
raw_speed_sample zNuovoValoreFiltrato;
    
const float MINAMPLITUDE = 20/100;

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
static bool cadence_algoritm (void);
static void cadence_process_new_acc_data(raw_speed_data z_new_speed_data);
static void TC2_Sampler_Timer(TC_TIMER_STATUS status, uintptr_t context);
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */

static void TC2_Sampler_Timer(TC_TIMER_STATUS status, uintptr_t context)
{
    static uint32_t zContatoreCampioni = 0;
    
    if (DplSpd_IsThereNewData())
    {
        raw_speed_data zNewData = DplSpd_GetNewSpeedData();
        
        if ( (zContatoreCampioni % DECIMATORE) == 0)
        {
            cadence_process_new_acc_data(zNewData);
        }
        zContatoreCampioni++;
    }
}

static void cadence_process_new_acc_data(raw_speed_data z_new_speed_data)
{
    
    // sposto tutte le posizioni degli input/output
	for (int i = 0; i < (ARRAY_DIMESION-1); i++)
	{
		out_spd[i] = out_spd[i+1];
		in_spd[i] = in_spd[i+1];
	}
    in_spd[ARRAY_DIMESION-1].speedkmh = z_new_speed_data.speedkmh;
    in_spd[ARRAY_DIMESION-1].acquisition_time_ms = z_new_speed_data.acquisition_time_ms;
    
    zNuovoValoreFiltrato.speedkmh = ( b[0] * z_new_speed_data.speedkmh );
    zNuovoValoreFiltrato.acquisition_time_ms = z_new_speed_data.acquisition_time_ms;
    
    for (int i = 1; i <= (ARRAY_DIMESION-1); i++)
	{
		zNuovoValoreFiltrato.speedkmh += ( b[i] * in_spd[(ARRAY_DIMESION-1)-i].speedkmh );
		zNuovoValoreFiltrato.speedkmh -= ( a[i] * out_spd[(ARRAY_DIMESION-1)-i].speedkmh ) ;
	}
    
    out_spd[ARRAY_DIMESION-1] = zNuovoValoreFiltrato;
    AplHmi_Println(z_new_speed_data.speedkmh, zNuovoValoreFiltrato.speedkmh);
    cadence_algoritm();
}

static bool cadence_algoritm (void)
{
	static bool fl_reached_min_pos_treashould = false;
	static uint32_t old_zero_crossing = 0;
	static uint32_t new_zero_crossing = 0;
	static float32_t delta_zero_crossing_in_sec = 0;
	static uint32_t delta_zero_crossing;
	

    new_acc_filt = out_spd[ARRAY_DIMESION-1];
    raw_speed_sample old_acc_filt = out_spd[ARRAY_DIMESION-2];
    
    // se supero una soglia minima durante una rotazione setto la flag di superamento della
	// soglia minima a 1
    // qui va messo il valore minimo di ampiezza di velocità che si considera accettabile
    
	if ( (new_acc_filt.speedkmh) > ((float32_t)0.02) )
	{
		fl_reached_min_pos_treashould = true;
	}

	// entro qui solo se ho attraverso positivamente lo 0
	if ( (old_acc_filt.speedkmh<0) && (new_acc_filt.speedkmh >0) )
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
    TC2_TimerCallbackRegister(TC2_Sampler_Timer, 0);
    TC2_TimerStart();
}
/* *****************************************************************************
 End of File
 */
