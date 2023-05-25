
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
;main.c,13 :: 		}
L_INTERRUPT_HIGH0:
;main.c,15 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH72:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,18 :: 		void main (void)
;main.c,20 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,21 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,23 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,26 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LE0 (máxima prioridade)
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
;main.c,27 :: 		OS_Task_Create(1, Task_LED1);      //Cria task LE1 (máxima prioridade)
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
;main.c,28 :: 		OS_Task_Create(2, Task_LED2);      //Cria task LE2 (máxima prioridade)
	MOVLW       2
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED2+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED2+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,29 :: 		OS_Task_Create(3, Task_LED3);      //Cria task LE3 (máxima prioridade)
	MOVLW       3
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LED3+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LED3+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,31 :: 		OS_Csem_Create(csem);
	CLRF        _csem+0 
;main.c,32 :: 		OS_Csem_SetValue(csem, 1);
	MOVLW       1
	MOVWF       _csem+0 
;main.c,34 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main6
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main6:
;main.c,36 :: 		OS_Run();
L_main7:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	BTFSS       __OS_Flags+0, 2 
	GOTO        L_main10
	GOTO        ___main__OS_SCHED_CHECK_READY
L_main10:
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main11:
	MOVLW       hi_addr(__OS_Tasks+27)
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main74
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main74:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main15
L_main14:
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
L_main15:
___main__OS_SCHED_CHECK_READY:
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
L_main16:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
	BTFSS       __OS_State+0, 6 
	GOTO        L__main70
	BTFSC       __OS_State+0, 7 
	GOTO        L__main70
	GOTO        L_main19
L__main70:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main19:
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_Best_Priority+0, 0 
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main20
	GOTO        ___main__OS_SCHED_CONTINUE
L_main20:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main21
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
	GOTO        L_main22
	GOTO        ___main_SCHED_END
L_main22:
L_main21:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main25
	BTFSC       __OS_State+0, 5 
	GOTO        L_main25
L__main69:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main25:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main26
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
	GOTO        L_main27
	GOTO        L_main12
L_main27:
L_main26:
___main__OS_SCHED_CONTINUE:
	BTFSC       __OS_Flags+0, 2 
	GOTO        L__main68
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main75
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main75:
	BTFSC       STATUS+0, 2 
	GOTO        L__main68
	GOTO        L_main11
L__main68:
L_main12:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main30
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
L_main31:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
	BTFSS       __OS_State+0, 6 
	GOTO        L_main34
	BTFSC       __OS_State+0, 7 
	GOTO        L_main34
L__main67:
	GOTO        ___main__OS_SCHED_RUN
L_main34:
L_main30:
___main_SCHED_END:
	GOTO        L_main7
;main.c,38 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_LED0:

;main.c,43 :: 		void Task_LED0(void)
;main.c,45 :: 		for(;;)
L_Task_LED035:
;main.c,47 :: 		OS_Cond_Wait(OS_Csem_Check (csem));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _csem+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,48 :: 		OS_Csem_Accept(csem);
	DECF        _csem+0, 1 
;main.c,50 :: 		LATD.RD0 = 1; Delay_ms(300); LATD.RD0 = 0;
	BSF         LATD+0, 0 
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_Task_LED038:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED038
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED038
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED038
	NOP
	NOP
	BCF         LATD+0, 0 
;main.c,51 :: 		OS_Delay(500 ms);
	MOVLW       244
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,53 :: 		OS_Csem_Signal(csem);
L_Task_LED039:
	MOVLW       _csem+0
	MOVWF       FARG__OS_Csem_Signal_pCSem+0 
	MOVLW       hi_addr(_csem+0)
	MOVWF       FARG__OS_Csem_Signal_pCSem+1 
	CALL        __OS_Csem_Signal+0, 0
	BTFSC       __OS_Flags+0, 0 
	GOTO        L_Task_LED042
	GOTO        L_Task_LED040
L_Task_LED042:
	CALL        __OS_ReturnSave+0, 0
	NOP
	GOTO        L_Task_LED039
L_Task_LED040:
;main.c,54 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,57 :: 		}
	GOTO        L_Task_LED035
;main.c,58 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_LED1:

;main.c,60 :: 		void Task_LED1(void)
;main.c,62 :: 		for(;;)
L_Task_LED143:
;main.c,64 :: 		OS_Cond_Wait(OS_Csem_Check (csem));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _csem+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,65 :: 		OS_Csem_Accept(csem);
	DECF        _csem+0, 1 
;main.c,67 :: 		LATD.RD1 = 1; Delay_ms(300); LATD.RD1 = 0;
	BSF         LATD+0, 1 
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_Task_LED146:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED146
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED146
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED146
	NOP
	NOP
	BCF         LATD+0, 1 
;main.c,68 :: 		OS_Delay(500 ms);
	MOVLW       244
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,70 :: 		OS_Csem_Signal(csem);
L_Task_LED147:
	MOVLW       _csem+0
	MOVWF       FARG__OS_Csem_Signal_pCSem+0 
	MOVLW       hi_addr(_csem+0)
	MOVWF       FARG__OS_Csem_Signal_pCSem+1 
	CALL        __OS_Csem_Signal+0, 0
	BTFSC       __OS_Flags+0, 0 
	GOTO        L_Task_LED150
	GOTO        L_Task_LED148
L_Task_LED150:
	CALL        __OS_ReturnSave+0, 0
	NOP
	GOTO        L_Task_LED147
L_Task_LED148:
;main.c,71 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,73 :: 		}
	GOTO        L_Task_LED143
;main.c,74 :: 		}
L_end_Task_LED1:
	RETURN      0
; end of _Task_LED1

_Task_LED2:

;main.c,76 :: 		void Task_LED2(void)
;main.c,78 :: 		for(;;)
L_Task_LED251:
;main.c,80 :: 		OS_Cond_Wait(OS_Csem_Check (csem));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _csem+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,81 :: 		OS_Csem_Accept(csem);
	DECF        _csem+0, 1 
;main.c,83 :: 		LATD.RD2 = 1; Delay_ms(300); LATD.RD2 = 0;
	BSF         LATD+0, 2 
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_Task_LED254:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED254
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED254
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED254
	NOP
	NOP
	BCF         LATD+0, 2 
;main.c,84 :: 		OS_Delay(500 ms);
	MOVLW       244
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,86 :: 		OS_Csem_Signal(csem);
L_Task_LED255:
	MOVLW       _csem+0
	MOVWF       FARG__OS_Csem_Signal_pCSem+0 
	MOVLW       hi_addr(_csem+0)
	MOVWF       FARG__OS_Csem_Signal_pCSem+1 
	CALL        __OS_Csem_Signal+0, 0
	BTFSC       __OS_Flags+0, 0 
	GOTO        L_Task_LED258
	GOTO        L_Task_LED256
L_Task_LED258:
	CALL        __OS_ReturnSave+0, 0
	NOP
	GOTO        L_Task_LED255
L_Task_LED256:
;main.c,87 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,89 :: 		}
	GOTO        L_Task_LED251
;main.c,90 :: 		}
L_end_Task_LED2:
	RETURN      0
; end of _Task_LED2

_Task_LED3:

;main.c,92 :: 		void Task_LED3(void)
;main.c,94 :: 		for(;;)
L_Task_LED359:
;main.c,96 :: 		OS_Cond_Wait(OS_Csem_Check (csem));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _csem+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,97 :: 		OS_Csem_Accept(csem);
	DECF        _csem+0, 1 
;main.c,99 :: 		LATD.RD3 = 1; Delay_ms(300); LATD.RD3 = 0;
	BSF         LATD+0, 3 
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_Task_LED362:
	DECFSZ      R13, 1, 1
	BRA         L_Task_LED362
	DECFSZ      R12, 1, 1
	BRA         L_Task_LED362
	DECFSZ      R11, 1, 1
	BRA         L_Task_LED362
	NOP
	NOP
	BCF         LATD+0, 3 
;main.c,100 :: 		OS_Delay(500 ms);
	MOVLW       244
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,102 :: 		OS_Csem_Signal(csem);
L_Task_LED363:
	MOVLW       _csem+0
	MOVWF       FARG__OS_Csem_Signal_pCSem+0 
	MOVLW       hi_addr(_csem+0)
	MOVWF       FARG__OS_Csem_Signal_pCSem+1 
	CALL        __OS_Csem_Signal+0, 0
	BTFSC       __OS_Flags+0, 0 
	GOTO        L_Task_LED366
	GOTO        L_Task_LED364
L_Task_LED366:
	CALL        __OS_ReturnSave+0, 0
	NOP
	GOTO        L_Task_LED363
L_Task_LED364:
;main.c,103 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,104 :: 		}
	GOTO        L_Task_LED359
;main.c,105 :: 		}
L_end_Task_LED3:
	RETURN      0
; end of _Task_LED3
