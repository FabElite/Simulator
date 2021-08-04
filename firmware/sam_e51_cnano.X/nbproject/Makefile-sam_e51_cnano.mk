#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-sam_e51_cnano.mk)" "nbproject/Makefile-local-sam_e51_cnano.mk"
include nbproject/Makefile-local-sam_e51_cnano.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sam_e51_cnano
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/sam_e51_cnano/AplHmi.c ../src/config/sam_e51_cnano/AplSpd.c ../src/config/sam_e51_cnano/DplSpd.c ../src/config/sam_e51_cnano/DplBrk.c ../src/config/sam_e51_cnano/DplSch.c ../src/config/sam_e51_cnano/DplHmi.c ../src/config/sam_e51_cnano/peripheral/clock/plib_clock.c ../src/config/sam_e51_cnano/peripheral/cmcc/plib_cmcc.c ../src/config/sam_e51_cnano/peripheral/dmac/plib_dmac.c ../src/config/sam_e51_cnano/peripheral/eic/plib_eic.c ../src/config/sam_e51_cnano/peripheral/evsys/plib_evsys.c ../src/config/sam_e51_cnano/peripheral/nvic/plib_nvic.c ../src/config/sam_e51_cnano/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_e51_cnano/peripheral/port/plib_port.c ../src/config/sam_e51_cnano/peripheral/sercom/usart/plib_sercom5_usart.c ../src/config/sam_e51_cnano/peripheral/systick/plib_systick.c ../src/config/sam_e51_cnano/peripheral/tc/plib_tc0.c ../src/config/sam_e51_cnano/peripheral/tc/plib_tc1.c ../src/config/sam_e51_cnano/peripheral/tc/plib_tc2.c ../src/config/sam_e51_cnano/peripheral/tcc/plib_tcc0.c ../src/config/sam_e51_cnano/stdio/xc32_monitor.c ../src/config/sam_e51_cnano/initialization.c ../src/config/sam_e51_cnano/interrupts.c ../src/config/sam_e51_cnano/exceptions.c ../src/config/sam_e51_cnano/startup_xc32.c ../src/config/sam_e51_cnano/libc_syscalls.c ../src/main_sam_e51_cnano.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/570918426/AplHmi.o ${OBJECTDIR}/_ext/570918426/AplSpd.o ${OBJECTDIR}/_ext/570918426/DplSpd.o ${OBJECTDIR}/_ext/570918426/DplBrk.o ${OBJECTDIR}/_ext/570918426/DplSch.o ${OBJECTDIR}/_ext/570918426/DplHmi.o ${OBJECTDIR}/_ext/7187140/plib_clock.o ${OBJECTDIR}/_ext/831051564/plib_cmcc.o ${OBJECTDIR}/_ext/831021835/plib_dmac.o ${OBJECTDIR}/_ext/1220119669/plib_eic.o ${OBJECTDIR}/_ext/9336626/plib_evsys.o ${OBJECTDIR}/_ext/830715028/plib_nvic.o ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o ${OBJECTDIR}/_ext/830661877/plib_port.o ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o ${OBJECTDIR}/_ext/8444704/plib_systick.o ${OBJECTDIR}/_ext/1900303495/plib_tc0.o ${OBJECTDIR}/_ext/1900303495/plib_tc1.o ${OBJECTDIR}/_ext/1900303495/plib_tc2.o ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o ${OBJECTDIR}/_ext/865175840/xc32_monitor.o ${OBJECTDIR}/_ext/570918426/initialization.o ${OBJECTDIR}/_ext/570918426/interrupts.o ${OBJECTDIR}/_ext/570918426/exceptions.o ${OBJECTDIR}/_ext/570918426/startup_xc32.o ${OBJECTDIR}/_ext/570918426/libc_syscalls.o ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/570918426/AplHmi.o.d ${OBJECTDIR}/_ext/570918426/AplSpd.o.d ${OBJECTDIR}/_ext/570918426/DplSpd.o.d ${OBJECTDIR}/_ext/570918426/DplBrk.o.d ${OBJECTDIR}/_ext/570918426/DplSch.o.d ${OBJECTDIR}/_ext/570918426/DplHmi.o.d ${OBJECTDIR}/_ext/7187140/plib_clock.o.d ${OBJECTDIR}/_ext/831051564/plib_cmcc.o.d ${OBJECTDIR}/_ext/831021835/plib_dmac.o.d ${OBJECTDIR}/_ext/1220119669/plib_eic.o.d ${OBJECTDIR}/_ext/9336626/plib_evsys.o.d ${OBJECTDIR}/_ext/830715028/plib_nvic.o.d ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/830661877/plib_port.o.d ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o.d ${OBJECTDIR}/_ext/8444704/plib_systick.o.d ${OBJECTDIR}/_ext/1900303495/plib_tc0.o.d ${OBJECTDIR}/_ext/1900303495/plib_tc1.o.d ${OBJECTDIR}/_ext/1900303495/plib_tc2.o.d ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o.d ${OBJECTDIR}/_ext/865175840/xc32_monitor.o.d ${OBJECTDIR}/_ext/570918426/initialization.o.d ${OBJECTDIR}/_ext/570918426/interrupts.o.d ${OBJECTDIR}/_ext/570918426/exceptions.o.d ${OBJECTDIR}/_ext/570918426/startup_xc32.o.d ${OBJECTDIR}/_ext/570918426/libc_syscalls.o.d ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/570918426/AplHmi.o ${OBJECTDIR}/_ext/570918426/AplSpd.o ${OBJECTDIR}/_ext/570918426/DplSpd.o ${OBJECTDIR}/_ext/570918426/DplBrk.o ${OBJECTDIR}/_ext/570918426/DplSch.o ${OBJECTDIR}/_ext/570918426/DplHmi.o ${OBJECTDIR}/_ext/7187140/plib_clock.o ${OBJECTDIR}/_ext/831051564/plib_cmcc.o ${OBJECTDIR}/_ext/831021835/plib_dmac.o ${OBJECTDIR}/_ext/1220119669/plib_eic.o ${OBJECTDIR}/_ext/9336626/plib_evsys.o ${OBJECTDIR}/_ext/830715028/plib_nvic.o ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o ${OBJECTDIR}/_ext/830661877/plib_port.o ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o ${OBJECTDIR}/_ext/8444704/plib_systick.o ${OBJECTDIR}/_ext/1900303495/plib_tc0.o ${OBJECTDIR}/_ext/1900303495/plib_tc1.o ${OBJECTDIR}/_ext/1900303495/plib_tc2.o ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o ${OBJECTDIR}/_ext/865175840/xc32_monitor.o ${OBJECTDIR}/_ext/570918426/initialization.o ${OBJECTDIR}/_ext/570918426/interrupts.o ${OBJECTDIR}/_ext/570918426/exceptions.o ${OBJECTDIR}/_ext/570918426/startup_xc32.o ${OBJECTDIR}/_ext/570918426/libc_syscalls.o ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o

# Source Files
SOURCEFILES=../src/config/sam_e51_cnano/AplHmi.c ../src/config/sam_e51_cnano/AplSpd.c ../src/config/sam_e51_cnano/DplSpd.c ../src/config/sam_e51_cnano/DplBrk.c ../src/config/sam_e51_cnano/DplSch.c ../src/config/sam_e51_cnano/DplHmi.c ../src/config/sam_e51_cnano/peripheral/clock/plib_clock.c ../src/config/sam_e51_cnano/peripheral/cmcc/plib_cmcc.c ../src/config/sam_e51_cnano/peripheral/dmac/plib_dmac.c ../src/config/sam_e51_cnano/peripheral/eic/plib_eic.c ../src/config/sam_e51_cnano/peripheral/evsys/plib_evsys.c ../src/config/sam_e51_cnano/peripheral/nvic/plib_nvic.c ../src/config/sam_e51_cnano/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_e51_cnano/peripheral/port/plib_port.c ../src/config/sam_e51_cnano/peripheral/sercom/usart/plib_sercom5_usart.c ../src/config/sam_e51_cnano/peripheral/systick/plib_systick.c ../src/config/sam_e51_cnano/peripheral/tc/plib_tc0.c ../src/config/sam_e51_cnano/peripheral/tc/plib_tc1.c ../src/config/sam_e51_cnano/peripheral/tc/plib_tc2.c ../src/config/sam_e51_cnano/peripheral/tcc/plib_tcc0.c ../src/config/sam_e51_cnano/stdio/xc32_monitor.c ../src/config/sam_e51_cnano/initialization.c ../src/config/sam_e51_cnano/interrupts.c ../src/config/sam_e51_cnano/exceptions.c ../src/config/sam_e51_cnano/startup_xc32.c ../src/config/sam_e51_cnano/libc_syscalls.c ../src/main_sam_e51_cnano.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=ATSAME51J20A
ProjectDir="C:\Users\fossato\Documents\Repo\SAME51_VolanoVirtuale\firmware\sam_e51_cnano.X"
ProjectName=getting_started_sam_e51_cnano
ConfName=sam_e51_cnano
ImagePath="dist\sam_e51_cnano\${IMAGE_TYPE}\sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\sam_e51_cnano\${IMAGE_TYPE}"
ImageName="sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-sam_e51_cnano.mk dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [rm -rf ${ProjectDir}/../../hex && mkdir ${ProjectDir}/../../hex && cp ${ProjectDir}/${ImagePath} ${ProjectDir}/../../hex/]"
	@rm -rf ${ProjectDir}/../../hex && mkdir ${ProjectDir}/../../hex && cp ${ProjectDir}/${ImagePath} ${ProjectDir}/../../hex/
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=ATSAME51J20A
MP_LINKER_FILE_OPTION=,--script="..\src\config\sam_e51_cnano\ATSAME51J20A.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/570918426/AplHmi.o: ../src/config/sam_e51_cnano/AplHmi.c  .generated_files/flags/sam_e51_cnano/fa000de36d8cc3e166999ca314b3fecea0fcd11d .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplHmi.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplHmi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/AplHmi.o.d" -o ${OBJECTDIR}/_ext/570918426/AplHmi.o ../src/config/sam_e51_cnano/AplHmi.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/AplSpd.o: ../src/config/sam_e51_cnano/AplSpd.c  .generated_files/flags/sam_e51_cnano/a5c10d66f2dadcbfafc6d139b300650b2f8a0d57 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplSpd.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplSpd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/AplSpd.o.d" -o ${OBJECTDIR}/_ext/570918426/AplSpd.o ../src/config/sam_e51_cnano/AplSpd.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplSpd.o: ../src/config/sam_e51_cnano/DplSpd.c  .generated_files/flags/sam_e51_cnano/9cb83f8551ada31a52f18cd9b1297eefcf097ed6 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSpd.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSpd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplSpd.o.d" -o ${OBJECTDIR}/_ext/570918426/DplSpd.o ../src/config/sam_e51_cnano/DplSpd.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplBrk.o: ../src/config/sam_e51_cnano/DplBrk.c  .generated_files/flags/sam_e51_cnano/ecf34764e07819b7324acc690f38115928b7792 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplBrk.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplBrk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplBrk.o.d" -o ${OBJECTDIR}/_ext/570918426/DplBrk.o ../src/config/sam_e51_cnano/DplBrk.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplSch.o: ../src/config/sam_e51_cnano/DplSch.c  .generated_files/flags/sam_e51_cnano/e5f9ca1aefa94a0db6644f929e0774c3bb408c2f .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSch.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSch.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplSch.o.d" -o ${OBJECTDIR}/_ext/570918426/DplSch.o ../src/config/sam_e51_cnano/DplSch.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplHmi.o: ../src/config/sam_e51_cnano/DplHmi.c  .generated_files/flags/sam_e51_cnano/65c9cbf93dc133618f8ce7c362f5c707865c1a31 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplHmi.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplHmi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplHmi.o.d" -o ${OBJECTDIR}/_ext/570918426/DplHmi.o ../src/config/sam_e51_cnano/DplHmi.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/7187140/plib_clock.o: ../src/config/sam_e51_cnano/peripheral/clock/plib_clock.c  .generated_files/flags/sam_e51_cnano/674b8f50c0d08f9fde2d93a370e07c506adfdee2 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/7187140" 
	@${RM} ${OBJECTDIR}/_ext/7187140/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/7187140/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/7187140/plib_clock.o.d" -o ${OBJECTDIR}/_ext/7187140/plib_clock.o ../src/config/sam_e51_cnano/peripheral/clock/plib_clock.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/831051564/plib_cmcc.o: ../src/config/sam_e51_cnano/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/sam_e51_cnano/a43b0f2ca4bf22157b8596471c1ad702d84c43da .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/831051564" 
	@${RM} ${OBJECTDIR}/_ext/831051564/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/831051564/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/831051564/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/831051564/plib_cmcc.o ../src/config/sam_e51_cnano/peripheral/cmcc/plib_cmcc.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/831021835/plib_dmac.o: ../src/config/sam_e51_cnano/peripheral/dmac/plib_dmac.c  .generated_files/flags/sam_e51_cnano/353275711a0d0e9eac723987f622b9ccd0740f60 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/831021835" 
	@${RM} ${OBJECTDIR}/_ext/831021835/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/831021835/plib_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/831021835/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/831021835/plib_dmac.o ../src/config/sam_e51_cnano/peripheral/dmac/plib_dmac.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1220119669/plib_eic.o: ../src/config/sam_e51_cnano/peripheral/eic/plib_eic.c  .generated_files/flags/sam_e51_cnano/71cc97fb1350c85556fd070ed3579b904660fac7 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1220119669" 
	@${RM} ${OBJECTDIR}/_ext/1220119669/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1220119669/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1220119669/plib_eic.o.d" -o ${OBJECTDIR}/_ext/1220119669/plib_eic.o ../src/config/sam_e51_cnano/peripheral/eic/plib_eic.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/9336626/plib_evsys.o: ../src/config/sam_e51_cnano/peripheral/evsys/plib_evsys.c  .generated_files/flags/sam_e51_cnano/91af081847e71cb180418475e1d562458417f3f2 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/9336626" 
	@${RM} ${OBJECTDIR}/_ext/9336626/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/9336626/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/9336626/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/9336626/plib_evsys.o ../src/config/sam_e51_cnano/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/830715028/plib_nvic.o: ../src/config/sam_e51_cnano/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e51_cnano/bd6c866d4efb5dab5dc6e13cb15cdc1271529b48 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/830715028" 
	@${RM} ${OBJECTDIR}/_ext/830715028/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/830715028/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/830715028/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/830715028/plib_nvic.o ../src/config/sam_e51_cnano/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o: ../src/config/sam_e51_cnano/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/sam_e51_cnano/b8313ec2f05f8d82d3193980933f71b51329c488 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/226030394" 
	@${RM} ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o ../src/config/sam_e51_cnano/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/830661877/plib_port.o: ../src/config/sam_e51_cnano/peripheral/port/plib_port.c  .generated_files/flags/sam_e51_cnano/be79be7ab43bf1879b06c9db5860ca1385c7873b .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/830661877" 
	@${RM} ${OBJECTDIR}/_ext/830661877/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/830661877/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/830661877/plib_port.o.d" -o ${OBJECTDIR}/_ext/830661877/plib_port.o ../src/config/sam_e51_cnano/peripheral/port/plib_port.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o: ../src/config/sam_e51_cnano/peripheral/sercom/usart/plib_sercom5_usart.c  .generated_files/flags/sam_e51_cnano/7330ed0fb22a1bb8ba56a4a33421c545fdeb21f3 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/314480351" 
	@${RM} ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o.d" -o ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o ../src/config/sam_e51_cnano/peripheral/sercom/usart/plib_sercom5_usart.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/8444704/plib_systick.o: ../src/config/sam_e51_cnano/peripheral/systick/plib_systick.c  .generated_files/flags/sam_e51_cnano/b8f07567f44bfc4e6bd083f68309bf516671c2d0 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/8444704" 
	@${RM} ${OBJECTDIR}/_ext/8444704/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/8444704/plib_systick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/8444704/plib_systick.o.d" -o ${OBJECTDIR}/_ext/8444704/plib_systick.o ../src/config/sam_e51_cnano/peripheral/systick/plib_systick.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1900303495/plib_tc0.o: ../src/config/sam_e51_cnano/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e51_cnano/b5a5a8db9e0795cef21ba78cdbb5066f03c1a55b .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1900303495" 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1900303495/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1900303495/plib_tc0.o ../src/config/sam_e51_cnano/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1900303495/plib_tc1.o: ../src/config/sam_e51_cnano/peripheral/tc/plib_tc1.c  .generated_files/flags/sam_e51_cnano/7b916ea1eb08afe60663aa5b54842d015cc5c28c .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1900303495" 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1900303495/plib_tc1.o.d" -o ${OBJECTDIR}/_ext/1900303495/plib_tc1.o ../src/config/sam_e51_cnano/peripheral/tc/plib_tc1.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1900303495/plib_tc2.o: ../src/config/sam_e51_cnano/peripheral/tc/plib_tc2.c  .generated_files/flags/sam_e51_cnano/94db52ca5818f14fd9685ef3e9e38f521e31c78e .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1900303495" 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1900303495/plib_tc2.o.d" -o ${OBJECTDIR}/_ext/1900303495/plib_tc2.o ../src/config/sam_e51_cnano/peripheral/tc/plib_tc2.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1220133898/plib_tcc0.o: ../src/config/sam_e51_cnano/peripheral/tcc/plib_tcc0.c  .generated_files/flags/sam_e51_cnano/d4e4fdc26e3d85ac76febe6de10fe2df8edbeb3b .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1220133898" 
	@${RM} ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1220133898/plib_tcc0.o.d" -o ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o ../src/config/sam_e51_cnano/peripheral/tcc/plib_tcc0.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/865175840/xc32_monitor.o: ../src/config/sam_e51_cnano/stdio/xc32_monitor.c  .generated_files/flags/sam_e51_cnano/41d13a3f6893d76b7820f234551951a34f2e0b5 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/865175840" 
	@${RM} ${OBJECTDIR}/_ext/865175840/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/865175840/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/865175840/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/865175840/xc32_monitor.o ../src/config/sam_e51_cnano/stdio/xc32_monitor.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/initialization.o: ../src/config/sam_e51_cnano/initialization.c  .generated_files/flags/sam_e51_cnano/c0ce3b5eb6c773f5e608e439734b78120e423db3 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/initialization.o.d" -o ${OBJECTDIR}/_ext/570918426/initialization.o ../src/config/sam_e51_cnano/initialization.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/interrupts.o: ../src/config/sam_e51_cnano/interrupts.c  .generated_files/flags/sam_e51_cnano/9a93ab2f21191ceb0a4e0e885aa023e0149c8493 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/interrupts.o.d" -o ${OBJECTDIR}/_ext/570918426/interrupts.o ../src/config/sam_e51_cnano/interrupts.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/exceptions.o: ../src/config/sam_e51_cnano/exceptions.c  .generated_files/flags/sam_e51_cnano/e94bfe8ceb9d711e987aa54f90373e95765efb81 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/exceptions.o.d" -o ${OBJECTDIR}/_ext/570918426/exceptions.o ../src/config/sam_e51_cnano/exceptions.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/startup_xc32.o: ../src/config/sam_e51_cnano/startup_xc32.c  .generated_files/flags/sam_e51_cnano/230088a2eda9797dd3fbd514c3cf58acc4efd252 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/570918426/startup_xc32.o ../src/config/sam_e51_cnano/startup_xc32.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/libc_syscalls.o: ../src/config/sam_e51_cnano/libc_syscalls.c  .generated_files/flags/sam_e51_cnano/38986ccff4d27fa12ad3df345f05560ca09440b1 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/570918426/libc_syscalls.o ../src/config/sam_e51_cnano/libc_syscalls.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o: ../src/main_sam_e51_cnano.c  .generated_files/flags/sam_e51_cnano/250bf145e46f36416a7b9f1af82c5d1657b39fe .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o.d" -o ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o ../src/main_sam_e51_cnano.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/570918426/AplHmi.o: ../src/config/sam_e51_cnano/AplHmi.c  .generated_files/flags/sam_e51_cnano/aa61b9c29f9b9d17161fac796bb8a1b9f821541c .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplHmi.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplHmi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/AplHmi.o.d" -o ${OBJECTDIR}/_ext/570918426/AplHmi.o ../src/config/sam_e51_cnano/AplHmi.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/AplSpd.o: ../src/config/sam_e51_cnano/AplSpd.c  .generated_files/flags/sam_e51_cnano/9631e8468fbf042c9b7cc38ba2ff0d14b76a79c7 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplSpd.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/AplSpd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/AplSpd.o.d" -o ${OBJECTDIR}/_ext/570918426/AplSpd.o ../src/config/sam_e51_cnano/AplSpd.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplSpd.o: ../src/config/sam_e51_cnano/DplSpd.c  .generated_files/flags/sam_e51_cnano/e2b99a63236e75ba2178800b6d95858f4be14192 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSpd.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSpd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplSpd.o.d" -o ${OBJECTDIR}/_ext/570918426/DplSpd.o ../src/config/sam_e51_cnano/DplSpd.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplBrk.o: ../src/config/sam_e51_cnano/DplBrk.c  .generated_files/flags/sam_e51_cnano/80de76ac6361146b74a75fda223dbbb0e78d9da3 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplBrk.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplBrk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplBrk.o.d" -o ${OBJECTDIR}/_ext/570918426/DplBrk.o ../src/config/sam_e51_cnano/DplBrk.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplSch.o: ../src/config/sam_e51_cnano/DplSch.c  .generated_files/flags/sam_e51_cnano/4a333f60531d8ba05e5839b4006b70460191d9d8 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSch.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplSch.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplSch.o.d" -o ${OBJECTDIR}/_ext/570918426/DplSch.o ../src/config/sam_e51_cnano/DplSch.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/DplHmi.o: ../src/config/sam_e51_cnano/DplHmi.c  .generated_files/flags/sam_e51_cnano/793ab26a95d97cdb5c21f8c7203ce856ae9becc6 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplHmi.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/DplHmi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/DplHmi.o.d" -o ${OBJECTDIR}/_ext/570918426/DplHmi.o ../src/config/sam_e51_cnano/DplHmi.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/7187140/plib_clock.o: ../src/config/sam_e51_cnano/peripheral/clock/plib_clock.c  .generated_files/flags/sam_e51_cnano/2bea9de92d1ab591761e34b322f6576c15f16eb2 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/7187140" 
	@${RM} ${OBJECTDIR}/_ext/7187140/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/7187140/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/7187140/plib_clock.o.d" -o ${OBJECTDIR}/_ext/7187140/plib_clock.o ../src/config/sam_e51_cnano/peripheral/clock/plib_clock.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/831051564/plib_cmcc.o: ../src/config/sam_e51_cnano/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/sam_e51_cnano/a4cb333e52edeecd9fa3e09c8866f47f8a2f201c .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/831051564" 
	@${RM} ${OBJECTDIR}/_ext/831051564/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/831051564/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/831051564/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/831051564/plib_cmcc.o ../src/config/sam_e51_cnano/peripheral/cmcc/plib_cmcc.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/831021835/plib_dmac.o: ../src/config/sam_e51_cnano/peripheral/dmac/plib_dmac.c  .generated_files/flags/sam_e51_cnano/d597f284b8fbfa20c2b8272d0d9981a3d40f972f .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/831021835" 
	@${RM} ${OBJECTDIR}/_ext/831021835/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/831021835/plib_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/831021835/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/831021835/plib_dmac.o ../src/config/sam_e51_cnano/peripheral/dmac/plib_dmac.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1220119669/plib_eic.o: ../src/config/sam_e51_cnano/peripheral/eic/plib_eic.c  .generated_files/flags/sam_e51_cnano/d724f0c956bd2f837dd925e33ff1e87be9e96163 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1220119669" 
	@${RM} ${OBJECTDIR}/_ext/1220119669/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1220119669/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1220119669/plib_eic.o.d" -o ${OBJECTDIR}/_ext/1220119669/plib_eic.o ../src/config/sam_e51_cnano/peripheral/eic/plib_eic.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/9336626/plib_evsys.o: ../src/config/sam_e51_cnano/peripheral/evsys/plib_evsys.c  .generated_files/flags/sam_e51_cnano/a280028ba58e3c9443839f1ccfec8703e6fbfe77 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/9336626" 
	@${RM} ${OBJECTDIR}/_ext/9336626/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/9336626/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/9336626/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/9336626/plib_evsys.o ../src/config/sam_e51_cnano/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/830715028/plib_nvic.o: ../src/config/sam_e51_cnano/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e51_cnano/b5e42539ee76acae446d3469b9fefe2c10fddcdb .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/830715028" 
	@${RM} ${OBJECTDIR}/_ext/830715028/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/830715028/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/830715028/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/830715028/plib_nvic.o ../src/config/sam_e51_cnano/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o: ../src/config/sam_e51_cnano/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/sam_e51_cnano/fca4fa23c34e56674c3aa364d6c268a6cf59381e .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/226030394" 
	@${RM} ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/226030394/plib_nvmctrl.o ../src/config/sam_e51_cnano/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/830661877/plib_port.o: ../src/config/sam_e51_cnano/peripheral/port/plib_port.c  .generated_files/flags/sam_e51_cnano/8e60ac2a1a09ea4c5788be904f86c7cc02ea1000 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/830661877" 
	@${RM} ${OBJECTDIR}/_ext/830661877/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/830661877/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/830661877/plib_port.o.d" -o ${OBJECTDIR}/_ext/830661877/plib_port.o ../src/config/sam_e51_cnano/peripheral/port/plib_port.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o: ../src/config/sam_e51_cnano/peripheral/sercom/usart/plib_sercom5_usart.c  .generated_files/flags/sam_e51_cnano/ff488d071cb7a95fda12c9a61662660317892c65 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/314480351" 
	@${RM} ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o.d" -o ${OBJECTDIR}/_ext/314480351/plib_sercom5_usart.o ../src/config/sam_e51_cnano/peripheral/sercom/usart/plib_sercom5_usart.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/8444704/plib_systick.o: ../src/config/sam_e51_cnano/peripheral/systick/plib_systick.c  .generated_files/flags/sam_e51_cnano/1954192c85ef4ccf2e7a43327690fe1473348d22 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/8444704" 
	@${RM} ${OBJECTDIR}/_ext/8444704/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/8444704/plib_systick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/8444704/plib_systick.o.d" -o ${OBJECTDIR}/_ext/8444704/plib_systick.o ../src/config/sam_e51_cnano/peripheral/systick/plib_systick.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1900303495/plib_tc0.o: ../src/config/sam_e51_cnano/peripheral/tc/plib_tc0.c  .generated_files/flags/sam_e51_cnano/976ea03cd5a2184acc7513ae29b1095f4279ecd7 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1900303495" 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1900303495/plib_tc0.o.d" -o ${OBJECTDIR}/_ext/1900303495/plib_tc0.o ../src/config/sam_e51_cnano/peripheral/tc/plib_tc0.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1900303495/plib_tc1.o: ../src/config/sam_e51_cnano/peripheral/tc/plib_tc1.c  .generated_files/flags/sam_e51_cnano/cf561c6107dd2e73bf2fbb6628061f7231b6c13 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1900303495" 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1900303495/plib_tc1.o.d" -o ${OBJECTDIR}/_ext/1900303495/plib_tc1.o ../src/config/sam_e51_cnano/peripheral/tc/plib_tc1.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1900303495/plib_tc2.o: ../src/config/sam_e51_cnano/peripheral/tc/plib_tc2.c  .generated_files/flags/sam_e51_cnano/3ffe0bb6490dadbe0239f433464b30d551ddd887 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1900303495" 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1900303495/plib_tc2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1900303495/plib_tc2.o.d" -o ${OBJECTDIR}/_ext/1900303495/plib_tc2.o ../src/config/sam_e51_cnano/peripheral/tc/plib_tc2.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1220133898/plib_tcc0.o: ../src/config/sam_e51_cnano/peripheral/tcc/plib_tcc0.c  .generated_files/flags/sam_e51_cnano/8deadf2662cd8c7c1205d958897d9156b1ab9a80 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1220133898" 
	@${RM} ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1220133898/plib_tcc0.o.d" -o ${OBJECTDIR}/_ext/1220133898/plib_tcc0.o ../src/config/sam_e51_cnano/peripheral/tcc/plib_tcc0.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/865175840/xc32_monitor.o: ../src/config/sam_e51_cnano/stdio/xc32_monitor.c  .generated_files/flags/sam_e51_cnano/b59f3330e679f882f777a01cb7f4444384ca4a96 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/865175840" 
	@${RM} ${OBJECTDIR}/_ext/865175840/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/865175840/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/865175840/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/865175840/xc32_monitor.o ../src/config/sam_e51_cnano/stdio/xc32_monitor.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/initialization.o: ../src/config/sam_e51_cnano/initialization.c  .generated_files/flags/sam_e51_cnano/f4d77387fdee76fe57c29d5549494431f1e5ea02 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/initialization.o.d" -o ${OBJECTDIR}/_ext/570918426/initialization.o ../src/config/sam_e51_cnano/initialization.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/interrupts.o: ../src/config/sam_e51_cnano/interrupts.c  .generated_files/flags/sam_e51_cnano/e69feac926e7ae982f27860b1471d63758b75418 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/interrupts.o.d" -o ${OBJECTDIR}/_ext/570918426/interrupts.o ../src/config/sam_e51_cnano/interrupts.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/exceptions.o: ../src/config/sam_e51_cnano/exceptions.c  .generated_files/flags/sam_e51_cnano/a58058256aa57dee5ce45a001356602a45c80c3c .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/exceptions.o.d" -o ${OBJECTDIR}/_ext/570918426/exceptions.o ../src/config/sam_e51_cnano/exceptions.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/startup_xc32.o: ../src/config/sam_e51_cnano/startup_xc32.c  .generated_files/flags/sam_e51_cnano/545bef4f82cbcde37ade2583f432ce3593ec6e86 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/570918426/startup_xc32.o ../src/config/sam_e51_cnano/startup_xc32.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/570918426/libc_syscalls.o: ../src/config/sam_e51_cnano/libc_syscalls.c  .generated_files/flags/sam_e51_cnano/401934ded33849c8eb8b6c5630983e9c347c6992 .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/570918426" 
	@${RM} ${OBJECTDIR}/_ext/570918426/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/570918426/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/570918426/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/570918426/libc_syscalls.o ../src/config/sam_e51_cnano/libc_syscalls.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o: ../src/main_sam_e51_cnano.c  .generated_files/flags/sam_e51_cnano/26d6441869fa83b20904529ec840e376f0a9971f .generated_files/flags/sam_e51_cnano/287b6168c2390f6aae73a35d8f186754c68efcf4
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/sam_e51_cnano" -I"../src/packs/ATSAME51J20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/CMSIS/DSP/Include/" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o.d" -o ${OBJECTDIR}/_ext/1360937237/main_sam_e51_cnano.o ../src/main_sam_e51_cnano.c    -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/packs/CMSIS/CMSIS/DSP/Lib/GCC/libarm_cortexM4lf_math.a  ../src/config/sam_e51_cnano/ATSAME51J20A.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\packs\CMSIS\CMSIS\DSP\Lib\GCC\libarm_cortexM4lf_math.a      -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=2048,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/packs/CMSIS/CMSIS/DSP/Lib/GCC/libarm_cortexM4lf_math.a ../src/config/sam_e51_cnano/ATSAME51J20A.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\packs\CMSIS\CMSIS\DSP\Lib\GCC\libarm_cortexM4lf_math.a      -DXPRJ_sam_e51_cnano=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=2048,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/sam_e51_cnano.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/sam_e51_cnano
	${RM} -r dist/sam_e51_cnano

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
