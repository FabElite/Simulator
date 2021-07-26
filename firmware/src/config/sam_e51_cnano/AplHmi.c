/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite srl

  @File Name
    AplHmi.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include "AplHmi.h"
#include "DplHmi.h"
#include "DplSpd.h"

#define BOARD_LED_TIMEOUT (9)
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
static uint8_t guartTxBuffer[100];

/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */

/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
void AplHmi_init (void)
{
    sprintf((char*)guartTxBuffer, "\r\n----> INIZIO PROGRAMMA <----\r\n");
    
    DplHmi_Init();
    DplHmi_PrintOut(&guartTxBuffer, strlen((const char*)guartTxBuffer));
}

void AplHmiMng (void)
{
    static uint32_t zContatoreBoardLed = BOARD_LED_TIMEOUT;
    
    // Gestione della board led
    LED0_Set();
    if (zContatoreBoardLed != 0)
    {
        zContatoreBoardLed--;
    }
    else
    {
        LED0_Clear();
        zContatoreBoardLed = BOARD_LED_TIMEOUT;
    }
    
    // Stampo la stringa di interesse ogni 100ms.
    sprintf((char*)guartTxBuffer, "\n\r%f;%f;%f", (float)(DplSpd_GetSpeedData().speedDutyCycle*1000), DplSpd_GetSpeedData().pwm_high_time_ms,DplSpd_GetSpeedData().pwm_period_ms);
    DplHmi_PrintOut(guartTxBuffer,strlen((const char*)guartTxBuffer));
}
/* *****************************************************************************
 End of File
 */
