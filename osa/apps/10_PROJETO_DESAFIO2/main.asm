
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
L__INTERRUPT_HIGH61:
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
;main.c,27 :: 		OS_Task_Create(0, Task_AD0);      //Cria task AD0 (máxima prioridade)
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
;main.c,28 :: 		OS_Task_Create(1, Task_AD1);      //Cria task AD1 (máxima prioridade)
	MOVLW       1
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_AD1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_AD1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,29 :: 		OS_Task_Create(2, Task_AD2);      //Cria task AD2 (máxima prioridade)
	MOVLW       2
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_AD2+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_AD2+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,30 :: 		OS_Task_Create(3, Task_LED0);      //Cria task LED0 (máxima prioridade)
	MOVLW       3
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
;main.c,31 :: 		OS_Task_Create(4, Task_LCD);      //Cria task LCD (máxima prioridade)
	MOVLW       4
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_LCD+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_LCD+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,33 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main6
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main6:
;main.c,35 :: 		OS_Run();
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
	GOTO        L__main63
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main63:
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
	GOTO        L__main59
	BTFSC       __OS_State+0, 7 
	GOTO        L__main59
	GOTO        L_main19
L__main59:
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
L__main58:
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
	GOTO        L__main57
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main64
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main64:
	BTFSC       STATUS+0, 2 
	GOTO        L__main57
	GOTO        L_main11
L__main57:
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
L__main56:
	GOTO        ___main__OS_SCHED_RUN
L_main34:
L_main30:
___main_SCHED_END:
	GOTO        L_main7
;main.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_LCD:

;main.c,40 :: 		void Task_LCD(void)
;main.c,46 :: 		for(;;)
L_Task_LCD35:
;main.c,49 :: 		if (OS_Smsg_Check (msg_ad0)) {     // If message exists
	MOVF        _msg_ad0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_LCD38
;main.c,50 :: 		OS_Smsg_Accept(msg_ad0, msg);  // then accept it
	MOVF        _msg_ad0+0, 0 
	MOVWF       Task_LCD_msg_L0+0 
	CLRF        _msg_ad0+0 
;main.c,51 :: 		WordToStr(msg, txt);
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,52 :: 		Lcd_Out(1,1,(txt));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,53 :: 		}
L_Task_LCD38:
;main.c,54 :: 		if (OS_Smsg_Check (msg_ad1)) {     // If message exists
	MOVF        _msg_ad1+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_LCD39
;main.c,55 :: 		OS_Smsg_Accept(msg_ad1, msg);  // then accept it
	MOVF        _msg_ad1+0, 0 
	MOVWF       Task_LCD_msg_L0+0 
	CLRF        _msg_ad1+0 
;main.c,56 :: 		WordToStr(msg, txt);
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,57 :: 		Lcd_Out(1,10,(txt));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,58 :: 		}
L_Task_LCD39:
;main.c,59 :: 		if (OS_Smsg_Check (msg_ad2)) {     // If message exists
	MOVF        _msg_ad2+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_LCD40
;main.c,60 :: 		OS_Smsg_Accept(msg_ad2, msg);  // then accept it
	MOVF        _msg_ad2+0, 0 
	MOVWF       Task_LCD_msg_L0+0 
	CLRF        _msg_ad2+0 
;main.c,61 :: 		WordToStr(msg, txt);
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,62 :: 		Lcd_Out(2,1,(txt));
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,63 :: 		}
L_Task_LCD40:
;main.c,66 :: 		OS_Delay(20 ms);
	MOVLW       20
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,67 :: 		}
	GOTO        L_Task_LCD35
;main.c,68 :: 		}
L_end_Task_LCD:
	RETURN      0
; end of _Task_LCD

_Task_AD0:

;main.c,71 :: 		void Task_AD0(void)
;main.c,75 :: 		OS_Smsg_Create (msg_ad0);
	CLRF        _msg_ad0+0 
;main.c,77 :: 		for(;;)
L_Task_AD041:
;main.c,79 :: 		result = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Task_AD0_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Task_AD0_result_L0+1 
;main.c,80 :: 		OS_Smsg_Send(msg_ad0, result);
	MOVF        _msg_ad0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_AD044
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _msg_ad0+0, 0 
	XORLW       0
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
L_Task_AD044:
	MOVF        Task_AD0_result_L0+0, 0 
	MOVWF       _msg_ad0+0 
;main.c,81 :: 		OS_Cond_Wait(!OS_Smsg_Check(msg_ad0));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _msg_ad0+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
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
;main.c,83 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,84 :: 		}
	GOTO        L_Task_AD041
;main.c,85 :: 		}
L_end_Task_AD0:
	RETURN      0
; end of _Task_AD0

_Task_AD1:

;main.c,87 :: 		void Task_AD1(void)
;main.c,91 :: 		OS_Smsg_Create (msg_ad1);
	CLRF        _msg_ad1+0 
;main.c,93 :: 		for(;;)
L_Task_AD145:
;main.c,95 :: 		result = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Task_AD1_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Task_AD1_result_L0+1 
;main.c,96 :: 		OS_Smsg_Send(msg_ad1, result);
	MOVF        _msg_ad1+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_AD148
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _msg_ad1+0, 0 
	XORLW       0
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
L_Task_AD148:
	MOVF        Task_AD1_result_L0+0, 0 
	MOVWF       _msg_ad1+0 
;main.c,97 :: 		OS_Cond_Wait(!OS_Smsg_Check(msg_ad1));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _msg_ad1+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
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
;main.c,99 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,100 :: 		}
	GOTO        L_Task_AD145
;main.c,101 :: 		}
L_end_Task_AD1:
	RETURN      0
; end of _Task_AD1

_Task_AD2:

;main.c,103 :: 		void Task_AD2(void)
;main.c,107 :: 		OS_Smsg_Create (msg_ad2);
	CLRF        _msg_ad2+0 
;main.c,109 :: 		for(;;)
L_Task_AD249:
;main.c,111 :: 		result = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Task_AD2_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Task_AD2_result_L0+1 
;main.c,112 :: 		OS_Smsg_Send(msg_ad2, result);
	MOVF        _msg_ad2+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_AD252
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _msg_ad2+0, 0 
	XORLW       0
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
L_Task_AD252:
	MOVF        Task_AD2_result_L0+0, 0 
	MOVWF       _msg_ad2+0 
;main.c,113 :: 		OS_Cond_Wait(!OS_Smsg_Check(msg_ad2));
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVF        _msg_ad2+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
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
;main.c,115 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,117 :: 		}
	GOTO        L_Task_AD249
;main.c,118 :: 		}
L_end_Task_AD2:
	RETURN      0
; end of _Task_AD2

_Task_LED0:

;main.c,120 :: 		void Task_LED0 (void)
;main.c,122 :: 		for(;;)
L_Task_LED053:
;main.c,124 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,125 :: 		OS_Delay(1000 ms);
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
;main.c,126 :: 		}
	GOTO        L_Task_LED053
;main.c,127 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0
