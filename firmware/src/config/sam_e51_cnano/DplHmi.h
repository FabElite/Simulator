/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite srl

  @File Name
    DplHmi.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef DPLHMI_H    /* Guard against multiple inclusion */
#define DPLHMI_H

#include <stdio.h>
#include "definitions.h" 

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
void DplHmi_Init(void);
bool DplHmi_PrintOut(const void  *pstringPointer, uint32_t zSize);
#endif /* DPLHMI_H */

/* *****************************************************************************
 End of File
 */
