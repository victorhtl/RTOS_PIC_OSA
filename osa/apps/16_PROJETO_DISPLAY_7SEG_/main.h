#ifndef __MAIN_H__
#define __MAIN_H__

//Prot�tipos
void    Task_DISP7(void);
void    Task_BUTTON0(void);
void    Task_BUTTON1(void);

//Informa para o Linker do compilador mikroC que as fun��es (tasks) ser�o chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_DISP7
#pragma funcall main Task_BUTTON0
#pragma funcall main Task_BUTTON1


#endif