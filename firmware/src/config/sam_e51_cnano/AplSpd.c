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
#include "peripheral/systick/plib_systick.h"
#include "stdio.h"
/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
#define JUSTO /* AVANTI, JUSTO */

#define SPEED_DEFAULT_AVANTI_5KMH 1

#define RATIO_AVANTI 1230
#define RATIO_JUSTO 961
#define RATIO_DIRETO_XR 1210
#define RATIO_SUITO 1240
#define RATIO_RIVO 1270
#define CADENCE_GAP 5
#define TORQUE_VARIATION 100
#define RATIO_DEFAULT_OUTPUT1 RATIO_AVANTI
#define RATIO_DEFAULT_OUTPUT2 RATIO_SUITO

#define CADENCE_AMPLITUDE_DEFAULT 200

#if SPEED_DEFAULT_AVANTI_5KMH == 1
#define DEFAULT_HIGH_TIME 62658
#define DEFAULT_LOW_TIME1 81730
#define DEFAULT_LOW_TIME2 197105

//#define DEFAULT_TIME_OUTPUT2 9635// senza cadenza
#define DEFAULT_TIME_OUTPUT2 9400 //con cadenza
#endif

static uint32_t g_high_time_output1 = DEFAULT_HIGH_TIME;
static uint32_t g_low_time1_output1 = DEFAULT_LOW_TIME1;
static uint32_t g_low_time2_output1 = DEFAULT_LOW_TIME2;
static uint32_t g_high_time_output1_default = DEFAULT_HIGH_TIME;
static uint32_t g_low_time1_output1_default = DEFAULT_LOW_TIME1;
static uint32_t g_low_time2_output1_default = DEFAULT_LOW_TIME2;


static uint32_t g_time_output2 = DEFAULT_TIME_OUTPUT2;
static uint32_t g_time_output2_default = DEFAULT_TIME_OUTPUT2;
static uint32_t g_rpm_target = 60;
static float g_speed_variation_index_target = 4;
static float g_torque_variation_index_target = 10;

static volatile float g_speed_variation_index = 1;
static float g_torque_variation_index = 0;
static SimulationMode gModeOutput = NormalMode;
static bool g_CadenceEnable = 1;
static RulloOTSType gRulloSelezionato1 = Avanti;
static RulloNOOTSType gRulloSelezionato2 = Suito;
static float g_cadence_amplitude_output1 = 200.0;
static float g_cadence_amplitude_output2 = 100.0;
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
static void TC0_PWMin_Timer(TC_TIMER_STATUS status, uintptr_t context)
{
    static uint32_t y_status_emulator = 0;
    static uint32_t y_high_time = 10000;
    static uint32_t y_low_time1 = 10000;
    static uint32_t y_low_time2 = 10000;
    static uint32_t y_systemCounter = 0;
    static float z_freq_rpm = 0;
    static float z_normalizedPosition = 0;

    switch (y_status_emulator){
        case 0:            
            TC0_Timer32bitPeriodSet(y_high_time);            
            y_status_emulator++;
            OUTPUT1_Set();
            //OUTPUT2_Set();
            break;
        case 1:
            TC0_Timer32bitPeriodSet(y_low_time1);
            y_status_emulator++;
            OUTPUT1_Clear();
            //OUTPUT2_Clear();
            break;
         case 2:            
            TC0_Timer32bitPeriodSet(y_high_time);
            y_status_emulator++;
            OUTPUT1_Set();
            //OUTPUT2_Set();
            break;
        case 3:            
            TC0_Timer32bitPeriodSet(y_low_time2);
            y_status_emulator=0;
            OUTPUT1_Clear();
            //OUTPUT2_Clear();
            break;
        default:
            y_status_emulator = 0;
            break;
    }
    TC0_TimerStart();
    
    {
        y_systemCounter = SYSTICK_TickCounterGet();
        z_freq_rpm = 1000.0/ (g_rpm_target*2.0/60.0);
        // Calcola la posizione normalizzata all'interno del periodo (0.0 a 1.0)
        z_normalizedPosition = fmod(y_systemCounter / z_freq_rpm, 1.0);
        if (z_normalizedPosition > 0.5)
        {
            z_normalizedPosition = 1.0 - z_normalizedPosition;
        }
        // Calcola direttamente il valore triangolare
        y_high_time = g_high_time_output1 + 2.0 * (z_normalizedPosition - 0.5);
        if (g_CadenceEnable != 0)
        {
            y_low_time1 = g_low_time1_output1 + (uint32_t)(2.0 * (g_cadence_amplitude_output1 * (z_normalizedPosition - 0.5) + g_cadence_amplitude_output1/2.0 ));
            y_low_time2 = g_low_time2_output1 - (uint32_t)(2.0 * (g_cadence_amplitude_output1 * (z_normalizedPosition - 0.5) + g_cadence_amplitude_output1/2.0));   
        }
        else
        {
            y_low_time1 = g_low_time1_output1 + (uint32_t)(2.0 * (z_normalizedPosition - 0.5));
            y_low_time2 = g_low_time2_output1 - (uint32_t)(2.0 * (z_normalizedPosition - 0.5));
        }
    }
}

static void TC2_PWMin_Timer(TC_TIMER_STATUS status, uintptr_t context)
{
    static uint32_t y2_status_emulator = 0;
    static uint32_t y2_high_time = 10000;
    static uint32_t y2_low_time = 10000;
    static uint32_t y2_systemCounter = 0;
    static float z2_freq_rpm = 0;
    static float z2_normalizedPosition = 0;

    switch (y2_status_emulator){
        case 0:            
            TC2_Timer32bitPeriodSet(y2_high_time);            
            y2_status_emulator++;
            OUTPUT2_Set();
            break;
        case 1:
            TC2_Timer32bitPeriodSet(y2_low_time);
            y2_status_emulator=0;
            OUTPUT2_Clear();
            break;
        default:
            y2_status_emulator = 0;
            break;
    }
    TC2_TimerStart();
    
    {
        y2_systemCounter = SYSTICK_TickCounterGet();
        z2_freq_rpm = 1000.0/ (g_rpm_target*2.0/60.0);
        // Calcola la posizione normalizzata all'interno del periodo (0.0 a 1.0)
        z2_normalizedPosition = fmod(y2_systemCounter / z2_freq_rpm, 1.0);
        if (z2_normalizedPosition > 0.5)
        {
            z2_normalizedPosition = 1.0 - z2_normalizedPosition;
        }
        // Calcola direttamente il valore triangolare
        y2_high_time = g_time_output2 + 2.0 * (z2_normalizedPosition - 0.5);
        if (g_CadenceEnable != 0)
        {
            y2_low_time = g_time_output2 + (uint32_t) (2.0 * (g_cadence_amplitude_output2 * (z2_normalizedPosition - 0.5) + g_cadence_amplitude_output2/2.0 ));
        }
        else
        {
            y2_low_time = g_time_output2 + 2.0 * (z2_normalizedPosition - 0.5);
        }
    }
}

static void wavelength_update (void)
{    
    if (gModeOutput == Spindown_ModeSlowSpeed)
    {
        g_speed_variation_index_target = 0.5;
        g_torque_variation_index_target = 0;
    }
    if (gModeOutput == Spindown_ModeHighSpeed)
    {
        g_speed_variation_index_target = 7;
        g_torque_variation_index_target = 0;        
    }
    
    if ( (g_speed_variation_index - g_speed_variation_index_target) < 0.1 )
    {
        g_speed_variation_index = g_speed_variation_index + g_speed_variation_index * 0.005;
    }
    if (g_speed_variation_index - g_speed_variation_index_target > 0.1 )
    {
        g_speed_variation_index = g_speed_variation_index - g_speed_variation_index * 0.0010;
    }
    if ( (g_torque_variation_index - g_torque_variation_index_target) < 0.015 )
    {
        g_torque_variation_index = g_torque_variation_index + 0.01;
    }
    if ( (g_torque_variation_index - g_torque_variation_index_target) > 0.015 )
    {
        g_torque_variation_index = g_torque_variation_index - 0.01;
    }
    
    uint32_t z_high_time_output1 = g_high_time_output1_default;
    uint32_t z_low_time1_output1 = g_low_time1_output1_default + TORQUE_VARIATION * g_torque_variation_index;
    uint32_t z_low_time2_output1 = g_low_time2_output1_default - TORQUE_VARIATION * g_torque_variation_index;
    
    g_high_time_output1 = z_high_time_output1/(g_speed_variation_index);
    g_low_time1_output1 = z_low_time1_output1/(g_speed_variation_index);
    g_low_time2_output1 = z_low_time2_output1/(g_speed_variation_index);
    
    g_time_output2 = g_time_output2_default/(g_speed_variation_index);
    
    // formula per aumentare il cadenze amplitude a basse velocità, sotto i 15km/h
    if (g_speed_variation_index <=3)
    {
        g_cadence_amplitude_output1 = -900.0*g_speed_variation_index + 2900.0;
    }
    else
    {
        g_cadence_amplitude_output1 = 200.0;
    }
    g_cadence_amplitude_output2 = (float)g_time_output2*0.1;
    
}

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */
void AplStp_Init(void)
{
    TC0_TimerCallbackRegister(TC0_PWMin_Timer, 0);
    TC2_TimerCallbackRegister(TC2_PWMin_Timer, 0);
    DplSpd_Init();
}

void AplStp_EIC_Ex0_Switch_Increase_Speed(uintptr_t context)
{   
    gModeOutput = NormalMode;
    if (g_speed_variation_index_target > 1)
    {
        g_speed_variation_index_target--;
        LED0_Toggle();
    }
}

void AplStp_EIC_Ex1_Switch_Decrease_Speed(uintptr_t context)
{
    gModeOutput = NormalMode;
    if (g_speed_variation_index_target <= 18)
    {
        g_speed_variation_index_target = round(g_speed_variation_index_target) + 1;
        LED0_Toggle();        
    }
}

void AplStp_EIC_Ex2_Switch_Increase_Torque(uintptr_t context)
{
    gModeOutput = NormalMode;
    g_torque_variation_index_target++;
    LED0_Toggle();
}

void AplStp_EIC_Ex3_Switch_Decrease_Torque(uintptr_t context)
{
    gModeOutput = NormalMode;
    if (g_torque_variation_index_target >= 1)
    {
        g_torque_variation_index_target--;
        LED0_Toggle();
    }
}

void AplStp_EIC_Ex4_Switch_Increase_Cadence(uintptr_t context)
{
    gModeOutput = NormalMode;
    g_rpm_target += CADENCE_GAP;
    LED0_Toggle();
}

void AplStp_EIC_Ex5_Switch_Decrease_Cadence(uintptr_t context)
{
    gModeOutput = NormalMode;
    //la cadenza deve essere sempre positiva
    if ((float)g_rpm_target - CADENCE_GAP >= 0)
    {
        g_rpm_target -= CADENCE_GAP;
        LED0_Toggle();
    }
}

SimulationMode AplStp_Get_ModeOutput(void)
{
    return gModeOutput;
}

uint32_t AplStp_Get_CadenceEnable(void)
{
    return g_CadenceEnable;
}


void AplSpd_Mng (void)
{
    static uint32_t yFC1_Status = 0;
    static uint32_t yFC2_Status = 0;
    uint32_t zRulloSelector1 = 0;
    uint32_t zRulloSelector2 = 0;
    
    zRulloSelector1 = (!SW7_01_Get()<<1) | (!SW7_02_Get());    
    switch (zRulloSelector1){
        case 0:
            gRulloSelezionato1 = Avanti;
            break;
        case 1:
            gRulloSelezionato1 = Justo;
            break;
        case 2:
            gRulloSelezionato1 = DiretoXR;
            break;
        case 3:
            gRulloSelezionato1 = Avanti;
            break;
        default:
            gRulloSelezionato1 = Avanti;        
            break;
    }
    zRulloSelector2 = (!SW8_01_Get()<<1) | (!SW8_02_Get());    
    switch (zRulloSelector2){
        case 0:
            gRulloSelezionato2 = Suito;
            break;
        case 1:
            gRulloSelezionato2 = Rivo;
            break;
        case 2:
            gRulloSelezionato2 = Suito;
            break;
        case 3:
            gRulloSelezionato2 = Suito;
            break;
        default:
            gRulloSelezionato2 = Suito;        
            break;
    }
    
    switch (gRulloSelezionato1){
        case Avanti:
            g_high_time_output1_default = DEFAULT_HIGH_TIME * RATIO_DEFAULT_OUTPUT1/RATIO_AVANTI;
            g_low_time1_output1_default = DEFAULT_LOW_TIME1 * RATIO_DEFAULT_OUTPUT1/RATIO_AVANTI;
            g_low_time2_output1_default = DEFAULT_LOW_TIME2 * RATIO_DEFAULT_OUTPUT1/RATIO_AVANTI;
            break;
        case Justo:
            g_high_time_output1_default = DEFAULT_HIGH_TIME * RATIO_DEFAULT_OUTPUT1/RATIO_JUSTO;
            g_low_time1_output1_default = DEFAULT_LOW_TIME1 * RATIO_DEFAULT_OUTPUT1/RATIO_JUSTO;
            g_low_time2_output1_default = DEFAULT_LOW_TIME2 * RATIO_DEFAULT_OUTPUT1/RATIO_JUSTO;
            break;
        case DiretoXR:
            g_high_time_output1_default = DEFAULT_HIGH_TIME * RATIO_DEFAULT_OUTPUT1/RATIO_DIRETO_XR;
            g_low_time1_output1_default = DEFAULT_LOW_TIME1 * RATIO_DEFAULT_OUTPUT1/RATIO_DIRETO_XR;
            g_low_time2_output1_default = DEFAULT_LOW_TIME2 * RATIO_DEFAULT_OUTPUT1/RATIO_DIRETO_XR;
            break;
        default:
            g_high_time_output1_default = DEFAULT_HIGH_TIME;
            g_low_time1_output1_default = DEFAULT_LOW_TIME1;
            g_low_time2_output1_default = DEFAULT_LOW_TIME2;
            break;
    }
    switch (gRulloSelezionato2){
        case Suito:
            g_time_output2_default = DEFAULT_TIME_OUTPUT2 * RATIO_DEFAULT_OUTPUT2/RATIO_SUITO;
            break;
        case Rivo:
            g_time_output2_default = DEFAULT_TIME_OUTPUT2 * RATIO_DEFAULT_OUTPUT2/RATIO_RIVO;
            break;
        default:
            g_time_output2_default = DEFAULT_TIME_OUTPUT2;
            break;
    }
    
    if (FC1_Get() == 0){
        yFC1_Status++;
    }
    else{
        yFC1_Status = 0;
    }
    
    if (FC2_Get() == 0){
        yFC2_Status++;
    }
    else{
        yFC2_Status = 0;
    }
    
    if (yFC1_Status == 5){
        if  (gModeOutput == Spindown_ModeSlowSpeed)
        {
            gModeOutput = Spindown_ModeHighSpeed;
        }
        else
        {
            gModeOutput = Spindown_ModeSlowSpeed;
        }        
    }
    if (yFC2_Status == 5){
        gModeOutput = NormalMode;
    }
    
    
    if (gModeOutput == Spindown_ModeSlowSpeed) {
        g_CadenceEnable = 0;
    }
    else
    {
        if (yFC2_Status == 5) {
            g_CadenceEnable = !g_CadenceEnable;
        }
    }

    
    wavelength_update();
}
/* *****************************************************************************
 End of File
 */
