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
#define DEFAULT_PWM_INPUT_PERIOD (2000)
#define PWM_SPEED_MAX_VALUE      (1000)

int global_data;
uint32_t g_pwm_measured_period_us;
uint32_t g_pwm_input_period_us = DEFAULT_PWM_INPUT_PERIOD;
float g_pwm_speed_rpm;

/* ************************************************************************** */
// Section: Local Functions Prototype                                         */
/* ************************************************************************** */
static void EIC_User_Handler_PWM_Speed_Input(uintptr_t pcontext);
/* ************************************************************************** */
// Section: Local Functions Definition                                        */
/* ************************************************************************** */
static void EIC_User_Handler_PWM_Speed_Input(uintptr_t pcontext)
{    
//    static bool y_old_pin_state = false;
//    static uint64_t y_last_t_rising = false;
//    
//    if (PORT_PinRead(PORT_PIN_PA03) == true)
//    {
//        if(y_old_pin_state == false)       //Input changed from 0 to 1.
//        {
//          y_old_pin_state = true;          //Remember current input state.
//          g_pwm_measured_period_us = y_last_t_rising - usTicks;
//          y_last_t_rising = usTicks;
//          LED0_Set();
//        }
//    }
//    else if(y_old_pin_state == true)
//    {
//        y_old_pin_state = false;
//        g_pwm_speed_rpm  = ( (uint64_t)(usTicks - y_last_t_rising) * PWM_SPEED_MAX_VALUE ) / g_pwm_input_period_us;
//        if (g_pwm_speed_rpm > PWM_SPEED_MAX_VALUE)
//        {
//          g_pwm_speed_rpm = PWM_SPEED_MAX_VALUE;
//        }
//        LED0_Clear();
//    }
}

/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
uint32_t DplSpd_Init(void)
{
    EIC_CallbackRegister(EIC_PIN_3,EIC_User_Handler_PWM_Speed_Input, 0);
    return 0;
}


/* *****************************************************************************
 End of File
 */
