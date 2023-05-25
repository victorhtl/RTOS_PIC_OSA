#ifndef __MAIN_H__
#define __MAIN_H__

//Prot�tipos
void  Task_AD0 (void);
void  Task_AD1 (void);
void  Task_AD2 (void);
void  Task_LED0 (void);
void  Task_LCD (void);

//Informa para o Linker do compilador mikroC que as fun��es (tasks) ser�o chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_AD0
#pragma funcall main Task_AD1
#pragma funcall main Task_AD2
#pragma funcall main Task_LED0
#pragma funcall main Task_LCD

OST_SMSG msg_ad0;
OST_SMSG msg_ad1;
OST_SMSG msg_ad2;

#endif