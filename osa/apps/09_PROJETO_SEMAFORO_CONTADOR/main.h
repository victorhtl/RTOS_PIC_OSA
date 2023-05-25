#ifndef __MAIN_H__
#define __MAIN_H__

//Prot�tipos
void    Task_LED0 (void);
void    Task_LED1 (void);
void    Task_LED2 (void);
void    Task_LED3 (void);

//Informa para o Linker do compilador mikroC que as fun��es (tasks) ser�o chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_LED0
#pragma funcall main Task_LED1
#pragma funcall main Task_LED2
#pragma funcall main Task_LED3

OST_CSEM csem;   //Semaforo contador

#endif