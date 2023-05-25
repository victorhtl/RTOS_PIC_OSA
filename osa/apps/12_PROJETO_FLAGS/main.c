#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"
#include "lcd.h"
#include "button.h"

/*  Operações que são realizadas em cada uma das funções de Flags:
    #define OS_Flag_Set(flags, mask)                flags |= mask
    #define OS_Flag_Clear(flags, mask)              flags &= ~(mask)
    #define OS_Flag_Check_AllOn(flags, mask)        (((flags) & (mask))==(mask))
    #define OS_Flag_Check_On(flags, mask)           ((flags) & (mask))
    #define OS_Flag_Check_AllOff(flags, mask)       (((flags) & (mask)) == 0)
    #define OS_Flag_Check_Off(flags, mask)          (((flags) & (mask)) != (mask))
    #define OS_Flag_Init(flags, value)              flags = value
*/

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
    OS_Task_Create(0, Task_BUTTON0);      //Cria task BTN0 (máxima prioridade)
    OS_Task_Create(0, Task_BUTTON1);      //Cria task BTN1 (máxima prioridade)
    OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade)
    OS_Task_Create(0, Task_LCD);      //Cria task LCD (máxima prioridade)
    
    OS_Flag_Create (flag);
    OS_Flag_Init (flag, 0x0);
    
    OS_EI();

    OS_Run();

}



void Task_BUTTON0(void)
{
    for (;;)
    {
        do //botão pressionado?
        {
            OS_Cond_Wait(!BTN0);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (BTN0);

        //--------------------------------------
        LATD.RD7 = ~LATD.RD7;
        if(LATD.RD7) {
          OS_Flag_Set(flag, 0x01);   // Set bits 1
        }else
          OS_Flag_Clear(flag, 0x01); // Clear bits 1
        //--------------------------------------
        
        do  //botão solto?
        {
            OS_Cond_Wait(BTN0);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (!BTN0);

    }
}

void Task_BUTTON1(void)
{
    for (;;)
    {
        do   //botão pressionado?
        {
            OS_Cond_Wait(!BTN1);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (BTN1);

         //--------------------------------------
        LATD.RD6 = ~LATD.RD6;
        if(LATD.RD7){
          OS_Flag_Set(flag, 0x02);   // Set bits 1
        }else
          OS_Flag_Clear(flag, 0x02); // Clear bits 1
        //--------------------------------------
        
        do   //Botão solto?
        {
            OS_Cond_Wait(BTN1);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (!BTN1);

    }
}

void Task_LCD(void)
{
   static int count = 0;
   static char txt[10];

   for(;;)
   {
      //BUTTON0 e BUTTON1 foram pressionados?
      if(OS_Flag_Check_AllOn (flag, 0x3))
      {
         //Sim, foram pressionados, então...
         count++;
         WordToStr(count, txt);
         Lcd_Out(1,1,txt);
      }

       OS_Delay(500 ms);
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