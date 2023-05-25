#line 1 "C:/Users/user/Desktop/RTOS_PROJETOS_CODIGO_FONTES_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_PROJETO_SEMAFORO_BINARIO/bsp.c"
#line 1 "c:/users/user/desktop/rtos_projetos_codigo_fontes_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_projeto_semaforo_binario/bsp.h"



void InitMCU (void);
#line 3 "C:/Users/user/Desktop/RTOS_PROJETOS_CODIGO_FONTES_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_PROJETO_SEMAFORO_BINARIO/bsp.c"
void InitMCU(void)
{

 ANSELA = 0;
 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;
#line 15 "C:/Users/user/Desktop/RTOS_PROJETOS_CODIGO_FONTES_mikroc_7_20_osa_110306.zip/osa_110306_mikroc_pro_7_20/osa/apps/02_PROJETO_SEMAFORO_BINARIO/bsp.c"
 TRISD = 0;
 PORTD = 0;

}
