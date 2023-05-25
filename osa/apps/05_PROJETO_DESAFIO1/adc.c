#include "osa.h"
#include "adc.h"


unsigned int ADCRead(unsigned char Canal)
{
  switch(Canal)
  {
    case 0: {
               ANSELA.RA0 = 1;        //Somente RA0/AN0 como ADC  - valido somente para o PIC18F45K22
               TRISA.RA0 = 1;        //Entrada pois estamos usando AN0
               PORTA.RA0 = 1;        //Opcional

               ADCON0 = 0B00000001;  //AN0 -> AD ligado
               ADCON1 = 0B00001110;  //AN0/RA0 config. como AD, tensão de referencia interna do ADC.
                                     //PIC18F45K22 -> ANSELA
               break;
            }

    case 1: {
               ANSELA.B1 = 1;        //Somente RA1/AN1 como ADC  - valido somente para o PIC18F45K22
               TRISA.RA1 = 1;        //Entrada pois estamos usando AN0
               PORTA.RA1 = 1;        //Opcional

               ADCON0 = 0B00000101;  //AN0 -> AD ligado
               ADCON1 = 0B00001111;  //Caso venhamos a usar o PIC18F4520
                                     //devemos configurar ADCON1 = OB00001101;
                                     //Caso venhamos a usar o PIC18F45K22
                                     //devemos configurar ADCON1 = 0B00001111; ou 0B00000000;
                                     //pois nesse chip (PIC18F45K22) usamos ANSELx
               break;
            }

  }

  ADCON2 = 0B10101010;  //justificativa para direita, Fosc/32, 12Tad
  ADCON0.GO_DONE = 1;           //Start na conversão do ADC
  while(ADCON0.GO_DONE == 1);   //Aguardar o término da conversão
  return ((ADRESH << 8) | (int)ADRESL);  //0 a 1023 pois ADC é 10bits

}
