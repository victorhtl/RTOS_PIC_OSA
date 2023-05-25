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
    OS_Task_Create(0, Task_LED0);      //Cria task LE0 (máxima prioridade)
    OS_Task_Create(0, Task_LED1);      //Cria task LE1 (máxima prioridade)
    OS_Task_Create(0, Task_LED2);      //Cria task LE2 (máxima prioridade)
    OS_Task_Create(0, Task_LCD);       //Cria a task LCD
    OS_Task_Create(0, Task_BUTTON0);       //Cria a task LCD
    OS_Task_Create(0, Task_BUTTON1);       //Cria a task LCD
    
    OS_Bsem_Reset(BS_LED0);    //Reset -> OCUPADO - Set -> LIVRE
    OS_Bsem_Reset(BS_LED1);
    OS_Bsem_Reset(BS_LED2);

    OS_EI();

    OS_Run();

}


void Task_LCD(void)
{
  static unsigned int count = 0;
  static unsigned char txt[10];
  
  for(;;)
  {
     count++;
     WordToStr(count, txt);
     Lcd_Out(1,1, txt);
     OS_Delay(500);
  }
}

void Task_BUTTON0(void)
{
    for (;;)
    {
        do
        {
            OS_Cond_Wait(!BTN0);            //pino RB0 for aterrado
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (BTN0);

        LATD.RD7 = ~LATD.RD7;             //Inverte o estado lógico do LED RD7

        do
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
        do
        {
            OS_Cond_Wait(!BTN1);            //pino RB0 for aterrado
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (BTN1);

        LATD.RD6 = ~LATD.RD6;             //Inverte o estado lógico do LED RD7

        do
        {
            OS_Cond_Wait(BTN1);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (!BTN1);

    }
}


void Task_LED0(void)
{
    OS_Bsem_Set(BS_LED0);

    for(;;)
    {
        OS_Bsem_Wait(BS_LED0); //BS_LED0 == 1?? SIM, DESCE, CASO CONTRÁRIO, DEVOLVE O CONTROLE PARA O RTOS

        LATD.RD0 = ~LATD.RD0;  //LED
        OS_Delay(300 ms);      //Aguarda 300ms
        
        OS_Bsem_Reset(BS_LED0);
        OS_Bsem_Set(BS_LED1);

    }
}

void Task_LED1(void)
{
    for(;;)
    {
        OS_Bsem_Wait(BS_LED1);

        LATD.RD1 = ~LATD.RD1;
        OS_Delay(300 ms);

        OS_Bsem_Reset(BS_LED1);
        OS_Bsem_Set(BS_LED2);
    }
}

void Task_LED2(void)
{
    for(;;)
    {
        OS_Bsem_Wait(BS_LED2);

        LATD.RD2 = ~LATD.RD2;
        OS_Delay(300 ms);

        OS_Bsem_Reset(BS_LED2);
        OS_Bsem_Set(BS_LED0);
    }
}