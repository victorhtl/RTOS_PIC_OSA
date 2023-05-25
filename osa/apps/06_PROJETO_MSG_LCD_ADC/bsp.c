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

    TRISD = 0;        //PORTD configurado como Sa�da
    PORTD = 0;        //LEDs OFF

    TRISE.RE0 = 1;    //pinos dos BTN como entrada
    TRISE.RE1 = 1;
    
    TRISA  = 0B00000111; //AN0 ~AN2
}