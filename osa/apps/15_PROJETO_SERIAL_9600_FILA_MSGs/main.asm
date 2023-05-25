
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
L__INTERRUPT_HIGH58:
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
;main.c,27 :: 		OS_Task_Create(2, Task_LED0);      //Cria task LED0
	MOVLW       2
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED0+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED0+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,28 :: 		OS_Task_Create(1, Task_LED1);      //Cria task LED1
	MOVLW       1
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,29 :: 		OS_Task_Create(0, Task_LED2);      //Cria task LED2
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
	GOTO        L__main60
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main60:
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
	GOTO        L__main56
	BTFSC       __OS_State+0, 7 
	GOTO        L__main56
	GOTO        L_main22
L__main56:
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
L__main55:
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
	GOTO        L__main61
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main61:
	BTFSC       STATUS+0, 2 
	GOTO        L__main54
	GOTO        L_main14
L__main54:
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
L__main53:
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

;main.c,39 :: 		void Task_LED0(void)
;main.c,41 :: 		tp_Task = OS_Task_GetCur();
	MOVF        __OS_CurTask+0, 0 
	MOVWF       _tp_Task+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       _tp_Task+1 
;main.c,42 :: 		for(;;)
L_Task_LED038:
;main.c,44 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,45 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Task_LED041:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED041
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED041
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED041
	NOP
;main.c,46 :: 		OS_Task_Pause(tp_Task);
	MOVFF       _tp_Task+0, FSR1
	MOVFF       _tp_Task+1, FSR1H
	BSF         POSTINC1+0, 7 
	MOVF        _tp_Task+1, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_LED063
	MOVF        __OS_CurTask+0, 0 
	XORWF       _tp_Task+0, 0 
L__Task_LED063:
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_LED042
	BSF         __OS_State+0, 7 
	CALL        __OS_ReturnSave+0, 0
	NOP
L_Task_LED042:
;main.c,48 :: 		}
	GOTO        L_Task_LED038
;main.c,49 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_LED1:

;main.c,51 :: 		void Task_LED1(void)
;main.c,53 :: 		tp_Task = OS_Task_GetCur();
	MOVF        __OS_CurTask+0, 0 
	MOVWF       _tp_Task+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       _tp_Task+1 
;main.c,54 :: 		for(;;)
L_Task_LED143:
;main.c,56 :: 		LATD.RD1 = ~LATD.RD1;
	BTG         LATD+0, 1 
;main.c,57 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Task_LED146:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED146
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED146
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED146
	NOP
;main.c,58 :: 		OS_Task_Pause(tp_Task);
	MOVFF       _tp_Task+0, FSR1
	MOVFF       _tp_Task+1, FSR1H
	BSF         POSTINC1+0, 7 
	MOVF        _tp_Task+1, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_LED165
	MOVF        __OS_CurTask+0, 0 
	XORWF       _tp_Task+0, 0 
L__Task_LED165:
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_LED147
	BSF         __OS_State+0, 7 
	CALL        __OS_ReturnSave+0, 0
	NOP
L_Task_LED147:
;main.c,60 :: 		}
	GOTO        L_Task_LED143
;main.c,61 :: 		}
L_end_Task_LED1:
	RETURN      0
; end of _Task_LED1

_Task_LED2:

;main.c,63 :: 		void Task_LED2(void)
;main.c,65 :: 		tp_Task = OS_Task_GetCur();
	MOVF        __OS_CurTask+0, 0 
	MOVWF       _tp_Task+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       _tp_Task+1 
;main.c,66 :: 		for(;;)
L_Task_LED248:
;main.c,68 :: 		LATD.RD2 = ~LATD.RD2;
	BTG         LATD+0, 2 
;main.c,69 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Task_LED251:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED251
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED251
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED251
	NOP
;main.c,70 :: 		OS_Task_Pause(tp_Task);
	MOVFF       _tp_Task+0, FSR1
	MOVFF       _tp_Task+1, FSR1H
	BSF         POSTINC1+0, 7 
	MOVF        _tp_Task+1, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_LED267
	MOVF        __OS_CurTask+0, 0 
	XORWF       _tp_Task+0, 0 
L__Task_LED267:
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_LED252
	BSF         __OS_State+0, 7 
	CALL        __OS_ReturnSave+0, 0
	NOP
L_Task_LED252:
;main.c,72 :: 		}
	GOTO        L_Task_LED248
;main.c,73 :: 		}
L_end_Task_LED2:
	RETURN      0
; end of _Task_LED2
