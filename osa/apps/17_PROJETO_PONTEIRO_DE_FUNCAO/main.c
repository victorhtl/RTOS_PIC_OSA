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
    char i;
    
    InitMCU();                         //Inicializa os periféricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
    InitLCD();
    
    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7.
    OS_Task_Reserve(Task_Load);
    OS_Task_Reserve(Task_Save);
    OS_Task_Reserve(Task_View);
    OS_Task_Reserve(Task_Edit);

    for(i = 0; i < 4; ++i)
    {
       OS_Task_CreateP(0, UserMenu[i].Func);
    }
    
    OS_EI();

    OS_Run();

}


void Task_Load(void)
{
   for(;;)
   {
       Lcd_Out(1,1, (char*)UserMenu[0].strMenu);
       OS_Delay(2000 ms);
   }
}

void Task_Save(void)
{
  for(;;)
  {
       Lcd_Out(1,8, (char*)UserMenu[1].strMenu);
       OS_Delay(2000 ms);
  }
}

void Task_View(void)
{
  for(;;)
  {
       Lcd_Out(2,1, (char*)UserMenu[2].strMenu);
       OS_Delay(2000 ms);
  }
}

void Task_Edit(void)
{
  for(;;)
  {
       Lcd_Out(2,8, (char*)UserMenu[3].strMenu);
       OS_Delay(2000 ms);
  }
}