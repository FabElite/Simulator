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
#include "peripheral/systick/plib_systick.h"
#include "DplSpd.h"
#include "peripheral/tc/plib_tc0.h"
#include "peripheral/tc/plib_tc1.h"
#include "arm_math.h"

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
#define DUTYTOKMH   (600/8.05)
#define MAXSPEEDKMH   DUTYTOKMH
float32_t g_TickTomsConstant;
raw_speed_data g_new_speed_data;
bool gNewDataReady = true;
/* ************************************************************************** */
// Section: Local Functions Prototype                                         */
/* ************************************************************************** */

/* ************************************************************************** */
// Section: Local Functions Definition                                        */
/* ************************************************************************** */
//static void TC1_PWMin_Timer(TC_TIMER_STATUS status, uintptr_t context)
//{
//    __NOP();
//    __NOP();
//    __NOP();
//    __NOP();
//}
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
void DplSpd_Init()
{
    TC0_CompareStart();
    TC2_CompareStart();
}

bool DplSpd_IsThereNewData(void)
{
    return (gNewDataReady);
}

raw_speed_data DplSpd_GetNewSpeedData(void)
{
    gNewDataReady = false;
    return (g_new_speed_data);
}

/* *****************************************************************************
 End of File
 */
