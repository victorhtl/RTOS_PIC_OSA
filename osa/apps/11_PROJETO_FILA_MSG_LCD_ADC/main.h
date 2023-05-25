#ifndef __MAIN_H__
#define __MAIN_H__

//Protótipos
void  Task_AD0 (void);
void  Task_LED0 (void);
void  Task_LCD (void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_AD0
#pragma funcall main Task_LED0
#pragma funcall main Task_LCD

OST_QUEUE queue;
OST_MSG  buffer[10];

#endif