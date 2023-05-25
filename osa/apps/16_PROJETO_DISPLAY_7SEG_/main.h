#ifndef __MAIN_H__
#define __MAIN_H__

//Protótipos
void    Task_DISP7(void);
void    Task_BUTTON0(void);
void    Task_BUTTON1(void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_DISP7
#pragma funcall main Task_BUTTON0
#pragma funcall main Task_BUTTON1


#endif