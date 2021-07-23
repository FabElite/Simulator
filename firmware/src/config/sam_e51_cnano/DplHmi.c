/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Elite srl

  @File Name
    DplHmi.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include "DplHmi.h"

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: private variable                                                  */
/* ************************************************************************** */
static volatile bool isUSARTTxComplete = true;
/* ************************************************************************** */
/* Section: Private Function                                                  */
/* ************************************************************************** */
static void usartDmaChannelHandler(DMAC_TRANSFER_EVENT event, uintptr_t contextHandle)
{
    if (event == DMAC_TRANSFER_EVENT_COMPLETE)
    {
        isUSARTTxComplete = true;
    }
}
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
void DplHmi_init(void)
{    
    DMAC_ChannelCallbackRegister(DMAC_CHANNEL_0, usartDmaChannelHandler, 0);
}

void DplHmi_mngBoardLed(void)
{
    LED0_Toggle();
}

bool DplHmi_PrintOut(const void *pstringPointer, uint32_t zSize)
{
    bool zRet = 1;
    if (isUSARTTxComplete == true)
    {
        DMAC_ChannelTransfer(DMAC_CHANNEL_0, pstringPointer, \
                (const void *)&(SERCOM5_REGS->USART_INT.SERCOM_DATA), \
                zSize);
        zRet = 0;
    }
    
    return zRet;
}

/* *****************************************************************************
 End of File
 */
