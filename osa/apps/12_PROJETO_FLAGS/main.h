#ifndef __MAIN_H__
#define __MAIN_H__

//Prot�tipos
void  Task_BUTTON0(void);
void  Task_BUTTON1(void);
void  Task_LED0 (void);
void  Task_LCD (void);

//Informa para o Linker do compilador mikroC que as fun��es (tasks) ser�o chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_BUTTON0
#pragma funcall main Task_BUTTON1
#pragma funcall main Task_LED0
#pragma funcall main Task_LCD

OST_FLAG flag;

#endif