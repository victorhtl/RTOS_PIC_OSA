#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"


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

    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7.
    OS_Task_Create(0, Task_LED0);      //Cria task LE0 (máxima prioridade)
    OS_Task_Create(1, Task_LED1);      //Cria task LE1 (máxima prioridade)
    OS_Task_Create(2, Task_LED2);      //Cria task LE2 (máxima prioridade)
    OS_Task_Create(3, Task_LED3);      //Cria task LE3 (máxima prioridade)
    
    OS_Csem_Create(csem);
    OS_Csem_SetValue(csem, 1);
    
    OS_EI();

    OS_Run();

}




void Task_LED0(void)
{
    for(;;)
    {
        OS_Cond_Wait(OS_Csem_Check (csem));
        OS_Csem_Accept(csem);
        
        LATD.RD0 = 1; Delay_ms(300); LATD.RD0 = 0;
        OS_Delay(500 ms);

        OS_Csem_Signal(csem);
        OS_Yield();
        

    }
}

void Task_LED1(void)
{
    for(;;)
    {
        OS_Cond_Wait(OS_Csem_Check (csem));
        OS_Csem_Accept(csem);
        
        LATD.RD1 = 1; Delay_ms(300); LATD.RD1 = 0;
        OS_Delay(500 ms);
        
        OS_Csem_Signal(csem);
        OS_Yield();

    }
}

void Task_LED2(void)
{
    for(;;)
    {
         OS_Cond_Wait(OS_Csem_Check (csem));
         OS_Csem_Accept(csem);
         
        LATD.RD2 = 1; Delay_ms(300); LATD.RD2 = 0;
        OS_Delay(500 ms);

        OS_Csem_Signal(csem);
        OS_Yield();

    }
}

void Task_LED3(void)
{
    for(;;)
    {
        OS_Cond_Wait(OS_Csem_Check (csem));
        OS_Csem_Accept(csem);
        
        LATD.RD3 = 1; Delay_ms(300); LATD.RD3 = 0;
        OS_Delay(500 ms);

        OS_Csem_Signal(csem);
        OS_Yield();
    }
}
