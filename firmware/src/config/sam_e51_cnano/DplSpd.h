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
typedef struct speed_data
{
    float pwm_period_ms;
    float pwm_high_time_ms;
    float speedDutyCycle;
    uint32_t counterNewData;
} speed_data;



// *****************************************************************************
// Section: Interface Functions
// *****************************************************************************

uint32_t DplSpd_Init(void);

speed_data DplSpd_GetSpeedData(void);

#endif /* DPLSPD_H */

/* *****************************************************************************
 End of File
 */
