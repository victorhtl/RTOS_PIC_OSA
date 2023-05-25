#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"
#include "lcd.h"

void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
    OS_EnterInt();
 
    if (TMR2IF_bit){
        TMR2IF_bit = 0;
        OS_Timer();
    }
     OS_LeaveInt();
}


void main (void)
{
    InitMCU();                         //Inicializa os periféricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
    InitLCD();
    
    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7.
    OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade
    OS_Task_Create(0, Task_LED1);      //Cria task LED1 (máxima prioridade)
    OS_Task_Create(0, Task_LED2);      //Cria task LED2 (máxima prioridade)

    OS_EI();

    OS_Run();

}




void Task_LED0 (void)
{
   OS_Stimer_Run(stimer1, 100);

    for(;;)
    {
       if (!OS_Stimer_IsRun(stimer1))
       {
          OS_Stimer_Wait(stimer1);
          LATD.RD0 = ~LATD.RD0;
          OS_Stimer_Run(stimer1, 100);
       }

       OS_Yield();
    }
}


void Task_LED1 (void)
{

    OS_Stimer_Run(stimer2, 500);

    for(;;)
    {
       if (!OS_Stimer_IsRun(stimer2))
       {
          OS_Stimer_Wait(stimer2);
          LATD.RD1 = ~LATD.RD1;
          OS_Stimer_Run(stimer2, 500);
       }

       OS_Yield();
    }

}

void Task_LED2 (void)
{
   static unsigned char stimer_id =2;

    for(;;)
    {
        if(OS_Stimer_Found()){
          OS_Stimer_Alloc(stimer_id);
          OS_Stimer_Run(stimer_id, 2000);

          OS_Stimer_Wait(stimer_id);
          LATD.RD2 = ~LATD.RD2;

          OS_Stimer_Free(stimer_id);

       }

       OS_Yield();
    }

}