
#include "AplHmi.h"
#include "AplSpd.h"
#include "DplBrk.h"
#include "DplSpd.h"
#include "DplSch.h"
#include "DplHmi.h"
#include "peripheral/systick/plib_systick.h"
#include "peripheral/tc/plib_tc1.h"


#define TASK_NUM (2)

#define PERIOD_1MS        (1)
#define PERIOD_3MS        (3)
#define PERIOD_10MS      (10)
#define PERIOD_50MS      (50)
#define PERIOD_100MS    (100)
#define PERIOD_250MS    (250)
#define PERIOD_500MS    (500)
#define PERIOD_1000MS  (1000)

typedef struct task {
   unsigned long periodms;    // Rate at which the task should tick
   unsigned long lastTick;  // Time since task's last tick
   void (*TickFct)(void);   // Function to call for task's tick
} task;

task tasks[TASK_NUM]=
{
    // period       lastTick        pointer
    {PERIOD_100MS,       0,      &AplHmi_Mng},
    {PERIOD_10MS,       0,      &AplSpd_Mng}
};

void DplSch_run(void)
{
    volatile static uint32_t yActualCounterValue = 0;
    for (int i=0; i < TASK_NUM; ++i)
    {
       yActualCounterValue = SYSTICK_TickCounterGet();
       if (yActualCounterValue >= tasks[i].lastTick + tasks[i].periodms)
       {
          tasks[i].lastTick = yActualCounterValue;
          tasks[i].TickFct();
       }
    }
}