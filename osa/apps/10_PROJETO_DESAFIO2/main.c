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
    InitMCU();                         //Inicializa os perif�ricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrup��o TickTimer
    InitLCD();
    
    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. M�xima prioridade = 0. M�nima prioridade = 7.
    OS_Task_Create(0, Task_AD0);      //Cria task AD0 (m�xima prioridade)
    OS_Task_Create(1, Task_AD1);      //Cria task AD1 (m�xima prioridade)
    OS_Task_Create(2, Task_AD2);      //Cria task AD2 (m�xima prioridade)
    OS_Task_Create(3, Task_LED0);      //Cria task LED0 (m�xima prioridade)
    OS_Task_Create(4, Task_LCD);      //Cria task LCD (m�xima prioridade)
    
    OS_EI();

    OS_Run();

}


void Task_LCD(void)
{
   static int count = 0;
   static char txt[10];
   OST_SMSG msg;

   for(;;)
   {

         if (OS_Smsg_Check (msg_ad0)) {     // If message exists
           OS_Smsg_Accept(msg_ad0, msg);  // then accept it
           WordToStr(msg, txt);
           Lcd_Out(1,1,(txt));
       }
         if (OS_Smsg_Check (msg_ad1)) {     // If message exists
           OS_Smsg_Accept(msg_ad1, msg);  // then accept it
           WordToStr(msg, txt);
           Lcd_Out(1,10,(txt));
       }
         if (OS_Smsg_Check (msg_ad2)) {     // If message exists
           OS_Smsg_Accept(msg_ad2, msg);  // then accept it
           WordToStr(msg, txt);
           Lcd_Out(2,1,(txt));
       }


       OS_Delay(20 ms);
   }
}


void Task_AD0(void)
{
    static int result;
    static char buf[10];
    OS_Smsg_Create (msg_ad0);

    for(;;)
    {
        result = ADC_Read(0);
        OS_Smsg_Send(msg_ad0, result);
        OS_Cond_Wait(!OS_Smsg_Check(msg_ad0));

        OS_Delay(50 ms);
    }
}

void Task_AD1(void)
{
    static int result;
    static char buf[10];
    OS_Smsg_Create (msg_ad1);

    for(;;)
    {
        result = ADC_Read(1);
        OS_Smsg_Send(msg_ad1, result);
        OS_Cond_Wait(!OS_Smsg_Check(msg_ad1));

        OS_Delay(50 ms);
    }
}

void Task_AD2(void)
{
    static int result;
    static char buf[10];
    OS_Smsg_Create (msg_ad2);

    for(;;)
    {
        result = ADC_Read(2);
        OS_Smsg_Send(msg_ad2, result);
        OS_Cond_Wait(!OS_Smsg_Check(msg_ad2));

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