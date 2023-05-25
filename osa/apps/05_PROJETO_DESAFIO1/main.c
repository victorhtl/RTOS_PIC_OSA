#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"
#include "lcd.h"
#include "adc.h"

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
    OS_Task_Create(0, Task_LCD);       //Cria a task LCD

    OS_EI();

    OS_Run();

}


void Task_LCD(void)
{
  static unsigned int LeituraADC;
  static unsigned char txt[10];
  
  for(;;)
  {
     LeituraADC = ADCRead(0);
     WordToStr(LeituraADC, txt);
     Lcd_Out(1,1, txt);
     OS_Delay(50);
  }
}


