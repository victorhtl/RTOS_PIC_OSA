
_INTERRUPT_HIGH:

;main.c,11 :: 		void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
;main.c,15 :: 		if (TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_INTERRUPT_HIGH0
;main.c,16 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;main.c,17 :: 		OS_Timer();
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
;main.c,18 :: 		}
L_INTERRUPT_HIGH0:
;main.c,20 :: 		UartRx();
	CALL        _UartRx+0, 0
;main.c,23 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH83:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,26 :: 		void main (void)
;main.c,28 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,29 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,30 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,31 :: 		InitUART();
	CALL        _InitUART+0, 0
;main.c,33 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,36 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LED0
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
;main.c,37 :: 		OS_Task_Create(1, Task_LED1);      //Cria task LED1
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
;main.c,38 :: 		OS_Task_Create(2, Task_LED2);      //Cria task LED2
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
;main.c,39 :: 		OS_Task_Create(3, Task_DEC);       //Cria task DEC (decodificador)
	MOVLW       3
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_DEC+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_DEC+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,41 :: 		OS_Queue_Create(queue, buffer, 10);
	CALL        __OS_DI_INT+0, 0
	MOVLW       10
	MOVWF       _queue+0 
	CLRF        _queue+2 
	CLRF        _queue+1 
	MOVLW       _buffer+0
	MOVWF       _queue+3 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       _queue+4 
	CALL        __OS_RI_INT+0, 0
;main.c,42 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main10
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main10:
;main.c,44 :: 		OS_Run();
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
	GOTO        L__main85
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main85:
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
	GOTO        L__main81
	BTFSC       __OS_State+0, 7 
	GOTO        L__main81
	GOTO        L_main22
L__main81:
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
L__main80:
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
	GOTO        L__main86
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main86:
	BTFSC       STATUS+0, 2 
	GOTO        L__main79
	GOTO        L_main14
L__main79:
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
L__main78:
	GOTO        ___main__OS_SCHED_RUN
L_main37:
L_main33:
___main_SCHED_END:
	GOTO        L_main11
;main.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_DEC:

;main.c,48 :: 		void Task_DEC(void)
;main.c,53 :: 		for(;;)
L_Task_DEC38:
;main.c,59 :: 		OS_Queue_Wait (queue, dta);
L_Task_DEC41:
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _queue+1, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	CALL        __OS_DI_INT+0, 0
	MOVF        _queue+1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC44
	GOTO        L_Task_DEC42
L_Task_DEC44:
	CALL        __OS_RI_INT+0, 0
	GOTO        L_Task_DEC41
L_Task_DEC42:
	MOVLW       _queue+0
	MOVWF       FARG__OS_Queue_Get_pQueue+0 
	MOVLW       hi_addr(_queue+0)
	MOVWF       FARG__OS_Queue_Get_pQueue+1 
	CALL        __OS_Queue_Get+0, 0
	MOVF        R0, 0 
	MOVWF       Task_DEC_dta_L0+0 
	MOVF        R1, 0 
	MOVWF       Task_DEC_dta_L0+1 
	CALL        __OS_RI_INT+0, 0
;main.c,62 :: 		if(dta[0] = 'L' && dta[1] == 'E' && dta[2] == 'D')
	MOVF        Task_DEC_dta_L0+0, 0 
	MOVWF       R1 
	MOVF        Task_DEC_dta_L0+1, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC46
	MOVLW       2
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC46
	MOVLW       1
	MOVWF       R0 
	GOTO        L_Task_DEC45
L_Task_DEC46:
	CLRF        R0 
L_Task_DEC45:
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC47
;main.c,65 :: 		if(dta[3] == 'D')
	MOVLW       3
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC48
;main.c,68 :: 		switch(dta[4])
	MOVLW       4
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FLOC__Task_DEC+0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FLOC__Task_DEC+1 
	GOTO        L_Task_DEC49
;main.c,70 :: 		case '5': { PORTD.RD5 = (dta[5]-'0'); break;}
L_Task_DEC51:
	MOVLW       5
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__Task_DEC88
	BCF         PORTD+0, 5 
	GOTO        L__Task_DEC89
L__Task_DEC88:
	BSF         PORTD+0, 5 
L__Task_DEC89:
	GOTO        L_Task_DEC50
;main.c,71 :: 		case '6': { PORTD.RD6 = (dta[5]-'0'); break;}
L_Task_DEC52:
	MOVLW       5
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__Task_DEC90
	BCF         PORTD+0, 6 
	GOTO        L__Task_DEC91
L__Task_DEC90:
	BSF         PORTD+0, 6 
L__Task_DEC91:
	GOTO        L_Task_DEC50
;main.c,72 :: 		case 'A': {
L_Task_DEC53:
;main.c,73 :: 		PORTD = (dta[5] == '1')?255:0;
	MOVLW       5
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC54
	MOVLW       255
	MOVWF       ?FLOC___Task_DECT151+0 
	GOTO        L_Task_DEC55
L_Task_DEC54:
	CLRF        ?FLOC___Task_DECT151+0 
L_Task_DEC55:
	MOVF        ?FLOC___Task_DECT151+0, 0 
	MOVWF       PORTD+0 
;main.c,75 :: 		WordToStr(PORTB, txt);
	MOVF        PORTB+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_DEC_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_DEC_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,76 :: 		UART1_Write_Text("[PB:");
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;main.c,77 :: 		UART1_Write_Text(txt);
	MOVLW       Task_DEC_txt_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(Task_DEC_txt_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;main.c,78 :: 		UART1_Write(']');
	MOVLW       93
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;main.c,79 :: 		break;
	GOTO        L_Task_DEC50
;main.c,82 :: 		}
L_Task_DEC49:
	MOVFF       FLOC__Task_DEC+0, FSR0
	MOVFF       FLOC__Task_DEC+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC51
	MOVFF       FLOC__Task_DEC+0, FSR0
	MOVFF       FLOC__Task_DEC+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC52
	MOVFF       FLOC__Task_DEC+0, FSR0
	MOVFF       FLOC__Task_DEC+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC53
L_Task_DEC50:
;main.c,84 :: 		}
L_Task_DEC48:
;main.c,86 :: 		}
	GOTO        L_Task_DEC56
L_Task_DEC47:
;main.c,88 :: 		if(dta[0] = 'A' && dta[1] == 'N')
	MOVF        Task_DEC_dta_L0+0, 0 
	MOVWF       R1 
	MOVF        Task_DEC_dta_L0+1, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       78
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC58
	MOVLW       1
	MOVWF       R0 
	GOTO        L_Task_DEC57
L_Task_DEC58:
	CLRF        R0 
L_Task_DEC57:
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC59
;main.c,90 :: 		switch(dta[2])
	MOVLW       2
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FLOC__Task_DEC+0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FLOC__Task_DEC+1 
	GOTO        L_Task_DEC60
;main.c,92 :: 		case '0': {
L_Task_DEC62:
;main.c,96 :: 		ANSELA.RA0 = 1;
	BSF         ANSELA+0, 0 
;main.c,97 :: 		TRISA.RA0 = 1;
	BSF         TRISA+0, 0 
;main.c,99 :: 		adc = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,100 :: 		WordToStr(adc, txt);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_DEC_txt_L4+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_DEC_txt_L4+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,101 :: 		UART1_Write_Text("[AN0:");
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;main.c,102 :: 		UART1_Write_Text(txt);
	MOVLW       Task_DEC_txt_L4+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(Task_DEC_txt_L4+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;main.c,103 :: 		UART1_Write(']');
	MOVLW       93
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;main.c,105 :: 		break;
	GOTO        L_Task_DEC61
;main.c,107 :: 		}
L_Task_DEC60:
	MOVFF       FLOC__Task_DEC+0, FSR0
	MOVFF       FLOC__Task_DEC+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC62
L_Task_DEC61:
;main.c,109 :: 		}
	GOTO        L_Task_DEC63
L_Task_DEC59:
;main.c,111 :: 		if(dta[0] = 'P' && dta[1] == 'W' && dta[2] == 'M')
	MOVF        Task_DEC_dta_L0+0, 0 
	MOVWF       R1 
	MOVF        Task_DEC_dta_L0+1, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC65
	MOVLW       2
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC65
	MOVLW       1
	MOVWF       R0 
	GOTO        L_Task_DEC64
L_Task_DEC65:
	CLRF        R0 
L_Task_DEC64:
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DEC66
;main.c,115 :: 		PWM1_Init(5000);  //5khz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;main.c,117 :: 		if(dta[3] == '1') { PWM1_Start();}
	MOVLW       3
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_DEC67
	CALL        _PWM1_Start+0, 0
	GOTO        L_Task_DEC68
L_Task_DEC67:
;main.c,119 :: 		{PWM1_Stop(); return;}
	CALL        _PWM1_Stop+0, 0
	GOTO        L_end_Task_DEC
L_Task_DEC68:
;main.c,121 :: 		duty = ((dta[4]-'0')*100) + ((dta[5]-'0')*10) + ((dta[6]-'0')*1);
	MOVLW       4
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	MOVLW       100
	MULWF       FARG_PWM1_Set_Duty_new_duty+0 
	MOVF        PRODL+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	MOVLW       5
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       FARG_PWM1_Set_Duty_new_duty+0, 1 
	MOVLW       6
	ADDWF       Task_DEC_dta_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DEC_dta_L0+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       FARG_PWM1_Set_Duty_new_duty+0, 1 
;main.c,122 :: 		PWM1_Set_Duty( duty );
	CALL        _PWM1_Set_Duty+0, 0
;main.c,125 :: 		}
L_Task_DEC66:
L_Task_DEC63:
L_Task_DEC56:
;main.c,127 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,128 :: 		}
	GOTO        L_Task_DEC38
;main.c,129 :: 		}
L_end_Task_DEC:
	RETURN      0
; end of _Task_DEC

_Task_LED0:

;main.c,131 :: 		void Task_LED0(void)
;main.c,133 :: 		for(;;)
L_Task_LED069:
;main.c,135 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,136 :: 		OS_Delay(300 ms);
	MOVLW       44
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,137 :: 		}
	GOTO        L_Task_LED069
;main.c,138 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_LED1:

;main.c,140 :: 		void Task_LED1(void)
;main.c,142 :: 		for(;;)
L_Task_LED172:
;main.c,144 :: 		LATD.RD1 = ~LATD.RD1;
	BTG         LATD+0, 1 
;main.c,145 :: 		OS_Delay(300 ms);
	MOVLW       44
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,146 :: 		}
	GOTO        L_Task_LED172
;main.c,147 :: 		}
L_end_Task_LED1:
	RETURN      0
; end of _Task_LED1

_Task_LED2:

;main.c,149 :: 		void Task_LED2(void)
;main.c,151 :: 		for(;;)
L_Task_LED275:
;main.c,153 :: 		LATD.RD2 = ~LATD.RD2;
	BTG         LATD+0, 2 
;main.c,154 :: 		OS_Delay(300 ms);
	MOVLW       44
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,155 :: 		}
	GOTO        L_Task_LED275
;main.c,156 :: 		}
L_end_Task_LED2:
	RETURN      0
; end of _Task_LED2
