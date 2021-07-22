/*******************************************************************************
  Timer/Counter(TCC4) PLIB

  Company
    Microchip Technology Inc.

  File Name
    plib_TCC4.c

  Summary
    TCC4 PLIB Implementation File.

  Description
    This file defines the interface to the TCC peripheral library. This
    library provides access to and control of the associated peripheral
    instance.

  Remarks:
    None.

*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
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
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
/* This section lists the other files that are included in this file.
*/
#include "interrupts.h"
#include "plib_tcc4.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data
// *****************************************************************************
// *****************************************************************************

static TCC_CALLBACK_OBJECT TCC4_CallbackObject;
// *****************************************************************************
// *****************************************************************************
// Section: TCC4 Implementation
// *****************************************************************************
// *****************************************************************************

void TCC4_CaptureInitialize( void )
{
    /* Reset TCC */
    TCC4_REGS->TCC_CTRLA = TCC_CTRLA_SWRST_Msk;

    while((TCC4_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_SWRST_Msk) == TCC_SYNCBUSY_SWRST_Msk)
    {
        /* Wait for Write Synchronization */
    }

    /* Configure prescaler, standby & capture mode */
    TCC4_REGS->TCC_CTRLA = TCC_CTRLA_PRESCALER_DIV1 | TCC_CTRLA_PRESCSYNC_PRESC
                                  | TCC_CTRLA_CPTEN0_Msk | TCC_CTRLA_CPTEN1_Msk
                                  | TCC_CTRLA_RUNSTDBY_Msk;


    TCC4_REGS->TCC_EVCTRL = TCC_EVCTRL_TCEI1_Msk | TCC_EVCTRL_EVACT1_PWP| TCC_EVCTRL_TCINV1_Msk | TCC_EVCTRL_MCEI0_Msk | TCC_EVCTRL_MCEI1_Msk;

    /* Clear all interrupt flags */
    TCC4_REGS->TCC_INTFLAG = TCC_INTFLAG_Msk;

    TCC4_CallbackObject.callback_fn = NULL;
    TCC4_REGS->TCC_INTENSET = TCC_INTENSET_MC0_Msk;
    while((TCC4_REGS->TCC_SYNCBUSY) != 0U)
    {
        /* Wait for Write Synchronization */
    }
}


void TCC4_CaptureStart( void )
{
    /* Enable TCC */
    TCC4_REGS->TCC_CTRLA |= TCC_CTRLA_ENABLE_Msk;

    while((TCC4_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_ENABLE_Msk) == TCC_SYNCBUSY_ENABLE_Msk)
    {
        /* Wait for Write Synchronization */
    }
}

void TCC4_CaptureStop( void )
{
    /* Disable TCC */
    TCC4_REGS->TCC_CTRLA &= ~TCC_CTRLA_ENABLE_Msk;

    while((TCC4_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_ENABLE_Msk) == TCC_SYNCBUSY_ENABLE_Msk)
    {
        /* Wait for Write Synchronization */
    }
}


void TCC4_CaptureCommandSet(TCC_COMMAND command)
{
    TCC4_REGS->TCC_CTRLBSET = (uint8_t)((uint32_t)command << TCC_CTRLBSET_CMD_Pos);
    while((TCC4_REGS->TCC_SYNCBUSY) != 0U)
    {
        /* Wait for Write Synchronization */
    }    
}


uint16_t TCC4_Capture16bitValueGet( TCC4_CHANNEL_NUM channel )
{
    return (uint16_t)TCC4_REGS->TCC_CC[channel];
}


uint32_t TCC4_CaptureFrequencyGet( void )
{
    return (uint32_t)(60000000U);
}

/* Get the current counter value */
uint16_t TCC4_Capture16bitCounterGet( void )
{
    /* Write command to force COUNT register read synchronization */
    TCC4_REGS->TCC_CTRLBSET |= (uint8_t)TCC_CTRLBSET_CMD_READSYNC;

    while((TCC4_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_CTRLB_Msk) == TCC_SYNCBUSY_CTRLB_Msk)
    {
        /* Wait for Write Synchronization */
    }

    while((TCC4_REGS->TCC_CTRLBSET & TCC_CTRLBSET_CMD_Msk) != 0U)
    {
        /* Wait for CMD to become zero */
    }

    /* Read current count value */
    return (uint16_t)TCC4_REGS->TCC_COUNT;
}


/* Register callback function */
void TCC4_CaptureCallbackRegister( TCC_CALLBACK callback, uintptr_t context )
{
    TCC4_CallbackObject.callback_fn = callback;

    TCC4_CallbackObject.context = context;
}


/* Interrupt Handler */
void TCC4_MC0_InterruptHandler(void)
{
    uint32_t status;
    status = (uint32_t)TCC_INTFLAG_MC0_Msk;
    /* Clear interrupt flags */
    TCC4_REGS->TCC_INTFLAG = TCC_INTFLAG_MC0_Msk;
    if (TCC4_CallbackObject.callback_fn != NULL)
    {
        TCC4_CallbackObject.callback_fn(status, TCC4_CallbackObject.context);
    }

}
  

