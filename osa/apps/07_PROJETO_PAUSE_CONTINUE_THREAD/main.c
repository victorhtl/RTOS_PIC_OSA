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

OST_TASK_POINTER tp1;
void main (void)
{
    InitMCU();                         //Inicializa os perif�ricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrup��o TickTimer
    InitLCD();
    
    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. M�xima prioridade = 0. M�nima prioridade = 7.
    OS_Task_Create(0, Task_AD0);      //Cria task AD0 (m�xima prioridade)
    if (!OS_IsError()) tp1 = OS_Task_GetCreated(); // Get descriptor
     
    OS_Task_Create(0, Task_AD1);      //Cria task AD1 (m�xima prioridade)
    OS_Task_Create(0, Task_AD2);      //Cria task AD2 (m�xima prioridade)
    OS_Task_Create(0, Task_LED0);      //Cria task LED0 (m�xima prioridade)
    OS_Task_Create(0, Task_LCD);      //Cria task LCD (m�xima prioridade)
    OS_Task_Create(0, Task_BUTTON0);      //Cria task LE2 (m�xima prioridade)
        
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
         if (OS_Msg_Check (msg_ad1)) {     // If message exists
           OS_Msg_Accept(msg_ad1, msg);  // then accept it
           Lcd_Out(1,10,(msg));
       }
         if (OS_Msg_Check (msg_ad2)) {     // If message exists
           OS_Msg_Accept(msg_ad2, msg);  // then accept it
           Lcd_Out(2,1,(msg));
       }
        
        if (OS_Msg_Check (msg_pause)) {     // If message exists
           OS_Msg_Accept(msg_pause, msg);  // then accept it
           Lcd_Out(2,9,(msg));
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


void Task_BUTTON0(void)
{
   OS_Msg_Create (msg_pause);

    for (;;)
    {
        //BOT�O FOI PRESSIONADO?
        do
        {
            OS_Cond_Wait(!BTN0);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (BTN0);

        //SIM, BOT�O PRESSIONADO. PORTANTO LIGA/DESLIGA LED E PAUSE OU CONTINUE UMA THREAD
        LATD.RD7 = ~LATD.RD7;
        if(LATD.RD7)
        {
           if (!OS_Task_IsPaused (tp1)) {
              OS_Msg_Send(msg_pause, "Pause");
              OS_Cond_Wait(!OS_Msg_Check(msg_pause));
              OS_Task_Pause(tp1);        // Pause external task
            }

        }
        else
        {
          if (OS_Task_IsPaused (tp1)) {
              OS_Msg_Send(msg_pause, "Cont ");
              OS_Cond_Wait(!OS_Msg_Check(msg_pause));
              OS_Task_Continue(tp1);     // Continue paused task
            }
         }

        //BOT�O FOI SOLTO?
        do
        {
            OS_Cond_Wait(BTN0);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (!BTN0);

    }
}



