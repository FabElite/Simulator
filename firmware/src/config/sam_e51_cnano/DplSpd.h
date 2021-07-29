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
typedef struct raw_speed_sample{
    float32_t speedDutyCycle;
    uint32_t acquisition_time_ms;
} raw_speed_sample;

typedef struct raw_speed_data
{
    float32_t pwm_period_ms;
    float32_t pwm_high_time_ms;
    float32_t speedDutyCycle;
    uint32_t acquisition_time_ms;
    uint32_t counterNewData;
} raw_speed_data;



// *****************************************************************************
// Section: Interface Functions
// *****************************************************************************

void DplSpd_Init(void);

raw_speed_data DplSpd_GetSpeedData(void);

#endif /* DPLSPD_H */

/* *****************************************************************************
 End of File
 */
