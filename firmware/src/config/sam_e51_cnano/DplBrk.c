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
    return 0;
}

void DplBrk_SetBrake(float32_t zBrakePerc)
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
        zActualBreak = (TCC0_REGS->TCC_PER + 1);
    }
    
    TCC0_REGS->TCC_CC[2] = zActualBreak;
}

float32_t DplBrk_GetBrake( void )
{    
    return ((float32_t)TCC0_REGS->TCC_CC[2]/150.0);
}
void DplBrk_BrakeMng( void )
{
    volatile static double zTimer = 0.0;
    volatile static float zSin;
    
    zSin = (double)10.0*sin((double)((double)zTimer/(double)150.0)*2*PI);    
    DplBrk_SetBrake((float)((double)50.0 + zSin));
    
    zTimer = zTimer+1;
}


/* *****************************************************************************
 End of File
 */
