/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    DplSystick.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef DPLSYSTICK_H    /* Guard against multiple inclusion */
#define DPLSYSTICK_H


/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include "definitions.h"

/* ************************************************************************** */
/* Section: Constants & Data Types                                            */
/* ************************************************************************** */
extern uint32_t usTicks;


// *****************************************************************************
// Section: Interface Functions
// *****************************************************************************

// *****************************************************************************
/**
  @Function
    int ExampleFunctionName ( int param1, int param2 ) 
  @Summary
    Brief one-line description of the function.
  @Description


  @Parameters
    @param param1 Describe the first parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>
 */
int DplSYSTICK_Init(void);

#endif /* DPLSPD_H */

/* *****************************************************************************
 End of File
 */
