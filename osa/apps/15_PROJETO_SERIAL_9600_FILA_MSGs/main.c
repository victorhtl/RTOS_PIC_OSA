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
    OS_Task_Create(2, Task_LED0);      //Cria task LED0
    OS_Task_Create(1, Task_LED1);      //Cria task LED1
    OS_Task_Create(0, Task_LED2);      //Cria task LED2

    OS_EI();

    OS_Run();

}


OST_TASK_POINTER tp_Task;
void Task_LED0(void)
{
    tp_Task = OS_Task_GetCur();
    for(;;)
    {
        LATD.RD0 = ~LATD.RD0;
        Delay_ms(2000);
        OS_Task_Pause(tp_Task);
        //OS_Delay(300 ms);
    }
}

void Task_LED1(void)
{
   tp_Task = OS_Task_GetCur();
    for(;;)
    {
         LATD.RD1 = ~LATD.RD1;
         Delay_ms(2000);
         OS_Task_Pause(tp_Task);
        //OS_Delay(300 ms);
    }
}

void Task_LED2(void)
{
   tp_Task = OS_Task_GetCur();
    for(;;)
    {
         LATD.RD2 = ~LATD.RD2;
         Delay_ms(2000);
         OS_Task_Pause(tp_Task);
        //OS_Delay(300 ms);
    }
}