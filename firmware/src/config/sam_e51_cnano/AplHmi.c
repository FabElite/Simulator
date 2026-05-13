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
#include "AplSpd.h"

#define BOARD_LED_TIMEOUT (19)
#define LED1_TIMEOUT (5)
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
void AplHmi_Init (void)
{
    sprintf((char*)guartTxBuffer, "\r\n----> INIZIO PROGRAMMA <----\r\n");
    
    DplHmi_Init();
    DplHmi_PrintOut(guartTxBuffer, strlen((const char*)guartTxBuffer));
}

void AplHmi_Mng (void)
{
    static uint32_t zContatoreBoardLed = BOARD_LED_TIMEOUT;
    static uint32_t zContatoreLed1 = LED1_TIMEOUT;
    SimulationMode zModeOutput;
    bool z_CadenceEnable;

    zModeOutput = AplStp_Get_ModeOutput();
    z_CadenceEnable = AplStp_Get_CadenceEnable();
    // Gestione della board led
    
    
    LED0_Set();
    if (zContatoreBoardLed != 0){
        zContatoreBoardLed--;
    }
    else{
        LED0_Clear();
        zContatoreBoardLed = BOARD_LED_TIMEOUT;
    }
    
    if  (z_CadenceEnable == 1){
        LED2_Clear();
    }
    else{
        LED2_Set();
    }
    
    if (zModeOutput == Spindown_ModeSlowSpeed)
    {
        if (zContatoreLed1 != 0){
            zContatoreLed1--;
        }
        else{
            LED1_Toggle();
            zContatoreLed1 = LED1_TIMEOUT;
        }
    }
    else if (zModeOutput == Spindown_ModeHighSpeed)
    {
        LED1_Toggle();
    }
    else
    {   
        LED1_Clear();
        /*
        //static uint32_t zContatore1Led1 = 19;
        static uint32_t zContatore1Led2 = 19;
        static uint32_t zCiclo = 0;
        LED1_Clear();
        if (zContatore1Led1 != 0){
            zContatore1Led1--;
        }
        else{
            LED1_Set();
            zContatore1Led1 = 9;
        }
        
        if (zCiclo < 5)
        {
            LED2_Clear();
            if (zContatore1Led2 != 0){
                zContatore1Led2--;
            }
            else{
                LED2_Set();
                zCiclo++;
                zContatore1Led2 = 19;
            }
        }
        else
        {
            LED2_Clear();
            if (zContatore1Led2 != 0){
                zContatore1Led2--;
            }
            else{
                LED2_Toggle();
                zCiclo++;
                zContatore1Led2 = 1;
            }
            if (zCiclo > 15)
            {
                zCiclo = 0;
            }                
        }*/
    }
    

    //sprintf((char*)guartTxBuffer, "\r\n----> prova <----\r\n");
    //DplHmi_PrintOut(guartTxBuffer, strlen((const char*)guartTxBuffer));
}
/* *****************************************************************************
 End of File
 */
