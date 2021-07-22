/*******************************************************************************
  Timer/Counter(TCC3) PLIB

  Company
    Microchip Technology Inc.

  File Name
    plib_TCC3.c

  Summary
    TCC3 PLIB Implementation File.

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
#include "plib_tcc3.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data
// *****************************************************************************
// *****************************************************************************

static TCC_CALLBACK_OBJECT TCC3_CallbackObject;
// *****************************************************************************
// *****************************************************************************
// Section: TCC3 Implementation
// *****************************************************************************
// *****************************************************************************

void TCC3_CaptureInitialize( void )
{
    /* Reset TCC */
    TCC3_REGS->TCC_CTRLA = TCC_CTRLA_SWRST_Msk;

    while((TCC3_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_SWRST_Msk) == TCC_SYNCBUSY_SWRST_Msk)
    {
        /* Wait for Write Synchronization */
    }

    /* Configure prescaler, standby & capture mode */
    TCC3_REGS->TCC_CTRLA = TCC_CTRLA_PRESCALER_DIV1 | TCC_CTRLA_PRESCSYNC_PRESC
                                  | TCC_CTRLA_CPTEN0_Msk | TCC_CTRLA_CPTEN1_Msk
                                  | TCC_CTRLA_RUNSTDBY_Msk;


    TCC3_REGS->TCC_EVCTRL = TCC_EVCTRL_TCEI1_Msk | TCC_EVCTRL_EVACT1_PPW | TCC_EVCTRL_MCEI0_Msk | TCC_EVCTRL_MCEI1_Msk;

    /* Clear all interrupt flags */
    TCC3_REGS->TCC_INTFLAG = TCC_INTFLAG_Msk;

    TCC3_CallbackObject.callback_fn = NULL;
    TCC3_REGS->TCC_INTENSET = TCC_INTENSET_MC0_Msk;
    while((TCC3_REGS->TCC_SYNCBUSY) != 0U)
    {
        /* Wait for Write Synchronization */
    }
}


void TCC3_CaptureStart( void )
{
    /* Enable TCC */
    TCC3_REGS->TCC_CTRLA |= TCC_CTRLA_ENABLE_Msk;

    while((TCC3_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_ENABLE_Msk) == TCC_SYNCBUSY_ENABLE_Msk)
    {
        /* Wait for Write Synchronization */
    }
}

void TCC3_CaptureStop( void )
{
    /* Disable TCC */
    TCC3_REGS->TCC_CTRLA &= ~TCC_CTRLA_ENABLE_Msk;

    while((TCC3_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_ENABLE_Msk) == TCC_SYNCBUSY_ENABLE_Msk)
    {
        /* Wait for Write Synchronization */
    }
}


void TCC3_CaptureCommandSet(TCC_COMMAND command)
{
    TCC3_REGS->TCC_CTRLBSET = (uint8_t)((uint32_t)command << TCC_CTRLBSET_CMD_Pos);
    while((TCC3_REGS->TCC_SYNCBUSY) != 0U)
    {
        /* Wait for Write Synchronization */
    }    
}


uint16_t TCC3_Capture16bitValueGet( TCC3_CHANNEL_NUM channel )
{
    return (uint16_t)TCC3_REGS->TCC_CC[channel];
}


uint32_t TCC3_CaptureFrequencyGet( void )
{
    return (uint32_t)(60000000U);
}

/* Get the current counter value */
uint16_t TCC3_Capture16bitCounterGet( void )
{
    /* Write command to force COUNT register read synchronization */
    TCC3_REGS->TCC_CTRLBSET |= (uint8_t)TCC_CTRLBSET_CMD_READSYNC;

    while((TCC3_REGS->TCC_SYNCBUSY & TCC_SYNCBUSY_CTRLB_Msk) == TCC_SYNCBUSY_CTRLB_Msk)
    {
        /* Wait for Write Synchronization */
    }

    while((TCC3_REGS->TCC_CTRLBSET & TCC_CTRLBSET_CMD_Msk) != 0U)
    {
        /* Wait for CMD to become zero */
    }

    /* Read current count value */
    return (uint16_t)TCC3_REGS->TCC_COUNT;
}


/* Register callback function */
void TCC3_CaptureCallbackRegister( TCC_CALLBACK callback, uintptr_t context )
{
    TCC3_CallbackObject.callback_fn = callback;

    TCC3_CallbackObject.context = context;
}


/* Interrupt Handler */
void TCC3_MC0_InterruptHandler(void)
{
    uint32_t status;
    status = (uint32_t)TCC_INTFLAG_MC0_Msk;
    /* Clear interrupt flags */
    TCC3_REGS->TCC_INTFLAG = TCC_INTFLAG_MC0_Msk;
    if (TCC3_CallbackObject.callback_fn != NULL)
    {
        TCC3_CallbackObject.callback_fn(status, TCC3_CallbackObject.context);
}

}


