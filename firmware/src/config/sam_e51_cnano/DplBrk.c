/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite srl

  @File Name
    DplBrk.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include "DplBrk.h"

/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */

/* ************************************************************************** */
// Section: Local Functions Prototype                                         */
/* ************************************************************************** */

/* ************************************************************************** */
// Section: Local Functions Definition                                        */
/* ************************************************************************** */

/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
uint32_t DplBrk_Init(void)
{
    TCC0_PWMStart();
    return 0;
}

void DplBrk_SetBrake(float zBrakePerc)
{
    uint32_t zActualBreak;
    
    if (zBrakePerc < 0)
    {
        zActualBreak = 0;
    }
    else
    {
        zActualBreak = (uint32_t)(zBrakePerc * 150);
    }
    
    // controllo che il valore di massimo freno non superi il massimo assoluto
    if (zActualBreak > (TCC0_REGS->TCC_PER + 1) )
    {
        zActualBreak = (TCC0_REGS->TCC_PER+ 1);
    }
    
    TCC0_REGS->TCC_CC[2] = zActualBreak;
}

float DplBrk_GetBrake( void )
{    
    return ((float)TCC0_REGS->TCC_CC[2]/150.0);
}



/* *****************************************************************************
 End of File
 */
