
_INTERRUPT_HIGH:

;main.c,8 :: 		void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
;main.c,11 :: 		if (TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_INTERRUPT_HIGH0
;main.c,12 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;main.c,13 :: 		OS_Timer();
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
;main.c,14 :: 		}
L_INTERRUPT_HIGH0:
;main.c,16 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH78:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,19 :: 		void main (void)
;main.c,21 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,22 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,23 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,25 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,28 :: 		OS_Task_Create(0, Task_AD0);      //Cria task AD0 (máxima prioridade)
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_AD0+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_AD0+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,29 :: 		if (!OS_IsError()) tp1 = OS_Task_GetCreated(); // Get descriptor
	BTFSC       __OS_Flags+0, 1 
	GOTO        L_main6
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        __OS_Temp+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       _tp1+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       _tp1+1 
L_main6:
;main.c,31 :: 		OS_Task_Create(0, Task_AD1);      //Cria task AD1 (máxima prioridade)
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_AD1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_AD1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,32 :: 		OS_Task_Create(0, Task_AD2);      //Cria task AD2 (máxima prioridade)
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_AD2+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_AD2+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,33 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade)
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
;main.c,34 :: 		OS_Task_Create(0, Task_LCD);      //Cria task LCD (máxima prioridade)
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LCD+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LCD+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,35 :: 		OS_Task_Create(0, Task_BUTTON0);      //Cria task LE2 (máxima prioridade)
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
;main.c,37 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main7
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main7:
;main.c,39 :: 		OS_Run();
L_main8:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main11:
	MOVLW       hi_addr(__OS_Tasks+27)
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main80
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main80:
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
	GOTO        L__main76
	BTFSC       __OS_State+0, 7 
	GOTO        L__main76
	GOTO        L_main19
L__main76:
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
L__main75:
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
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main81
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main81:
	BTFSC       STATUS+0, 2 
	GOTO        L__main74
	GOTO        L_main11
L__main74:
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
L__main73:
	GOTO        ___main__OS_SCHED_RUN
L_main34:
L_main30:
___main_SCHED_END:
	GOTO        L_main8
;main.c,41 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_LCD:

;main.c,44 :: 		void Task_LCD(void)
;main.c,50 :: 		for(;;)
L_Task_LCD35:
;main.c,53 :: 		if (OS_Msg_Check (msg_ad0)) {     // If message exists
	BTFSS       _msg_ad0+0, 0 
	GOTO        L_Task_LCD38
;main.c,54 :: 		OS_Msg_Accept(msg_ad0, msg);  // then accept it
	MOVF        _msg_ad0+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_ad0+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_ad0+0 
;main.c,55 :: 		Lcd_Out(1,1,(msg));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,56 :: 		}
L_Task_LCD38:
;main.c,57 :: 		if (OS_Msg_Check (msg_ad1)) {     // If message exists
	BTFSS       _msg_ad1+0, 0 
	GOTO        L_Task_LCD39
;main.c,58 :: 		OS_Msg_Accept(msg_ad1, msg);  // then accept it
	MOVF        _msg_ad1+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_ad1+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_ad1+0 
;main.c,59 :: 		Lcd_Out(1,10,(msg));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,60 :: 		}
L_Task_LCD39:
;main.c,61 :: 		if (OS_Msg_Check (msg_ad2)) {     // If message exists
	BTFSS       _msg_ad2+0, 0 
	GOTO        L_Task_LCD40
;main.c,62 :: 		OS_Msg_Accept(msg_ad2, msg);  // then accept it
	MOVF        _msg_ad2+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_ad2+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_ad2+0 
;main.c,63 :: 		Lcd_Out(2,1,(msg));
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,64 :: 		}
L_Task_LCD40:
;main.c,66 :: 		if (OS_Msg_Check (msg_pause)) {     // If message exists
	BTFSS       _msg_pause+0, 0 
	GOTO        L_Task_LCD41
;main.c,67 :: 		OS_Msg_Accept(msg_pause, msg);  // then accept it
	MOVF        _msg_pause+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_pause+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_pause+0 
;main.c,68 :: 		Lcd_Out(2,9,(msg));
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,69 :: 		}
L_Task_LCD41:
;main.c,71 :: 		OS_Delay(20 ms);
	MOVLW       20
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,72 :: 		}
	GOTO        L_Task_LCD35
;main.c,73 :: 		}
L_end_Task_LCD:
	RETURN      0
; end of _Task_LCD

_Task_AD0:

;main.c,75 :: 		void Task_AD0(void)
;main.c,79 :: 		OS_Msg_Create (msg_ad0);
	CLRF        _msg_ad0+0 
	MOVLW       0
	MOVWF       _msg_ad0+1 
	MOVLW       0
	MOVWF       _msg_ad0+2 
;main.c,81 :: 		for(;;)
L_Task_AD042:
;main.c,83 :: 		result = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,84 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD0_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD0_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,85 :: 		OS_Msg_Send(msg_ad0, (OST_MSG)buf);
	BTFSS       _msg_ad0+0, 0 
	GOTO        L_Task_AD045
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_ad0+0, 0 
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
L_Task_AD045:
	MOVLW       1
	MOVWF       _msg_ad0+0 
	MOVLW       Task_AD0_buf_L0+0
	MOVWF       _msg_ad0+1 
	MOVLW       hi_addr(Task_AD0_buf_L0+0)
	MOVWF       _msg_ad0+2 
;main.c,86 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_ad0));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_ad0+0, 0 
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
;main.c,88 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,89 :: 		}
	GOTO        L_Task_AD042
;main.c,90 :: 		}
L_end_Task_AD0:
	RETURN      0
; end of _Task_AD0

_Task_AD1:

;main.c,93 :: 		void Task_AD1(void)
;main.c,97 :: 		OS_Msg_Create (msg_ad1);
	CLRF        _msg_ad1+0 
	MOVLW       0
	MOVWF       _msg_ad1+1 
	MOVLW       0
	MOVWF       _msg_ad1+2 
;main.c,99 :: 		for(;;)
L_Task_AD146:
;main.c,101 :: 		result = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,102 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD1_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD1_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,103 :: 		OS_Msg_Send(msg_ad1, (OST_MSG)buf);
	BTFSS       _msg_ad1+0, 0 
	GOTO        L_Task_AD149
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_ad1+0, 0 
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
L_Task_AD149:
	MOVLW       1
	MOVWF       _msg_ad1+0 
	MOVLW       Task_AD1_buf_L0+0
	MOVWF       _msg_ad1+1 
	MOVLW       hi_addr(Task_AD1_buf_L0+0)
	MOVWF       _msg_ad1+2 
;main.c,104 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_ad1));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_ad1+0, 0 
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
;main.c,106 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,107 :: 		}
	GOTO        L_Task_AD146
;main.c,108 :: 		}
L_end_Task_AD1:
	RETURN      0
; end of _Task_AD1

_Task_AD2:

;main.c,110 :: 		void Task_AD2(void)
;main.c,114 :: 		OS_Msg_Create (msg_ad2);
	CLRF        _msg_ad2+0 
	MOVLW       0
	MOVWF       _msg_ad2+1 
	MOVLW       0
	MOVWF       _msg_ad2+2 
;main.c,116 :: 		for(;;)
L_Task_AD250:
;main.c,118 :: 		result = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,119 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD2_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD2_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,120 :: 		OS_Msg_Send(msg_ad2, (OST_MSG)buf);
	BTFSS       _msg_ad2+0, 0 
	GOTO        L_Task_AD253
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_ad2+0, 0 
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
L_Task_AD253:
	MOVLW       1
	MOVWF       _msg_ad2+0 
	MOVLW       Task_AD2_buf_L0+0
	MOVWF       _msg_ad2+1 
	MOVLW       hi_addr(Task_AD2_buf_L0+0)
	MOVWF       _msg_ad2+2 
;main.c,121 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_ad2));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_ad2+0, 0 
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
;main.c,123 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,125 :: 		}
	GOTO        L_Task_AD250
;main.c,126 :: 		}
L_end_Task_AD2:
	RETURN      0
; end of _Task_AD2

_Task_LED0:

;main.c,128 :: 		void Task_LED0 (void)
;main.c,130 :: 		for(;;)
L_Task_LED054:
;main.c,132 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,133 :: 		OS_Delay(1000 ms);
	MOVLW       232
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       3
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,134 :: 		}
	GOTO        L_Task_LED054
;main.c,135 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_BUTTON0:

;main.c,138 :: 		void Task_BUTTON0(void)
;main.c,140 :: 		OS_Msg_Create (msg_pause);
	CLRF        _msg_pause+0 
	MOVLW       0
	MOVWF       _msg_pause+1 
	MOVLW       0
	MOVWF       _msg_pause+2 
;main.c,142 :: 		for (;;)
L_Task_BUTTON057:
;main.c,145 :: 		do
L_Task_BUTTON060:
;main.c,147 :: 		OS_Cond_Wait(!BTN0);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 0 
	GOTO        L__Task_BUTTON088
	BSF         4056, 0 
	GOTO        L__Task_BUTTON089
L__Task_BUTTON088:
	BCF         4056, 0 
L__Task_BUTTON089:
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
;main.c,149 :: 		} while (BTN0);
	BTFSC       PORTE+0, 0 
	GOTO        L_Task_BUTTON060
;main.c,152 :: 		LATD.RD7 = ~LATD.RD7;
	BTG         LATD+0, 7 
;main.c,153 :: 		if(LATD.RD7)
	BTFSS       LATD+0, 7 
	GOTO        L_Task_BUTTON063
;main.c,155 :: 		if (!OS_Task_IsPaused (tp1)) {
	MOVFF       _tp1+0, FSR0
	MOVFF       _tp1+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 7 
	GOTO        L_Task_BUTTON064
;main.c,156 :: 		OS_Msg_Send(msg_pause, "Pause");
	BTFSS       _msg_pause+0, 0 
	GOTO        L_Task_BUTTON065
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_pause+0, 0 
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
L_Task_BUTTON065:
	MOVLW       1
	MOVWF       _msg_pause+0 
	MOVLW       ?lstr1_main+0
	MOVWF       _msg_pause+1 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       _msg_pause+2 
;main.c,157 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_pause));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_pause+0, 0 
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
;main.c,158 :: 		OS_Task_Pause(tp1);        // Pause external task
	MOVFF       _tp1+0, FSR1
	MOVFF       _tp1+1, FSR1H
	BSF         POSTINC1+0, 7 
	MOVF        _tp1+1, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_BUTTON090
	MOVF        __OS_CurTask+0, 0 
	XORWF       _tp1+0, 0 
L__Task_BUTTON090:
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_BUTTON066
	BSF         __OS_State+0, 7 
	CALL        __OS_ReturnSave+0, 0
	NOP
L_Task_BUTTON066:
;main.c,159 :: 		}
L_Task_BUTTON064:
;main.c,161 :: 		}
	GOTO        L_Task_BUTTON067
L_Task_BUTTON063:
;main.c,164 :: 		if (OS_Task_IsPaused (tp1)) {
	MOVFF       _tp1+0, FSR0
	MOVFF       _tp1+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSS       R0, 7 
	GOTO        L_Task_BUTTON068
;main.c,165 :: 		OS_Msg_Send(msg_pause, "Cont ");
	BTFSS       _msg_pause+0, 0 
	GOTO        L_Task_BUTTON069
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_pause+0, 0 
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
L_Task_BUTTON069:
	MOVLW       1
	MOVWF       _msg_pause+0 
	MOVLW       ?lstr2_main+0
	MOVWF       _msg_pause+1 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       _msg_pause+2 
;main.c,166 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_pause));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       _msg_pause+0, 0 
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
;main.c,167 :: 		OS_Task_Continue(tp1);     // Continue paused task
	MOVFF       _tp1+0, FSR1
	MOVFF       _tp1+1, FSR1H
	BCF         POSTINC1+0, 7 
;main.c,168 :: 		}
L_Task_BUTTON068:
;main.c,169 :: 		}
L_Task_BUTTON067:
;main.c,172 :: 		do
L_Task_BUTTON070:
;main.c,174 :: 		OS_Cond_Wait(BTN0);
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
;main.c,175 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,176 :: 		} while (!BTN0);
	BTFSS       PORTE+0, 0 
	GOTO        L_Task_BUTTON070
;main.c,178 :: 		}
	GOTO        L_Task_BUTTON057
;main.c,179 :: 		}
L_end_Task_BUTTON0:
	RETURN      0
; end of _Task_BUTTON0
