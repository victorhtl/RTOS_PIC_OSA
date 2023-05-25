#include <osa.h>
#include "main.h"
#include "bsp.h"
#include "timer.h"
#include "lcd.h"
#include "usart.h"

OST_QUEUE queue;
OST_MSG  buffer[10];

void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {

    OS_EnterInt();
 
    if (TMR2IF_bit){
        TMR2IF_bit = 0;
        OS_Timer();
    }
    
    UartRx();
    
    OS_LeaveInt();
}


void main (void)
{
    InitMCU();                         //Inicializa os periféricos do MCU
    TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
    InitLCD();
    InitUART();
    
    OS_Init();                         //Inicializa RTO's

    //Cria as tasks. Máxima prioridade = 0. Mínima prioridade = 7.
    OS_Task_Create(0, Task_LED0);      //Cria task LED0
    OS_Task_Create(1, Task_LED1);      //Cria task LED1
    OS_Task_Create(2, Task_LED2);      //Cria task LED2
    OS_Task_Create(3, Task_DEC);       //Cria task DEC (decodificador)

    OS_Queue_Create(queue, buffer, 10);
    OS_EI();

    OS_Run();

}

void Task_DEC(void)
{
   volatile unsigned char txt[10];
   OST_MSG dta;

    for(;;)
    {
         //if (OS_Queue_Check(queue)) {     // If any message present
            //OS_Queue_Accept(queue, dta);  // then accept it

           //}
         OS_Queue_Wait (queue, dta);
         // dta contem os valores recebidos pelo canal UART
         
        if(dta[0] = 'L' && dta[1] == 'E' && dta[2] == 'D')
         {

           if(dta[3] == 'D')
           {

             switch(dta[4])
             {
                case '5': { PORTD.RD5 = (dta[5]-'0'); break;}
                case '6': { PORTD.RD6 = (dta[5]-'0'); break;}
                case 'A': {
                            PORTD = (dta[5] == '1')?255:0;

                            WordToStr(PORTB, txt);
                            UART1_Write_Text("[PB:");
                            UART1_Write_Text(txt);
                            UART1_Write(']');
                            break;
                          }

             }

           }

         }
         else
         if(dta[0] = 'A' && dta[1] == 'N')
         {
            switch(dta[2])
             {
                 case '0': {
                             unsigned int adc;
                             unsigned char txt[10];

                             ANSELA.RA0 = 1;
                             TRISA.RA0 = 1;

                             adc = ADC_Read(0);
                             WordToStr(adc, txt);
                             UART1_Write_Text("[AN0:");
                             UART1_Write_Text(txt);
                             UART1_Write(']');

                            break;
                        }
             }

         }
         else
          if(dta[0] = 'P' && dta[1] == 'W' && dta[2] == 'M')
          {
            unsigned char duty;

            PWM1_Init(5000);  //5khz

            if(dta[3] == '1') { PWM1_Start();}
             else
               {PWM1_Stop(); return;}

              duty = ((dta[4]-'0')*100) + ((dta[5]-'0')*10) + ((dta[6]-'0')*1);
              PWM1_Set_Duty( duty );


          }

        OS_Yield();
    }
}

void Task_LED0(void)
{
    for(;;)
    {
        LATD.RD0 = ~LATD.RD0;
        OS_Delay(300 ms);
    }
}

void Task_LED1(void)
{
    for(;;)
    {
        LATD.RD1 = ~LATD.RD1;
        OS_Delay(300 ms);
    }
}

void Task_LED2(void)
{
    for(;;)
    {
        LATD.RD2 = ~LATD.RD2;
        OS_Delay(300 ms);
    }
}