#ifndef __MAIN_H__
#define __MAIN_H__

//Prot�tipos
void  Task_LCD(void);

//Informa para o Linker do compilador mikroC que as fun��es (tasks) ser�o chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_LCD


#endif