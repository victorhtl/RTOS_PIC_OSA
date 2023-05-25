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
    OS_Task_Create(0, Task_AD0);      //Cria task AD0 (máxima prioridade)
    OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade)
    OS_Task_Create(0, Task_LCD);      //Cria task LCD (máxima prioridade)
    
    OS_Queue_Create(queue, buffer, 10);
    
    OS_EI();

    OS_Run();

}


void Task_LCD(void)
{
   static int count = 0;
   static char txt[10];
   OST_MSG msg;

   for(;;)
   {
       if (OS_Queue_Check(queue)) {
           OS_Queue_Accept(queue, msg);
           Lcd_Out(1,1,(msg));

           WordToStr(count++, txt);
           Lcd_Out(2,1,(txt));
        }

       OS_Delay(20 ms);
   }
}

void Task_AD0(void)
{
    static int result;
    static char buf[10];
    for(;;)
    {
        result = ADC_Read(0);
        result = result * (255/1023.); //converte de 0 a 255
        WordToStr(result, buf);
        
        if (!OS_Queue_IsFull (queue)) {
            OS_Queue_Send(queue, buf);
            //OS_Queue_Clear(queue);
        };
       //OS_Cond_Wait(!OS_Queue_Check(queue));

        OS_Delay(200 ms);
    }
}


void Task_LED0 (void)
{
    for(;;)
    {
        LATD.RD0 = ~LATD.RD0;
        OS_Delay(1000 ms);
    }
}