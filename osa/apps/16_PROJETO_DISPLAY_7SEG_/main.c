#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"
#include "lcd.h"

//Definicoes:
#define TRUE            1
#define FALSE           0

#define UNIDADE         PORTA.RA0
#define DEZENA          PORTA.RA1
#define CENTENA         PORTA.RA2
#define MILHAR          PORTA.RA3


void WriteEEPROM(unsigned int Contador);
void DispMsg(unsigned int Contador, char Enable);


OST_QUEUE queue;
OST_MSG  buffer[10];
volatile unsigned int Contador = 0;

void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
    OS_EnterInt();
 
    if (TMR2IF_bit){
        TMR2IF_bit = 0;
        OS_Timer();
    }
     OS_LeaveInt();
}


void main (void)
{
    InitMCU();                         //Inicializa os periféricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
    InitLCD();
    
    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7.
    OS_Task_Create(0, Task_DISP7);
    OS_Task_Create(0, Task_BUTTON0);
    OS_Task_Create(0, Task_BUTTON1);

    OS_Queue_Create(queue, buffer, 10);
     
    Contador = (EEPROM_Read(0x01) << 8) | (EEPROM_Read(0x00));
    if(Contador > 9999) Contador = 0;
    DispMsg(Contador, FALSE);  //Envia a Msg sem gravar na EEPROM
    
    OS_EI();

    OS_Run();

}


void Task_DISP7(void)
{
  static OST_MSG Mat_Mostra_Disp;
  static enum{
              _disp1 = 1,
              _disp2,
              _disp3,
              _disp4
              }  _maq_estado = _disp1;

  for(;;)
  {
        PORTA &= 0xF0;      //Apaga nible menos desliga displays

        if (OS_Queue_Check(queue))
        {
            OS_Queue_Accept(queue, Mat_Mostra_Disp);  // then accept it
        }

       switch (_maq_estado)
       {
          case _disp1: {
                          PORTD = Mat_Mostra_Disp[0];     //Escreve valor no display de Unidade
                          UNIDADE = 1;
                          _maq_estado = _disp2;
                          break;
                       }
          case _disp2: {
                          PORTD = Mat_Mostra_Disp[1];    //Escreve valor no display de Dezena
                          DEZENA = 1;
                          _maq_estado = _disp3;
                          break;
                       }
          case _disp3: {
                          PORTD = Mat_Mostra_Disp[2];     //Escreve valor no display de Centena
                          CENTENA = 1;
                          _maq_estado = _disp4;
                          break;
                       }
          case _disp4: {
                          PORTD = Mat_Mostra_Disp[3];     //Escreve valor no display de Milhar
                          MILHAR = 1;
                          _maq_estado = _disp1;
                          break;
                       }
          default: break;
       }

       OS_Delay(2 ms);
  }
}


void Task_BUTTON0(void)
{

    for (;;)
    {
        do
        {
            OS_Cond_Wait(!pin_BUTTON0);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (pin_BUTTON0);


         if(Contador < 9999)
             DispMsg(++Contador, TRUE);  //Envia a Msg e Grava na EEPROM


        do
        {
            OS_Cond_Wait(pin_BUTTON0);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (!pin_BUTTON0);

    }
}

void Task_BUTTON1(void)
{

    for (;;)
    {
        do
        {
            OS_Cond_Wait(!pin_BUTTON1);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (pin_BUTTON1);


         if(Contador > 0)
             DispMsg(--Contador,TRUE);   //Envia a Msg e Grava na EEPROM


        do
        {
            OS_Cond_Wait(pin_BUTTON1);
            OS_Delay(40 ms);                // 40 ms for debounce
        } while (!pin_BUTTON1);

    }
}


void WriteEEPROM(unsigned int Contador)
{
  union ValWR {
       unsigned int ValInteiro;
       unsigned char ValHighLow[2];
   } ValWR;

      ValWR.ValInteiro = Contador;
      EEPROM_Write(0x00, ValWR.ValHighLow[0]);   //Grava byte menos significativo no endereco 0x00
      EEPROM_Write(0x01, ValWR.ValHighLow[1]);   //Grava byte mais significativo no endereco 0x01
}


void DispMsg(unsigned int Contador, char Enable)
{
    static unsigned int VarAux = 0;
    static char buf[4];
    static char _i;
    static const char Mat_Const_Disp[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

    //Situação crítica por estar tratando uma variável Global "Contador".
    //Visto que as tarefas estão ocorrendo em paralelo em conjunto com a Interrupção
    OS_EnterCriticalSection();

               if(Enable) WriteEEPROM(Contador);

               VarAux = Contador;
               for (_i = 0; _i < 4; _i++)
               {
                  buf[_i] = Mat_Const_Disp[VarAux%10];
                  VarAux /= 10;
               }

     OS_LeaveCriticalSection();

        if (!OS_Queue_IsFull (queue)) {
            OS_Queue_Send (queue, buf);
          };

}

