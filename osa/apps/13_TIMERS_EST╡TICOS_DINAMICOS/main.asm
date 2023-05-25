
_INTERRUPT_HIGH:

;main.c,7 :: 		void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
;main.c,10 :: 		if (TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_INTERRUPT_HIGH0
;main.c,11 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;main.c,12 :: 		OS_Timer();
	CLRF        INTERRUPT_HIGH__os_i_L3+0 
L_INTERRUPT_HIGH1:
	MOVLW       4
	SUBWF       INTERRUPT_HIGH__os_i_L3+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_INTERRUPT_HIGH2
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        INTERRUPT_HIGH__os_i_L3+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSS       R0, 4 
	GOTO        L_INTERRUPT_HIGH4
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        INTERRUPT_HIGH__os_i_L3+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 1 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R3 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	IORWF       R1, 0 
	IORWF       R2, 0 
	IORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_INTERRUPT_HIGH5
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        INTERRUPT_HIGH__os_i_L3+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	BCF         POSTINC1+0, 4 
L_INTERRUPT_HIGH5:
L_INTERRUPT_HIGH4:
	INCF        INTERRUPT_HIGH__os_i_L3+0, 1 
	GOTO        L_INTERRUPT_HIGH1
L_INTERRUPT_HIGH2:
	CLRF        INTERRUPT_HIGH__os_i_L3_L3+0 
L_INTERRUPT_HIGH6:
	MOVLW       2
	SUBWF       INTERRUPT_HIGH__os_i_L3_L3+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_INTERRUPT_HIGH7
	MOVF        INTERRUPT_HIGH__os_i_L3_L3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       __OS_Stimers+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(__OS_Stimers+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	BTFSS       R7, 7 
	GOTO        L_INTERRUPT_HIGH9
	MOVF        INTERRUPT_HIGH__os_i_L3_L3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       __OS_Stimers+0
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       hi_addr(__OS_Stimers+0)
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	ADDWFC      R2, 1 
	ADDWFC      R3, 1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
L_INTERRUPT_HIGH9:
	INCF        INTERRUPT_HIGH__os_i_L3_L3+0, 1 
	GOTO        L_INTERRUPT_HIGH6
L_INTERRUPT_HIGH7:
;main.c,13 :: 		}
L_INTERRUPT_HIGH0:
;main.c,15 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH55:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,18 :: 		void main (void)
;main.c,20 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,21 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,22 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,24 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,27 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED0+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED0+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,28 :: 		OS_Task_Create(0, Task_LED1);      //Cria task LED1 (máxima prioridade)
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,29 :: 		OS_Task_Create(0, Task_LED2);      //Cria task LED2 (máxima prioridade)
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED2+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED2+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,31 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main10
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main10:
;main.c,33 :: 		OS_Run();
L_main11:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main14:
	MOVLW       hi_addr(__OS_Tasks+27)
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main57:
	BTFSS       STATUS+0, 0 
	GOTO        L_main17
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main18
L_main17:
	MOVLW       9
	ADDWF       __OS_CurTask+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_CurTask+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        R1, 0 
	MOVWF       __OS_CurTask+1 
L_main18:
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main19:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
	BTFSS       __OS_State+0, 6 
	GOTO        L__main53
	BTFSC       __OS_State+0, 7 
	GOTO        L__main53
	GOTO        L_main22
L__main53:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main22:
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_Best_Priority+0, 0 
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main23
	GOTO        ___main__OS_SCHED_CONTINUE
L_main23:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main24
___main__OS_SCHED_RUN:
	CALL        __OS_JumpToTask+0, 0
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
	MOVLW       215
	ANDWF       __indf+0, 1 
	MOVLW       40
	ANDWF       __OS_State+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       __indf+0, 1 
	BTFSC       __OS_Flags+0, 3 
	GOTO        L_main25
	GOTO        ___main_SCHED_END
L_main25:
L_main24:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main28
	BTFSC       __OS_State+0, 5 
	GOTO        L_main28
L__main52:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main28:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main29
	BSF         __OS_Flags+0, 4 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       __OS_BestTask+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       __OS_BestTask+1 
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_Best_Priority+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
	GOTO        L_main15
L_main30:
L_main29:
___main__OS_SCHED_CONTINUE:
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main58:
	BTFSC       STATUS+0, 2 
	GOTO        L__main51
	GOTO        L_main14
L__main51:
L_main15:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main33
	BCF         __OS_Flags+0, 3 
	MOVF        __OS_BestTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_BestTask+1, 0 
	MOVWF       __OS_CurTask+1 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       __OS_LastTask+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       __OS_LastTask+1 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main34:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
	BTFSS       __OS_State+0, 6 
	GOTO        L_main37
	BTFSC       __OS_State+0, 7 
	GOTO        L_main37
L__main50:
	GOTO        ___main__OS_SCHED_RUN
L_main37:
L_main33:
___main_SCHED_END:
	GOTO        L_main11
;main.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_LED0:

;main.c,40 :: 		void Task_LED0 (void)
;main.c,42 :: 		OS_Stimer_Run(stimer1, 100);
	MOVLW       255
	ANDWF       __OS_Stimers+0, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+1, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+2, 1 
	MOVLW       127
	ANDWF       __OS_Stimers+3, 1 
	MOVLW       156
	MOVWF       __OS_Stimers+0 
	MOVLW       255
	MOVWF       __OS_Stimers+1 
	MOVWF       __OS_Stimers+2 
	MOVWF       __OS_Stimers+3 
;main.c,44 :: 		for(;;)
L_Task_LED038:
;main.c,46 :: 		if (!OS_Stimer_IsRun(stimer1))
	BTFSC       __OS_Stimers+3, 7 
	GOTO        L_Task_LED041
;main.c,48 :: 		OS_Stimer_Wait(stimer1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       0
	ANDWF       __OS_Stimers+0, 0 
	MOVWF       R0 
	MOVLW       0
	ANDWF       __OS_Stimers+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       __OS_Stimers+2, 0 
	MOVWF       R2 
	MOVLW       128
	ANDWF       __OS_Stimers+3, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	IORWF       R1, 0 
	IORWF       R2, 0 
	IORWF       R3, 0 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,49 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,50 :: 		OS_Stimer_Run(stimer1, 100);
	MOVLW       255
	ANDWF       __OS_Stimers+0, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+1, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+2, 1 
	MOVLW       127
	ANDWF       __OS_Stimers+3, 1 
	MOVLW       156
	MOVWF       __OS_Stimers+0 
	MOVLW       255
	MOVWF       __OS_Stimers+1 
	MOVWF       __OS_Stimers+2 
	MOVWF       __OS_Stimers+3 
;main.c,51 :: 		}
L_Task_LED041:
;main.c,53 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,54 :: 		}
	GOTO        L_Task_LED038
;main.c,55 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_LED1:

;main.c,58 :: 		void Task_LED1 (void)
;main.c,61 :: 		OS_Stimer_Run(stimer2, 500);
	MOVLW       255
	ANDWF       __OS_Stimers+4, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+5, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+6, 1 
	MOVLW       127
	ANDWF       __OS_Stimers+7, 1 
	MOVLW       12
	MOVWF       __OS_Stimers+4 
	MOVLW       254
	MOVWF       __OS_Stimers+5 
	MOVLW       255
	MOVWF       __OS_Stimers+6 
	MOVWF       __OS_Stimers+7 
;main.c,63 :: 		for(;;)
L_Task_LED142:
;main.c,65 :: 		if (!OS_Stimer_IsRun(stimer2))
	BTFSC       __OS_Stimers+7, 7 
	GOTO        L_Task_LED145
;main.c,67 :: 		OS_Stimer_Wait(stimer2);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       0
	ANDWF       __OS_Stimers+4, 0 
	MOVWF       R0 
	MOVLW       0
	ANDWF       __OS_Stimers+5, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       __OS_Stimers+6, 0 
	MOVWF       R2 
	MOVLW       128
	ANDWF       __OS_Stimers+7, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	IORWF       R1, 0 
	IORWF       R2, 0 
	IORWF       R3, 0 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,68 :: 		LATD.RD1 = ~LATD.RD1;
	BTG         LATD+0, 1 
;main.c,69 :: 		OS_Stimer_Run(stimer2, 500);
	MOVLW       255
	ANDWF       __OS_Stimers+4, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+5, 1 
	MOVLW       255
	ANDWF       __OS_Stimers+6, 1 
	MOVLW       127
	ANDWF       __OS_Stimers+7, 1 
	MOVLW       12
	MOVWF       __OS_Stimers+4 
	MOVLW       254
	MOVWF       __OS_Stimers+5 
	MOVLW       255
	MOVWF       __OS_Stimers+6 
	MOVWF       __OS_Stimers+7 
;main.c,70 :: 		}
L_Task_LED145:
;main.c,72 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,73 :: 		}
	GOTO        L_Task_LED142
;main.c,75 :: 		}
L_end_Task_LED1:
	RETURN      0
; end of _Task_LED1

_Task_LED2:

;main.c,77 :: 		void Task_LED2 (void)
;main.c,81 :: 		for(;;)
L_Task_LED246:
;main.c,83 :: 		if(OS_Stimer_Found()){
	CLRF        FARG__OS_Stimer_GetFree_bCreate+0 
	CALL        __OS_Stimer_GetFree+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_LED249
;main.c,84 :: 		OS_Stimer_Alloc(stimer_id);
	MOVLW       1
	MOVWF       FARG__OS_Stimer_GetFree_bCreate+0 
	CALL        __OS_Stimer_GetFree+0, 0
	MOVF        R0, 0 
	MOVWF       Task_LED2_stimer_id_L0+0 
;main.c,85 :: 		OS_Stimer_Run(stimer_id, 2000);
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	MOVLW       __OS_Stimers+0
	ADDWF       R1, 0 
	MOVWF       R4 
	MOVLW       hi_addr(__OS_Stimers+0)
	ADDWFC      R2, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       255
	ANDWF       R0, 1 
	MOVLW       255
	ANDWF       R1, 1 
	MOVLW       255
	ANDWF       R2, 1 
	MOVLW       127
	ANDWF       R3, 1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
	MOVF        Task_LED2_stimer_id_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       __OS_Stimers+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_Stimers+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       48
	MOVWF       POSTINC1+0 
	MOVLW       248
	MOVWF       POSTINC1+0 
	MOVLW       255
	MOVWF       POSTINC1+0 
	MOVWF       POSTINC1+0 
;main.c,87 :: 		OS_Stimer_Wait(stimer_id);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        Task_LED2_stimer_id_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       __OS_Stimers+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(__OS_Stimers+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       0
	ANDWF       R0, 1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       0
	ANDWF       R2, 1 
	MOVLW       128
	ANDWF       R3, 1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	IORWF       R2, 0 
	IORWF       R3, 0 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,88 :: 		LATD.RD2 = ~LATD.RD2;
	BTG         LATD+0, 2 
;main.c,90 :: 		OS_Stimer_Free(stimer_id);
	MOVF        Task_LED2_stimer_id_L0+0, 0 
	MOVWF       FARG__OS_Stimer_Free_ID+0 
	CALL        __OS_Stimer_Free+0, 0
;main.c,92 :: 		}
L_Task_LED249:
;main.c,94 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,95 :: 		}
	GOTO        L_Task_LED246
;main.c,97 :: 		}
L_end_Task_LED2:
	RETURN      0
; end of _Task_LED2
