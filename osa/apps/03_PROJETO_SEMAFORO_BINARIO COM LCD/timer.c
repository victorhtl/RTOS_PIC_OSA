#include "timer.h"

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