/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite srl

  @File Name
    DplSpd.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include "DplSpd.h"
#include "peripheral/tc/plib_tc0.h"
#include "peripheral/tc/plib_tc1.h"

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
speed_data g_speed_data;
float g_TickTomsConstant;
/* ************************************************************************** */
// Section: Local Functions Prototype                                         */
/* ************************************************************************** */
static void TC0_PWMin_Capture(TC_CAPTURE_STATUS zStatus, uintptr_t context);
static void TC1_PWMin_Timer(TC_TIMER_STATUS status, uintptr_t context);
/* ************************************************************************** */
// Section: Local Functions Definition                                        */
/* ************************************************************************** */
static void TC0_PWMin_Capture(TC_CAPTURE_STATUS zStatus, uintptr_t context)
{
    if (zStatus == (TC_CAPTURE_STATUS_CAPTURE0_READY | TC_CAPTURE_STATUS_CAPTURE1_READY) )
    {
        g_speed_data.pwm_high_time_ms = (float)TC0_Capture16bitChannel0Get()*g_TickTomsConstant;
        g_speed_data.pwm_period_ms = (float)TC0_Capture16bitChannel1Get()*g_TickTomsConstant;
        g_speed_data.speedDutyCycle = (g_speed_data.pwm_high_time_ms)/(g_speed_data.pwm_period_ms);
        g_speed_data.counterNewData++;
    }
}

static void TC1_PWMin_Timer(TC_TIMER_STATUS status, uintptr_t context)
{
    static uint32_t yOldCounterNewData;
    
    if (yOldCounterNewData == g_speed_data.counterNewData)
    {
        g_speed_data.pwm_high_time_ms = 0;
        g_speed_data.pwm_period_ms = 0;
        
        if (PORT_PinRead(PORT_PIN_PA02) == 1)
        {
            g_speed_data.speedDutyCycle = 1;
        }
        else
        {
            g_speed_data.speedDutyCycle = 0;
        }
    }
    yOldCounterNewData = g_speed_data.counterNewData;
}
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
uint32_t DplSpd_Init(void)
{
    g_TickTomsConstant = ((float)1000000.0/(float)TC0_CaptureFrequencyGet());
    TC0_CaptureCallbackRegister(TC0_PWMin_Capture, 0);
    TC0_CaptureStart();
    TC1_TimerCallbackRegister(TC1_PWMin_Timer, 0);
    TC1_TimerStart();
    return 0;
}

speed_data DplSpd_GetSpeedData(void)
{
    return (g_speed_data);
}
/* *****************************************************************************
 End of File
 */
