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
    sprintf((char*)guartTxBuffer, "----> INIZIO PROGRAMMA <----\r\n");
    
    DplHmi_init();
    DplHmi_PrintOut(&guartTxBuffer, strlen((const char*)guartTxBuffer));
}

void AplHmiMng (void)
{
    sprintf((char*)guartTxBuffer, "%d\r\n", (int)(DplSpd_GetSpeedData().speedDutyCycle*1000));
    
    DplHmi_PrintOut(guartTxBuffer,strlen((const char*)guartTxBuffer));
}
/* *****************************************************************************
 End of File
 */
