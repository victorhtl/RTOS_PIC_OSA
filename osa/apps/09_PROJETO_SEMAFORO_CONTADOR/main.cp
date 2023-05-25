#line 1 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/09_PROJETO_SEMAFORO_CONTADOR/main.c"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/osacfg.h"
#line 57 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/osacfg.h"
enum OSA_BSEMS_ENUM
{
 BS_LED0,
 BS_LED1,
 BS_LED2
};
#line 1068 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef  unsigned char  _OST_SMSG;
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/osa_include.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
#line 41 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
typedef unsigned char OST_UINT8;
typedef unsigned int OST_UINT16;
typedef unsigned long OST_UINT32;
typedef unsigned char OST_BOOL;

typedef OST_UINT8 OST_UINT;
#line 93 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
extern volatile unsigned int _fsr;
extern volatile char _indf;
extern volatile char _postinc;
extern volatile char _postdec;
extern volatile char _preinc;

extern volatile unsigned char _fsr1l;

extern volatile char _pcl;
extern volatile char _pclath;
extern volatile char _pclatu;
extern volatile char _status;
extern volatile char _tosl;
extern volatile char _tosh;
extern volatile char _tosu;
extern volatile char _bsr;
extern volatile char _wreg;
extern volatile char _intcon;
extern volatile char _rcon;
extern volatile char _stkptr;
#line 251 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
void _OS_JumpToTask (void);
#line 288 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_ReturnSave (void);
extern void _OS_ReturnNoSave (void);
extern void _OS_EnterWaitMode (void);
extern void _OS_EnterWaitModeTO (void);

extern void _OS_SET_FSR_CUR_TASK (void);
#line 397 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
char OS_DI (void);
void OS_RI (char);







 void _OS_DI_INT (void);
 void _OS_RI_INT (void);
#line 419 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_CheckEvent (OST_UINT);
#line 1092 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef  unsigned char  OST_SMSG;
#line 1110 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef  char *  OST_MSG;







typedef

 volatile

 struct _OST_MSG_CB
{
 OST_UINT status;
 OST_MSG msg;

} OST_MSG_CB;
#line 1139 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef struct
{
 OST_UINT cSize;
 OST_UINT cFilled;
 OST_UINT cBegin;

} OST_QUEUE_CONTROL;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_MSG *pMsg;

} OST_QUEUE;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_SMSG *pSMsg;

} OST_SQUEUE;
#line 1190 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef struct
{
 OST_UINT bEventError : 1;
 OST_UINT bError : 1;

 OST_UINT bInCriticalSection : 1;

 OST_UINT bCheckingTasks : 1;


 OST_UINT bBestTaskFound : 1;





  OST_UINT bTimeout : 1; OST_UINT bGIE_CTemp : 1; OST_UINT bGIEL_CTemp : 1; 
#line 1218 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
} OST_SYSTEM_FLAGS;
#line 1235 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef struct
{
 OST_UINT cPriority : 3;
 OST_UINT bReady : 1;
 OST_UINT bDelay : 1;


 OST_UINT bCanContinue: 1;
 OST_UINT bEnable : 1;
 OST_UINT bPaused : 1;


  


} OST_TASK_STATE;
#line 1270 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef struct
{
 OST_TASK_STATE State;
  unsigned long  pTaskPointer;




  



  OST_UINT32  Timer;


} OST_TCB;
#line 1477 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
typedef OST_UINT8 OST_CSEM;
#line 1506 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
extern volatile   OST_SYSTEM_FLAGS _OS_Flags;
extern   OST_UINT _OS_Temp;


extern volatile   OST_UINT _OS_TempH;




extern volatile   OST_TASK_STATE _OS_State;
#line 1527 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
extern   OST_TCB *    volatile _OS_CurTask;





 extern   OST_UINT _OS_Best_Priority;






 extern   OST_TCB *    volatile _OS_BestTask;
 extern   OST_TCB *    volatile _OS_LastTask;
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/osa_oldnames.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/system/osa_system.h"
#line 48 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/system/osa_system.h"
extern void OS_Init (void);



extern void OS_EnterCriticalSection (void);
extern void OS_LeaveCriticalSection (void);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/system/osa_tasks.h"
#line 37 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/system/osa_tasks.h"
extern   OST_TCB _OS_Tasks[ 4 ];






void _OS_Task_Create(OST_UINT priority,  unsigned long  TaskAddr);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_bsem.h"
#line 56 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_bsem.h"
extern volatile   OST_UINT _OS_Bsems[( 3 + 8 -1)/ 8 ];
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_csem.h"
#line 54 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_csem.h"
extern void _OS_Csem_Signal(OST_CSEM *pCSem);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_flag.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_msg.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_queue.h"
#line 91 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_queue.h"
extern void _OS_Queue_Send (OST_QUEUE *pQueue, OST_MSG Msg);
extern OST_MSG _OS_Queue_Get (OST_QUEUE *pQueue);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_smsg.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_squeue.h"
#line 76 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/events/osa_squeue.h"
 extern void _OS_Squeue_Send (OST_SQUEUE * pSQueue, OST_SMSG SMsg);
 extern OST_SMSG _OS_Squeue_Get (OST_SQUEUE *pSQueue);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_stimer.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_stimer_old.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_dtimer.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_qtimer.h"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_ttimer.h"
#line 53 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_ttimer.h"
void _OS_InitDelay( OST_UINT32  Delay);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/kernel/timers/osa_timer.h"
#line 1660 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/osa.h"
 extern volatile   OST_UINT _OS_Temp_I;
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/09_projeto_semaforo_contador/main.h"




void Task_LED0 (void);
void Task_LED1 (void);
void Task_LED2 (void);
void Task_LED3 (void);
#pragma funcall main Task_LED0
#pragma funcall main Task_LED1
#pragma funcall main Task_LED2
#pragma funcall main Task_LED3
#line 17 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/09_projeto_semaforo_contador/main.h"
OST_CSEM csem;
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/09_projeto_semaforo_contador/bsp.h"



void InitMCU (void);
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/09_projeto_semaforo_contador/timer.h"
#line 14 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/09_projeto_semaforo_contador/timer.h"
void TickTimerIE(void);
void InitTIMER0_IE(void);
#line 7 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/09_PROJETO_SEMAFORO_CONTADOR/main.c"
void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
  ;

 if (TMR2IF_bit){
 TMR2IF_bit = 0;
  { { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;  { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; } } ; { OST_UINT _os_i; ; ; for (_os_i = 0; _os_i < 4 ; _os_i++) { if (_OS_Tasks[_os_i].State.bDelay){ if (!++_OS_Tasks[_os_i].Timer) _OS_Tasks[_os_i].State.bDelay = 0; } } } ; ; ; ; } ;
 }
  ;
}


void main (void)
{
 InitMCU();
 TickTimerIE();

 OS_Init();


  { _OS_Task_Create(0, ( unsigned long )&(Task_LED0)); } ;
  { _OS_Task_Create(1, ( unsigned long )&(Task_LED1)); } ;
  { _OS_Task_Create(2, ( unsigned long )&(Task_LED2)); } ;
  { _OS_Task_Create(3, ( unsigned long )&(Task_LED3)); } ;

   { ; csem = 0 ; ; } ;
   { ; csem = 1 ; ; } ;

  { GIE_bit  = 1; if ( IPEN_bit ) GIEL_bit  = 1;} ;

  for(;;) { _OS_Flags.bBestTaskFound = 0; _OS_Flags.bCheckingTasks = 1; _OS_Best_Priority = 7  + 1; if ( _OS_Flags.bInCriticalSection ) goto _OS_SCHED_CHECK_READY; ; _OS_CurTask = _OS_LastTask; do { if (_OS_CurTask >= (  OST_TCB * )_OS_Tasks + ( 4 -1)) _OS_CurTask = (  OST_TCB * )_OS_Tasks; else _OS_CurTask++; _OS_SCHED_CHECK_READY:  _OS_State = _OS_CurTask->State ; if (! _OS_State.bEnable  || _OS_State.bPaused ) goto _OS_SCHED_CONTINUE; ; if (_OS_Best_Priority <= (_OS_Temp = _OS_State.cPriority )) goto _OS_SCHED_CONTINUE; if (! _OS_State.bReady )  { _OS_SCHED_RUN:; _OS_JumpToTask() ; _OS_SET_FSR_CUR_TASK(); _indf &= ~( 0x08  | 0x20 ); _indf |= *((char*)&_OS_State) & ( 0x08  | 0x20 ); ; if (!_OS_Flags.bCheckingTasks) goto SCHED_END; ; } if ( _OS_State.bDelay  && ! _OS_State.bCanContinue ) goto _OS_SCHED_CONTINUE; ; if ( _OS_State.bReady )  { _OS_Flags.bBestTaskFound = 1; _OS_BestTask = _OS_CurTask; _OS_Best_Priority = _OS_State.cPriority ; if (_OS_Best_Priority == 0 ) break; } _OS_SCHED_CONTINUE:;  } while ( ! _OS_Flags.bInCriticalSection  && _OS_CurTask != _OS_LastTask); if (_OS_Flags.bBestTaskFound) { _OS_Flags.bCheckingTasks = 0; _OS_LastTask = _OS_CurTask = _OS_BestTask; _OS_State = _OS_CurTask->State ; if ( _OS_State.bEnable  && ! _OS_State.bPaused ) goto _OS_SCHED_RUN; } SCHED_END:; } ;

}




void Task_LED0(void)
{
 for(;;)
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((csem != 0)) != 0) ; } ;
   { ; csem--; ; } ;

 LATD.RD0 = 1; Delay_ms(300); LATD.RD0 = 0;
  { _OS_InitDelay(500 /1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

   { for (;;) { ; _OS_Csem_Signal(&(csem)); ; if (! _OS_Flags.bEventError ) break; { _OS_ReturnSave(); asm{ nop } ; } ; } } ;
  { _OS_ReturnSave(); asm{ nop } ; } ;


 }
}

void Task_LED1(void)
{
 for(;;)
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((csem != 0)) != 0) ; } ;
   { ; csem--; ; } ;

 LATD.RD1 = 1; Delay_ms(300); LATD.RD1 = 0;
  { _OS_InitDelay(500 /1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

   { for (;;) { ; _OS_Csem_Signal(&(csem)); ; if (! _OS_Flags.bEventError ) break; { _OS_ReturnSave(); asm{ nop } ; } ; } } ;
  { _OS_ReturnSave(); asm{ nop } ; } ;

 }
}

void Task_LED2(void)
{
 for(;;)
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((csem != 0)) != 0) ; } ;
   { ; csem--; ; } ;

 LATD.RD2 = 1; Delay_ms(300); LATD.RD2 = 0;
  { _OS_InitDelay(500 /1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

   { for (;;) { ; _OS_Csem_Signal(&(csem)); ; if (! _OS_Flags.bEventError ) break; { _OS_ReturnSave(); asm{ nop } ; } ; } } ;
  { _OS_ReturnSave(); asm{ nop } ; } ;

 }
}

void Task_LED3(void)
{
 for(;;)
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((csem != 0)) != 0) ; } ;
   { ; csem--; ; } ;

 LATD.RD3 = 1; Delay_ms(300); LATD.RD3 = 0;
  { _OS_InitDelay(500 /1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

   { for (;;) { ; _OS_Csem_Signal(&(csem)); ; if (! _OS_Flags.bEventError ) break; { _OS_ReturnSave(); asm{ nop } ; } ; } } ;
  { _OS_ReturnSave(); asm{ nop } ; } ;
 }
}
