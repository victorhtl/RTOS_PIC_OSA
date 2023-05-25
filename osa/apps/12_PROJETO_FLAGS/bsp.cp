#line 1 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/12_PROJETO_FLAGS/bsp.c"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/12_projeto_flags/bsp.h"



void InitMCU (void);
#line 3 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/12_PROJETO_FLAGS/bsp.c"
void InitMCU(void)
{

 ANSELA = 0;
 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;
#line 15 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/12_PROJETO_FLAGS/bsp.c"
 TRISD = 0;
 PORTD = 0;

 TRISE.RE0 = 1;
 TRISE.RE1 = 1;


 TRISE.RE0 = 1;
 PORTE.RE0 = 1;

 TRISE.RE1 = 1;
 PORTE.RE1 = 1;
}
