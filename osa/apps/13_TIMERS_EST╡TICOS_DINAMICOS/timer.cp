#line 1 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/13_TIMERS_EST¡TICOS_DINAMICOS/timer.c"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/13_timers_est¡ticos_dinamicos/timer.h"
#line 14 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/13_timers_est¡ticos_dinamicos/timer.h"
void TickTimerIE(void);
#line 3 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/13_TIMERS_EST¡TICOS_DINAMICOS/timer.c"
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
