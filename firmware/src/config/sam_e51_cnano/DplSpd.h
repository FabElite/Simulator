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

#ifndef DPLSPD_H    /* Guard against multiple inclusion */
#define DPLSPD_H


/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include "definitions.h"                // SYS function prototypes

/* ************************************************************************** */
/* Section: Constants & Data Types                                            */
/* ************************************************************************** */



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
uint32_t DplSpd_Init(void);

#endif /* DPLSPD_H */

/* *****************************************************************************
 End of File
 */
