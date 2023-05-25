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

void InitTIMER0_IE(void)
{
  T0CON = 0B00000110; //Modo Temporizador, pres: 128
  TMR0H = 0XC2;
  TMR0L = 0XF7;       //Tempo para 1 seg

  INTCON.TMR0IF = 0;  //Apaga o flag do TIMER0
  T0CON.TMR0ON = 1;   //Liga o TIMER0


 //----------CONFIGURA A INTERRUPÇÃO DO TIMER0 ---------------------
  INTCON.TMR0IF  = 0;  //flag que provoca a interrupção da CPU
  INTCON2.TMR0IP  = 0;  //Alta prioridade de interrupção
  INTCON.TMR0IE  = 1;  //chave que habilita a interrupção do periférico
}