/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef DPLBRK_H    /* Guard against multiple inclusion */
#define DPLBRK_H

#include "definitions.h"                // SYS function prototypes
/* ************************************************************************** */
/* Section: Defines Files                                                    */
/* ************************************************************************** */
#define DPLBRK_MAX_BRAKE 15000

/* ************************************************************************** */
/* Section: Constants & Data Types                                            */
/* ************************************************************************** */


// *****************************************************************************
// Section: Interface Functions
// *****************************************************************************

uint32_t DplBrk_Init(void);
void DplBrk_SetBrake(uint32_t zBrake);
uint32_t DplBrk_GetBrake( void );

#endif /* DPLBRK_H */

/* *****************************************************************************
 End of File
 */
