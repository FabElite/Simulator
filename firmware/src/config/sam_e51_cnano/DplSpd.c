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

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
speed_data g_speed_data;
float g_TickTomsConstant;
/* ************************************************************************** */
// Section: Local Functions Prototype                                         */
/* ************************************************************************** */
static void TC0_test_handler(TC_CAPTURE_STATUS zStatus, uintptr_t context);
/* ************************************************************************** */
// Section: Local Functions Definition                                        */
/* ************************************************************************** */
static void TC0_test_handler(TC_CAPTURE_STATUS zStatus, uintptr_t context)
{
    if (zStatus == (TC_CAPTURE_STATUS_CAPTURE0_READY | TC_CAPTURE_STATUS_CAPTURE1_READY) )
    {
        g_speed_data.pwm_high_time_ms = (float)TC0_Capture16bitChannel0Get()*g_TickTomsConstant;
        g_speed_data.pwm_period_ms = (float)TC0_Capture16bitChannel1Get()*g_TickTomsConstant;
        g_speed_data.speedDutyCycle = (g_speed_data.pwm_high_time_ms)/(g_speed_data.pwm_period_ms);
    }
}

/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
uint32_t DplSpd_Init(void)
{
    g_TickTomsConstant = ((float)1000000.0/(float)TC0_CaptureFrequencyGet());
    TC0_CaptureCallbackRegister(TC0_test_handler, 0);
    TC0_CaptureStart();
    return 0;
}

speed_data DplSpd_GetSpeedData(void)
{
    return (g_speed_data);
}
/* *****************************************************************************
 End of File
 */
