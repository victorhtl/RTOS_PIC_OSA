#include "osa.h"
#include "usart.h"

extern OST_QUEUE queue;
extern OST_MSG  buffer[10];

void InitUART(void)
{
   UART1_Init(9600);  //Baudrate 9600bps
   //Configuração individual de interrupção UART-RX
   PIR1.RC1IF = 0;    //Flag setado assim que o byte for recebido na UART
   IPR1.RC1IP = 1;    //Alta prioridade
   PIE1.RC1IE = 1;    //habilita a interrupção UART na RECEPÇÃO
}

void UartRx(void)
{
   static char rec;
   static unsigned char dta[20];
   static unsigned char *Pt;
   static unsigned char aux = 0;
   
   if(PIR1.RC1IF == 1)
  {
     PIR1.RC1IF = 0;       //Apaga o flag. Este é o único periférico
                           //no qual não precisamos apagar o flag
                           //na interrupção (de qualquer forma:
                           //APAGUE-O!
     rec = UART1_Read();   //lÊ o buffer de recepção UART
                           //Poderia escrever assim:  rec = RCREG;
     //UART1_Write(rec);     //envia o mesmo valor recebido pela UART
                           //poderia escrever assim: TXREG = rec;

     if(rec == '[')        //inici a recepção dos dados do frame
     {
         aux = 1;          //flag que indica início do frame
         Pt = dta;          //Passa o endereço inicial da matriz para o ponteiro
     }
      else
       if(aux == 1)
        {
            *Pt = rec;       //salvo o byte recebido na matriz dta

            if((Pt-dta) > sizeof(dta))
            {
              aux = 0;
            }
             else
                Pt++;

        }

     if(rec == ']' && aux == 1)
     {
       aux = 0;
        //DecodificaProtocolo();
         if (!OS_Queue_IsFull_I(queue)) {                 // If there is room
            OS_Queue_Send_I(queue, dta);
            //OS_Queue_Clear(queue);
        };


     }


  }

}