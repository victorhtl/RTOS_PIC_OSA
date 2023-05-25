#include <osa.h>

//Configura TIMER2 em 1 ms (FOSC = 8MHz)
/*
  1.000 = P_cicloMaquina * Prescaler * Postscale * (PR2 + 1)
  1.000 = 0.5us * 4 * 10 * (PR2 + 1)                         //1:10 Postscaler
  PR2 = 49                                                   //Prescaler is 4
*/
#define T2CON_CONST     0B01001101   //Timer2 ON, Prescaler 1:4 e Postscale 1:10
#define PR2_CONST       (49)         //1us para FOSC
#define ms /1

//Protótipos
void    InitMCU (void);
void    TickTimerIE(void);

void    Task_LED0 (void);
void    Task_LED1 (void);
void    Task_LED2 (void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_LED0
#pragma funcall main Task_LED1
#pragma funcall main Task_LED2

void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
    if (TMR2IF_bit)
    {
        TMR2IF_bit = 0;
        OS_Timer();
    }
}

void TickTimerIE(void)
{
     //Carrega configuração do TIMER2 (OS_TickTimer)
    T2CON = T2CON_CONST;
    PR2 = PR2_CONST;
    //Configuração geral das Interrupções
    INTCON.GIEH = 1;
    INTCON.GIEL = 1;
    RCON.IPEN = 1;
    //Habilita a interrupção do TIMER2  (OS_TickTimer)
    TMR2IE_bit = 1;
    TMR2IP_bit = 1;
    T2CON.TMR2ON = 1;
}

void main (void)
{
    InitMCU();                         //Inicializa os periféricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrupção TickTimer

    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7. d
    OS_Task_Create(0, Task_LED0);      //Cria task LE0 (máxima prioridade)
    OS_Task_Create(0, Task_LED1);      //Cria task LE1 (máxima prioridade)
    OS_Task_Create(0, Task_LED2);      //Cria task LE2 (máxima prioridade)

    //É possível editar a função OS_EI() "Operacional System Enable Interrupt"
    OS_EI();                         // Enable interrupts

    //.....
    OS_Run();                          //Executa o scheduler

}


void InitMCU(void)
{
 #ifdef P18F45K22
    ANSELA = 0;
    ANSELB = 0;
    ANSELC = 0;
    ANSELD = 0;
    ANSELE = 0;
 #else
    ADCON1 |= 0X0F;
 #endif

    TRISD = 0;        //PORTD configurado como Saída
    PORTD = 0;        //LEDs OFF

}



void Task_LED0(void)
{
    for(;;) //loop infinito
    {
        LATD.RD0 = ~LATD.RD0;
        OS_Delay(300 ms);
    }
}

void Task_LED1(void)
{
    for(;;)
    {
        LATD.RD1 = ~LATD.RD1;
        OS_Delay(300 ms);
    }
}

void Task_LED2(void)
{
    for(;;)
    {
        LATD.RD2 = ~LATD.RD2;
        OS_Delay(300 ms);
    }
}

/*
#ifndef _OSACFG_H
#define _OSACFG_H

//------------------------------------------------------------------------------
// SYSTEM
//------------------------------------------------------------------------------

#define OS_TASKS                3   // Number of tasks that can be active at one time


//------------------------------------------------------------------------------
// ENABLE CONSTANTS
//------------------------------------------------------------------------------

#define OS_ENABLE_TTIMERS           // Enable task timers (OS_Delay and OS_xxx_Wait_TO)



#endif
*/