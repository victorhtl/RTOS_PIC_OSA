#line 1 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/08_PROJETO_PAUSE_CONTINUE_THREAD_INTERRUPCAO/timer.c"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/08_projeto_pause_continue_thread_interrupcao/timer.h"
#line 14 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/08_projeto_pause_continue_thread_interrupcao/timer.h"
void TickTimerIE(void);
void InitTIMER0_IE(void);
#line 3 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/08_PROJETO_PAUSE_CONTINUE_THREAD_INTERRUPCAO/timer.c"
void TickTimerIE(void)
{

 T2CON =  0B01001101 ;
 PR2 =  (49) ;

 INTCON.GIEH = 1;
 INTCON.GIEL = 1;
 RCON.IPEN = 1;

 TMR2IE_bit = 1;
 TMR2IP_bit = 1;
 T2CON.TMR2ON = 1;
}

void InitTIMER0_IE(void)
{
 T0CON = 0B00000110;
 TMR0H = 0XC2;
 TMR0L = 0XF7;

 INTCON.TMR0IF = 0;
 T0CON.TMR0ON = 1;



 INTCON.TMR0IF = 0;
 INTCON2.TMR0IP = 0;
 INTCON.TMR0IE = 1;
}
