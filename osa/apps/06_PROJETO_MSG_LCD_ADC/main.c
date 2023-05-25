#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"
#include "lcd.h"
#include "button.h"

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
    OS_Task_Create(1, Task_AD1);      //Cria task AD1 (máxima prioridade)
    OS_Task_Create(2, Task_AD2);      //Cria task AD2 (máxima prioridade)
    OS_Task_Create(3, Task_LED0);      //Cria task LED0 (máxima prioridade)
    OS_Task_Create(4, Task_LCD);      //Cria task LCD (máxima prioridade)
    
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

       if (OS_Msg_Check (msg_ad0)) {     // If message exists
           OS_Msg_Accept(msg_ad0, msg);  // then accept it
           Lcd_Out(1,1,(msg));
       }
       //else tirar o else para todas as msgs serem recebidas
         if (OS_Msg_Check (msg_ad1)) {     // If message exists
           OS_Msg_Accept(msg_ad1, msg);  // then accept it
           Lcd_Out(1,10,(msg));
       }
       //else
         if (OS_Msg_Check (msg_ad2)) {     // If message exists
           OS_Msg_Accept(msg_ad2, msg);  // then accept it
           Lcd_Out(2,1,(msg));
       }


       OS_Delay(20 ms);
   }
}

void Task_AD0(void)
{
    static int result;
    static char buf[10];
    OS_Msg_Create (msg_ad0);

    for(;;)
    {
        result = ADC_Read(0);
        WordToStr(result, buf);
        OS_Msg_Send(msg_ad0, (OST_MSG)buf);
        OS_Cond_Wait(!OS_Msg_Check(msg_ad0));

        OS_Delay(50 ms);
    }
}


void Task_AD1(void)
{
    static int result;
    static char buf[10];
    OS_Msg_Create (msg_ad1);

    for(;;)
    {
        result = ADC_Read(1);
        WordToStr(result, buf);
        OS_Msg_Send(msg_ad1, (OST_MSG)buf);
        OS_Cond_Wait(!OS_Msg_Check(msg_ad1));

        OS_Delay(50 ms);
    }
}

void Task_AD2(void)
{
    static int result;
    static char buf[10];
    OS_Msg_Create (msg_ad2);

    for(;;)
    {
        result = ADC_Read(2);
        WordToStr(result, buf);
        OS_Msg_Send(msg_ad2, (OST_MSG)buf);
        OS_Cond_Wait(!OS_Msg_Check(msg_ad2));

        OS_Delay(50 ms);

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
