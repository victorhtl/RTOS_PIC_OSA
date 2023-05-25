#include "bsp.h"

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

    TRISA = 0;
    PORTA = 0;

    TRISE.RE0 = 1;    //Button0
    PORTE.RE0 = 1;

    TRISE.RE1 = 1;    //Button0
    PORTE.RE1 = 1;
}