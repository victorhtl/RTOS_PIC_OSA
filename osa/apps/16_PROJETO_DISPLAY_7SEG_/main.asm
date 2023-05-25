
_INTERRUPT_HIGH:

;main.c,25 :: 		void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
;main.c,28 :: 		if (TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_INTERRUPT_HIGH0
;main.c,29 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;main.c,30 :: 		OS_Timer();
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
;main.c,31 :: 		}
L_INTERRUPT_HIGH0:
;main.c,33 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH83:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,36 :: 		void main (void)
;main.c,38 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,39 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,40 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,42 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,45 :: 		OS_Task_Create(0, Task_DISP7);
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_DISP7+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_DISP7+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,46 :: 		OS_Task_Create(0, Task_BUTTON0);
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_BUTTON0+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_BUTTON0+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,47 :: 		OS_Task_Create(0, Task_BUTTON1);
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_BUTTON1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_BUTTON1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,49 :: 		OS_Queue_Create(queue, buffer, 10);
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
;main.c,51 :: 		Contador = (EEPROM_Read(0x01) << 8) | (EEPROM_Read(0x00));
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	CLRF        FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	IORWF       FLOC__main+0, 0 
	MOVWF       _Contador+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _Contador+1 
	MOVLW       0
	IORWF       _Contador+1, 1 
;main.c,52 :: 		if(Contador > 9999) Contador = 0;
	MOVF        _Contador+1, 0 
	SUBLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L__main85
	MOVF        _Contador+0, 0 
	SUBLW       15
L__main85:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
	CLRF        _Contador+0 
	CLRF        _Contador+1 
L_main10:
;main.c,53 :: 		DispMsg(Contador, FALSE);  //Envia a Msg sem gravar na EEPROM
	MOVF        _Contador+0, 0 
	MOVWF       FARG_DispMsg_Contador+0 
	MOVF        _Contador+1, 0 
	MOVWF       FARG_DispMsg_Contador+1 
	CLRF        FARG_DispMsg_Enable+0 
	CALL        _DispMsg+0, 0
;main.c,55 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main11
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main11:
;main.c,57 :: 		OS_Run();
L_main12:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	BTFSS       __OS_Flags+0, 2 
	GOTO        L_main15
	GOTO        ___main__OS_SCHED_CHECK_READY
L_main15:
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main16:
	MOVLW       hi_addr(__OS_Tasks+27)
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main86
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main86:
	BTFSS       STATUS+0, 0 
	GOTO        L_main19
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main20
L_main19:
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
L_main20:
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
L_main21:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	BTFSS       __OS_State+0, 6 
	GOTO        L__main81
	BTFSC       __OS_State+0, 7 
	GOTO        L__main81
	GOTO        L_main24
L__main81:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main24:
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_Best_Priority+0, 0 
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main25
	GOTO        ___main__OS_SCHED_CONTINUE
L_main25:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main26
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
	GOTO        L_main27
	GOTO        ___main_SCHED_END
L_main27:
L_main26:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main30
	BTFSC       __OS_State+0, 5 
	GOTO        L_main30
L__main80:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main30:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main31
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
	GOTO        L_main32
	GOTO        L_main17
L_main32:
L_main31:
___main__OS_SCHED_CONTINUE:
	BTFSC       __OS_Flags+0, 2 
	GOTO        L__main79
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main87
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main87:
	BTFSC       STATUS+0, 2 
	GOTO        L__main79
	GOTO        L_main16
L__main79:
L_main17:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main35
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
L_main36:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
	BTFSS       __OS_State+0, 6 
	GOTO        L_main39
	BTFSC       __OS_State+0, 7 
	GOTO        L_main39
L__main78:
	GOTO        ___main__OS_SCHED_RUN
L_main39:
L_main35:
___main_SCHED_END:
	GOTO        L_main12
;main.c,59 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_DISP7:

;main.c,62 :: 		void Task_DISP7(void)
;main.c,72 :: 		for(;;)
L_Task_DISP740:
;main.c,74 :: 		PORTA &= 0xF0;      //Apaga nible menos desliga displays
	MOVLW       240
	ANDWF       PORTA+0, 1 
;main.c,76 :: 		if (OS_Queue_Check(queue))
	MOVF        _queue+1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DISP743
;main.c,78 :: 		OS_Queue_Accept(queue, Mat_Mostra_Disp);  // then accept it
	CALL        __OS_DI_INT+0, 0
	MOVLW       _queue+0
	MOVWF       FARG__OS_Queue_Get_pQueue+0 
	MOVLW       hi_addr(_queue+0)
	MOVWF       FARG__OS_Queue_Get_pQueue+1 
	CALL        __OS_Queue_Get+0, 0
	MOVF        R0, 0 
	MOVWF       Task_DISP7_Mat_Mostra_Disp_L0+0 
	MOVF        R1, 0 
	MOVWF       Task_DISP7_Mat_Mostra_Disp_L0+1 
	CALL        __OS_RI_INT+0, 0
;main.c,79 :: 		}
L_Task_DISP743:
;main.c,81 :: 		switch (_maq_estado)
	GOTO        L_Task_DISP744
;main.c,83 :: 		case _disp1: {
L_Task_DISP746:
;main.c,84 :: 		PORTD = Mat_Mostra_Disp[0];     //Escreve valor no display de Unidade
	MOVFF       Task_DISP7_Mat_Mostra_Disp_L0+0, FSR0
	MOVFF       Task_DISP7_Mat_Mostra_Disp_L0+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;main.c,85 :: 		UNIDADE = 1;
	BSF         PORTA+0, 0 
;main.c,86 :: 		_maq_estado = _disp2;
	MOVLW       2
	MOVWF       Task_DISP7__maq_estado_L0+0 
;main.c,87 :: 		break;
	GOTO        L_Task_DISP745
;main.c,89 :: 		case _disp2: {
L_Task_DISP747:
;main.c,90 :: 		PORTD = Mat_Mostra_Disp[1];    //Escreve valor no display de Dezena
	MOVLW       1
	ADDWF       Task_DISP7_Mat_Mostra_Disp_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DISP7_Mat_Mostra_Disp_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;main.c,91 :: 		DEZENA = 1;
	BSF         PORTA+0, 1 
;main.c,92 :: 		_maq_estado = _disp3;
	MOVLW       3
	MOVWF       Task_DISP7__maq_estado_L0+0 
;main.c,93 :: 		break;
	GOTO        L_Task_DISP745
;main.c,95 :: 		case _disp3: {
L_Task_DISP748:
;main.c,96 :: 		PORTD = Mat_Mostra_Disp[2];     //Escreve valor no display de Centena
	MOVLW       2
	ADDWF       Task_DISP7_Mat_Mostra_Disp_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DISP7_Mat_Mostra_Disp_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;main.c,97 :: 		CENTENA = 1;
	BSF         PORTA+0, 2 
;main.c,98 :: 		_maq_estado = _disp4;
	MOVLW       4
	MOVWF       Task_DISP7__maq_estado_L0+0 
;main.c,99 :: 		break;
	GOTO        L_Task_DISP745
;main.c,101 :: 		case _disp4: {
L_Task_DISP749:
;main.c,102 :: 		PORTD = Mat_Mostra_Disp[3];     //Escreve valor no display de Milhar
	MOVLW       3
	ADDWF       Task_DISP7_Mat_Mostra_Disp_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      Task_DISP7_Mat_Mostra_Disp_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;main.c,103 :: 		MILHAR = 1;
	BSF         PORTA+0, 3 
;main.c,104 :: 		_maq_estado = _disp1;
	MOVLW       1
	MOVWF       Task_DISP7__maq_estado_L0+0 
;main.c,105 :: 		break;
	GOTO        L_Task_DISP745
;main.c,107 :: 		default: break;
L_Task_DISP750:
	GOTO        L_Task_DISP745
;main.c,108 :: 		}
L_Task_DISP744:
	MOVF        Task_DISP7__maq_estado_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DISP746
	MOVF        Task_DISP7__maq_estado_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DISP747
	MOVF        Task_DISP7__maq_estado_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DISP748
	MOVF        Task_DISP7__maq_estado_L0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_DISP749
	GOTO        L_Task_DISP750
L_Task_DISP745:
;main.c,110 :: 		OS_Delay(2 ms);
	MOVLW       2
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,111 :: 		}
	GOTO        L_Task_DISP740
;main.c,112 :: 		}
L_end_Task_DISP7:
	RETURN      0
; end of _Task_DISP7

_Task_BUTTON0:

;main.c,115 :: 		void Task_BUTTON0(void)
;main.c,118 :: 		for (;;)
L_Task_BUTTON051:
;main.c,120 :: 		do
L_Task_BUTTON054:
;main.c,122 :: 		OS_Cond_Wait(!pin_BUTTON0);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 0 
	GOTO        L__Task_BUTTON090
	BSF         4056, 0 
	GOTO        L__Task_BUTTON091
L__Task_BUTTON090:
	BCF         4056, 0 
L__Task_BUTTON091:
	MOVLW       0
	BTFSC       4056, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,123 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,124 :: 		} while (pin_BUTTON0);
	BTFSC       PORTE+0, 0 
	GOTO        L_Task_BUTTON054
;main.c,127 :: 		if(Contador < 9999)
	MOVLW       39
	SUBWF       _Contador+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_BUTTON092
	MOVLW       15
	SUBWF       _Contador+0, 0 
L__Task_BUTTON092:
	BTFSC       STATUS+0, 0 
	GOTO        L_Task_BUTTON057
;main.c,128 :: 		DispMsg(++Contador, TRUE);  //Envia a Msg e Grava na EEPROM
	MOVLW       1
	ADDWF       _Contador+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _Contador+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _Contador+0 
	MOVF        R1, 0 
	MOVWF       _Contador+1 
	MOVF        _Contador+0, 0 
	MOVWF       FARG_DispMsg_Contador+0 
	MOVF        _Contador+1, 0 
	MOVWF       FARG_DispMsg_Contador+1 
	MOVLW       1
	MOVWF       FARG_DispMsg_Enable+0 
	CALL        _DispMsg+0, 0
L_Task_BUTTON057:
;main.c,131 :: 		do
L_Task_BUTTON058:
;main.c,133 :: 		OS_Cond_Wait(pin_BUTTON0);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       0
	BTFSC       PORTE+0, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,134 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,135 :: 		} while (!pin_BUTTON0);
	BTFSS       PORTE+0, 0 
	GOTO        L_Task_BUTTON058
;main.c,137 :: 		}
	GOTO        L_Task_BUTTON051
;main.c,138 :: 		}
L_end_Task_BUTTON0:
	RETURN      0
; end of _Task_BUTTON0

_Task_BUTTON1:

;main.c,140 :: 		void Task_BUTTON1(void)
;main.c,143 :: 		for (;;)
L_Task_BUTTON161:
;main.c,145 :: 		do
L_Task_BUTTON164:
;main.c,147 :: 		OS_Cond_Wait(!pin_BUTTON1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 1 
	GOTO        L__Task_BUTTON194
	BSF         4056, 0 
	GOTO        L__Task_BUTTON195
L__Task_BUTTON194:
	BCF         4056, 0 
L__Task_BUTTON195:
	MOVLW       0
	BTFSC       4056, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,148 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,149 :: 		} while (pin_BUTTON1);
	BTFSC       PORTE+0, 1 
	GOTO        L_Task_BUTTON164
;main.c,152 :: 		if(Contador > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _Contador+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_BUTTON196
	MOVF        _Contador+0, 0 
	SUBLW       0
L__Task_BUTTON196:
	BTFSC       STATUS+0, 0 
	GOTO        L_Task_BUTTON167
;main.c,153 :: 		DispMsg(--Contador,TRUE);   //Envia a Msg e Grava na EEPROM
	MOVLW       1
	SUBWF       _Contador+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _Contador+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _Contador+0 
	MOVF        R1, 0 
	MOVWF       _Contador+1 
	MOVF        _Contador+0, 0 
	MOVWF       FARG_DispMsg_Contador+0 
	MOVF        _Contador+1, 0 
	MOVWF       FARG_DispMsg_Contador+1 
	MOVLW       1
	MOVWF       FARG_DispMsg_Enable+0 
	CALL        _DispMsg+0, 0
L_Task_BUTTON167:
;main.c,156 :: 		do
L_Task_BUTTON168:
;main.c,158 :: 		OS_Cond_Wait(pin_BUTTON1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       0
	BTFSC       PORTE+0, 1 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;main.c,159 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,160 :: 		} while (!pin_BUTTON1);
	BTFSS       PORTE+0, 1 
	GOTO        L_Task_BUTTON168
;main.c,162 :: 		}
	GOTO        L_Task_BUTTON161
;main.c,163 :: 		}
L_end_Task_BUTTON1:
	RETURN      0
; end of _Task_BUTTON1

_WriteEEPROM:

;main.c,166 :: 		void WriteEEPROM(unsigned int Contador)
;main.c,173 :: 		ValWR.ValInteiro = Contador;
	MOVF        FARG_WriteEEPROM_Contador+0, 0 
	MOVWF       WriteEEPROM_ValWR_L0+0 
	MOVF        FARG_WriteEEPROM_Contador+1, 0 
	MOVWF       WriteEEPROM_ValWR_L0+1 
;main.c,174 :: 		EEPROM_Write(0x00, ValWR.ValHighLow[0]);   //Grava byte menos significativo no endereco 0x00
	CLRF        FARG_EEPROM_Write_address+0 
	MOVF        WriteEEPROM_ValWR_L0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;main.c,175 :: 		EEPROM_Write(0x01, ValWR.ValHighLow[1]);   //Grava byte mais significativo no endereco 0x01
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        WriteEEPROM_ValWR_L0+1, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;main.c,176 :: 		}
L_end_WriteEEPROM:
	RETURN      0
; end of _WriteEEPROM

_DispMsg:

;main.c,179 :: 		void DispMsg(unsigned int Contador, char Enable)
;main.c,188 :: 		OS_EnterCriticalSection();
	CALL        _OS_EnterCriticalSection+0, 0
;main.c,190 :: 		if(Enable) WriteEEPROM(Contador);
	MOVF        FARG_DispMsg_Enable+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DispMsg71
	MOVF        FARG_DispMsg_Contador+0, 0 
	MOVWF       FARG_WriteEEPROM_Contador+0 
	MOVF        FARG_DispMsg_Contador+1, 0 
	MOVWF       FARG_WriteEEPROM_Contador+1 
	CALL        _WriteEEPROM+0, 0
L_DispMsg71:
;main.c,192 :: 		VarAux = Contador;
	MOVF        FARG_DispMsg_Contador+0, 0 
	MOVWF       DispMsg_VarAux_L0+0 
	MOVF        FARG_DispMsg_Contador+1, 0 
	MOVWF       DispMsg_VarAux_L0+1 
;main.c,193 :: 		for (_i = 0; _i < 4; _i++)
	CLRF        DispMsg__i_L0+0 
L_DispMsg72:
	MOVLW       4
	SUBWF       DispMsg__i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_DispMsg73
;main.c,195 :: 		buf[_i] = Mat_Const_Disp[VarAux%10];
	MOVLW       DispMsg_buf_L0+0
	MOVWF       FLOC__DispMsg+0 
	MOVLW       hi_addr(DispMsg_buf_L0+0)
	MOVWF       FLOC__DispMsg+1 
	MOVF        DispMsg__i_L0+0, 0 
	ADDWF       FLOC__DispMsg+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__DispMsg+1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        DispMsg_VarAux_L0+0, 0 
	MOVWF       R0 
	MOVF        DispMsg_VarAux_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       DispMsg_Mat_Const_Disp_L0+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(DispMsg_Mat_Const_Disp_L0+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(DispMsg_Mat_Const_Disp_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVFF       FLOC__DispMsg+0, FSR1
	MOVFF       FLOC__DispMsg+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;main.c,196 :: 		VarAux /= 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        DispMsg_VarAux_L0+0, 0 
	MOVWF       R0 
	MOVF        DispMsg_VarAux_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       DispMsg_VarAux_L0+0 
	MOVF        R1, 0 
	MOVWF       DispMsg_VarAux_L0+1 
;main.c,193 :: 		for (_i = 0; _i < 4; _i++)
	INCF        DispMsg__i_L0+0, 1 
;main.c,197 :: 		}
	GOTO        L_DispMsg72
L_DispMsg73:
;main.c,199 :: 		OS_LeaveCriticalSection();
	CALL        _OS_LeaveCriticalSection+0, 0
;main.c,201 :: 		if (!OS_Queue_IsFull (queue)) {
	CALL        __OS_DI_INT+0, 0
	MOVF        _queue+1, 0 
	XORWF       _queue+0, 0 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       __OS_Temp+0 
	CALL        __OS_RI_INT+0, 0
	MOVF        __OS_Temp+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_DispMsg75
;main.c,202 :: 		OS_Queue_Send (queue, buf);
	CALL        __OS_DI_INT+0, 0
L_DispMsg76:
	MOVF        _queue+1, 0 
	XORWF       _queue+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_DispMsg77
	CALL        __OS_RI_INT+0, 0
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _queue+1, 0 
	XORWF       _queue+0, 0 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 1 
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
	CALL        __OS_DI_INT+0, 0
	GOTO        L_DispMsg76
L_DispMsg77:
	MOVLW       _queue+0
	MOVWF       FARG__OS_Queue_Send_pQueue+0 
	MOVLW       hi_addr(_queue+0)
	MOVWF       FARG__OS_Queue_Send_pQueue+1 
	MOVLW       DispMsg_buf_L0+0
	MOVWF       FARG__OS_Queue_Send_Msg+0 
	MOVLW       hi_addr(DispMsg_buf_L0+0)
	MOVWF       FARG__OS_Queue_Send_Msg+1 
	CALL        __OS_Queue_Send+0, 0
	CALL        __OS_RI_INT+0, 0
;main.c,203 :: 		};
L_DispMsg75:
;main.c,205 :: 		}
L_end_DispMsg:
	RETURN      0
; end of _DispMsg
