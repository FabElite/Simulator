

/*
   Copyright (c) 2013 Frank Vahid, Tony Givargis, and
   Bailey Miller. Univ. of California, Riverside and Irvine.
   RIOS version 1.2
*/
#define TASKNUM 2

typedef struct task {
   unsigned long period;      // Rate at which the task should tick
   unsigned long elapsedTime; // Time since task's last tick
   void (*TickFct)(void);     // Function to call for task's tick
} task;

task tasks[TASKNUM] = {{0,0,0},{0,0,0}};

const unsigned long tasksPeriodGCD = 200; // Timer tick rate
const unsigned long periodToggle   = 1000;
const unsigned long periodSequence = 200;

void TickFct_Toggle(void);
void TickFct_Sequence(void);

unsigned char TimerFlag = 0;
void TimerISR(void) {
//   if (TimerFlag) {
//      printf("Timer ticked before task processing done.\n");
//   }
//   else {
//      TimerFlag = 1;
//   }
//   return;
}

void DplSch_Init(void)
{

   // Priority assigned to lower position tasks in array
   unsigned char i = 0;
   tasks[i].period      = periodSequence;
   tasks[i].elapsedTime = tasks[i].period;
   tasks[i].TickFct     = &TickFct_Sequence;
   
}
void main_2(void) {
   // Priority assigned to lower position tasks in array
   unsigned char i = 0;
   tasks[i].period      = periodSequence;
   tasks[i].elapsedTime = tasks[i].period;
   tasks[i].TickFct     = &TickFct_Sequence;
//   ++i;
//   tasks[i].period      = periodToggle;
//   tasks[i].elapsedTime = tasks[i].period;
//   tasks[i].TickFct     = &TickFct_Toggle;
//
//   TimerSet(tasksPeriodGCD);
//   TimerOn();
//
//   while(1) {
//      // Heart of the scheduler code
//      for (i=0; i < tasksNum; ++i) {
//         if (tasks[i].elapsedTime >= tasks[i].period) { // Ready
//            tasks[i].TickFct(); //execute task tick
//            tasks[i].elapsedTime = 0;
//         }
//         tasks[i].elapsedTime += tasksPeriodGCD;
//      }
//      TimerFlag = 0;
//      while (!TimerFlag) {
//         Sleep();
//      }
//   }
}

// Task: Toggle an output
void TickFct_Toggle(void)   {
//   static unsigned char init = 1;
//   if (init) { // Initialization behavior
//      B0 = 0;
//      init = 0;
//   }
//   else { // Normal behavior
//      B0 = !B0;
//   }
}

 // Task: Sequence a 1 across 3 outputs
void TickFct_Sequence(void) {
//   static unsigned char init = 1;
//   unsigned char tmp = 0;
//   if (init) { // Initialization behavior
//      init = 0;
//      B2   = 1;
//      B3   = 0;
//      B4   = 0;
//   }
//   else { // Normal behavior
//      tmp = B4;
//      B4  = B3;
//      B3  = B2;
//      B2  = tmp;
//   }
}