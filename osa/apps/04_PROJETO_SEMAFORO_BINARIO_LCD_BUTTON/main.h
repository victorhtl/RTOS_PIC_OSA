#ifndef __MAIN_H__
#define __MAIN_H__

//Prot�tipos
void  Task_LED0 (void);
void  Task_LED1 (void);
void  Task_LED2 (void);
void  Task_LCD(void);
void  Task_BUTTON0(void);
void  Task_BUTTON1(void);

//Informa para o Linker do compilador mikroC que as fun��es (tasks) ser�o chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_LED0
#pragma funcall main Task_LED1
#pragma funcall main Task_LED2
#pragma funcall main Task_LCD
#pragma funcall main Task_BUTTON0
#pragma funcall main Task_BUTTON1

#endif