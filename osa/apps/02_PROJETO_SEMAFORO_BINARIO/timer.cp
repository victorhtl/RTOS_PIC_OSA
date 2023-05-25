#line 1 "C:/Users/user/Desktop/RTOS_PROJETOS_CODIGO_FONTES_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_PROJETO_SEMAFORO_BINARIO/timer.c"
#line 1 "c:/users/user/desktop/rtos_projetos_codigo_fontes_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_projeto_semaforo_binario/timer.h"
#line 14 "c:/users/user/desktop/rtos_projetos_codigo_fontes_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_projeto_semaforo_binario/timer.h"
void TickTimerIE(void);
#line 3 "C:/Users/user/Desktop/RTOS_PROJETOS_CODIGO_FONTES_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_PROJETO_SEMAFORO_BINARIO/timer.c"
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
