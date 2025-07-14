/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

//DOM-IGNORE-BEGIN 
/*******************************************************************************
* Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
//DOM-IGNORE-END 

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdio.h>
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <string.h>
#include "definitions.h"                // SYS function prototypes

#include "AplHmi.h"
#include "AplSpd.h"
#include "DplBrk.h"
#include "DplSch.h"



static void EIC_User_Handler_Board_Switch(uintptr_t context)
{
    NVIC_SystemReset();
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize(NULL);
    LED0_Clear();
    LED1_Set();
    LED2_Set();
    OUTPUT1_Clear();
    OUTPUT2_Clear();
    
    EIC_CallbackRegister(EIC_PIN_15, EIC_User_Handler_Board_Switch, 0);
    EIC_CallbackRegister(EIC_PIN_11, AplStp_EIC_Ex0_Switch_Increase_Speed, 0);
    EIC_CallbackRegister(EIC_PIN_10, AplStp_EIC_Ex1_Switch_Decrease_Speed, 0);
    EIC_CallbackRegister(EIC_PIN_2, AplStp_EIC_Ex2_Switch_Increase_Torque, 0);
    EIC_CallbackRegister(EIC_PIN_3, AplStp_EIC_Ex3_Switch_Decrease_Torque, 0);
    EIC_CallbackRegister(EIC_PIN_6, AplStp_EIC_Ex4_Switch_Increase_Cadence, 0);
    EIC_CallbackRegister(EIC_PIN_4, AplStp_EIC_Ex5_Switch_Decrease_Cadence, 0);
    SYSTICK_TimerStart();
    
    if (SCB_GetFPUType() != 1)
    {
        while (1)
        {}
    }
    AplHmi_Init();
    AplStp_Init();
    
    SYSTICK_DelayMs(1000);
    LED0_Set();
    LED1_Clear();
    LED2_Clear();
    
    while ( true )
    {
        DplSch_run();
    }

    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}
/*******************************************************************************
 End of File
*/