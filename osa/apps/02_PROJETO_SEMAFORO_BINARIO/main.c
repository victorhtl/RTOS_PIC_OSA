#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"

void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
    if (TMR2IF_bit){
        TMR2IF_bit = 0;
        OS_Timer();
    }
}


void main (void)
{
    InitMCU();                         //Inicializa os periféricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrupção TickTimer

    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7.
    OS_Task_Create(0, Task_LED0);      //Cria task LE0 (máxima prioridade)
    OS_Task_Create(0, Task_LED1);      //Cria task LE1 (máxima prioridade)
    OS_Task_Create(0, Task_LED2);      //Cria task LE2 (máxima prioridade)

    OS_Bsem_Reset(BS_LED0);    //Reset -> OCUPADO - Set -> LIVRE
    OS_Bsem_Reset(BS_LED1);
    OS_Bsem_Reset(BS_LED2);

    OS_EI();

    OS_Run();

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