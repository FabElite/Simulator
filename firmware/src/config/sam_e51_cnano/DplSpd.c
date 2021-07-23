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

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
#define PWM_SPEED_MAX_VALUE      (1000)

float g_pwm_period_ms;
float g_pwm_high_time_ms;
float g_SpeedDutyCycle;

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
        g_pwm_high_time_ms = (float)TC0_Capture16bitChannel0Get()*(32.0/30.0);
        g_pwm_period_ms = (float)TC0_Capture16bitChannel1Get()*(32.0/30.0);
        g_SpeedDutyCycle = g_pwm_high_time_ms/g_pwm_period_ms;
    }
}

/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
uint32_t DplSpd_Init(void)
{
    TC0_CaptureCallbackRegister(TC0_test_handler, 0);
    TC0_CaptureStart();
    return 0;
}


/* *****************************************************************************
 End of File
 */
