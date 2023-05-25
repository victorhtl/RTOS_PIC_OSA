#ifndef __TIMER_H__
#define __TIMER_H__

//Configura TIMER2 em 1 ms (FOSC = 8MHz)
/*
  1.000 = P_cicloMaquina * Prescaler * Postscale * (PR2 + 1)
  1.000 = 0.5us * 4 * 10 * (PR2 + 1)                         //1:10 Postscaler
  PR2 = 49                                                   //Prescaler is 4
*/
#define T2CON_CONST     0B01001101   //Timer2 ON, Prescaler 1:4 e Postscale 1:10
#define PR2_CONST       (49)         //1us para FOSC
#define ms /1

void TickTimerIE(void);

#endif