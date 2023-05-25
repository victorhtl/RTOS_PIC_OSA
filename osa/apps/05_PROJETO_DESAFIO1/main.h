#ifndef __MAIN_H__
#define __MAIN_H__

//Protótipos
void  Task_LCD(void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_LCD


#endif