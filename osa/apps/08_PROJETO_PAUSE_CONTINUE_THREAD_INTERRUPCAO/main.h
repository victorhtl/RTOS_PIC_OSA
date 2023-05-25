#ifndef __MAIN_H__
#define __MAIN_H__

//Protótipos
void  Task_AD0 (void);
void  Task_AD1 (void);
void  Task_AD2 (void);
void  Task_LED0 (void);
void  Task_LCD (void);
void  Task_BUTTON0(void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_AD0
#pragma funcall main Task_AD1
#pragma funcall main Task_AD2
#pragma funcall main Task_LED0
#pragma funcall main Task_LCD
#pragma funcall main Task_BUTTON0

OST_MSG_CB msg_ad0;
OST_MSG_CB msg_ad1;
OST_MSG_CB msg_ad2;
OST_MSG_CB msg_pause;
OST_MSG_CB msg_int;

#endif