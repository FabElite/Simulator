/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite s.r.l.

  @File Name
    AplSpd.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef APLSPD_H
#define APLSPD_H

#include "definitions.h" 
/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Constants                                                         */
/* ************************************************************************** */
/* ************************************************************************** */

// *****************************************************************************
// *****************************************************************************
// Section: Data Types
// *****************************************************************************
// *****************************************************************************

typedef enum SimulationMode{NormalMode,Spindown_ModeSlowSpeed, Spindown_ModeHighSpeed} SimulationMode;
typedef enum RulloOTSType{Avanti, Justo, DiretoXR} RulloOTSType;
typedef enum RulloNOOTSType{Suito, Rivo} RulloNOOTSType;
// *****************************************************************************
// *****************************************************************************
// Section: Interface Functions
// *****************************************************************************
// *****************************************************************************
void AplStp_Init(void);
uint32_t AplStp_GetIntertempo1(void);
uint32_t AplStp_GetIntertempo2(void);
void AplStp_EIC_Ex0_Switch_Increase_Speed(uintptr_t context);
void AplStp_EIC_Ex1_Switch_Decrease_Speed(uintptr_t context);
void AplStp_EIC_Ex2_Switch_Increase_Torque(uintptr_t context);
void AplStp_EIC_Ex3_Switch_Decrease_Torque(uintptr_t context);
void AplStp_EIC_Ex4_Switch_Increase_Cadence(uintptr_t context);
void AplStp_EIC_Ex5_Switch_Decrease_Cadence(uintptr_t context);
SimulationMode AplStp_Get_ModeOutput(void);
uint32_t AplStp_Get_CadenceEnable(void);
void AplSpd_Mng (void);
#endif /* APLSPD_H */

/* *****************************************************************************
 End of File
 */
