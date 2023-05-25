#ifndef __MAIN_H__
#define __MAIN_H__

//Protótipos
void    Task_Load(void);
void    Task_Save(void);
void    Task_View(void);
void    Task_Edit(void);

//Informa para o Linker do compilador mikroC que as funções (tasks) serão chamadas
//Indiretamentes pelo SO.
#pragma funcall main Task_Load
#pragma funcall main Task_Save
#pragma funcall main Task_View
#pragma funcall main Task_Edit

typedef struct
{
    char* strMenu;
    void  (*Func)(void);
} TMenuItem;

const TMenuItem UserMenu[] = {
    {"Load", Task_Load},
    {"Save", Task_Save},
    {"View", Task_View},
    {"Edit", Task_Edit}
};

#endif