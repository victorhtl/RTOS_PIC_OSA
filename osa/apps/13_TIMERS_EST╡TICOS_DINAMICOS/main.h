#ifndef __MAIN_H__
#define __MAIN_H__

//Protótipos
void  Task_LED0 (void);
void  Task_LED1 (void);
void  Task_LED2 (void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_LED0
#pragma funcall main Task_LED1
#pragma funcall main Task_LED2


#endif