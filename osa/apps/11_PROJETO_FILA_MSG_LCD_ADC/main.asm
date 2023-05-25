
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
L__INTERRUPT_HIGH52:
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
;main.c,28 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade)
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
;main.c,29 :: 		OS_Task_Create(0, Task_LCD);      //Cria task LCD (máxima prioridade)
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
;main.c,31 :: 		OS_Queue_Create(queue, buffer, 10);
	MOVLW       10
	MOVWF       _queue+0 
	CLRF        _queue+2 
	CLRF        _queue+1 
	MOVLW       _buffer+0
	MOVWF       _queue+3 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       _queue+4 
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
	GOTO        L__main54
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main54:
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
	GOTO        L__main50
	BTFSC       __OS_State+0, 7 
	GOTO        L__main50
	GOTO        L_main19
L__main50:
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
L__main49:
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
	GOTO        L__main48
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main55
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main55:
	BTFSC       STATUS+0, 2 
	GOTO        L__main48
	GOTO        L_main11
L__main48:
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
L__main47:
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
;main.c,48 :: 		if (OS_Queue_Check(queue)) {
	MOVF        _queue+1, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_LCD38
;main.c,49 :: 		OS_Queue_Accept(queue, msg);
	MOVLW       _queue+0
	MOVWF       FARG__OS_Queue_Get_pQueue+0 
	MOVLW       hi_addr(_queue+0)
	MOVWF       FARG__OS_Queue_Get_pQueue+1 
	CALL        __OS_Queue_Get+0, 0
;main.c,50 :: 		Lcd_Out(1,1,(msg));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,52 :: 		WordToStr(count++, txt);
	MOVF        Task_LCD_count_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        Task_LCD_count_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
	INFSNZ      Task_LCD_count_L0+0, 1 
	INCF        Task_LCD_count_L0+1, 1 
;main.c,53 :: 		Lcd_Out(2,1,(txt));
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,54 :: 		}
L_Task_LCD38:
;main.c,56 :: 		OS_Delay(20 ms);
	MOVLW       20
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,57 :: 		}
	GOTO        L_Task_LCD35
;main.c,58 :: 		}
L_end_Task_LCD:
	RETURN      0
; end of _Task_LCD

_Task_AD0:

;main.c,60 :: 		void Task_AD0(void)
;main.c,64 :: 		for(;;)
L_Task_AD039:
;main.c,66 :: 		result = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,67 :: 		result = result * (255/1023.); //converte de 0 a 255
	CALL        _int2double+0, 0
	MOVLW       208
	MOVWF       R4 
	MOVLW       63
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
;main.c,68 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD0_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD0_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,70 :: 		if (!OS_Queue_IsFull (queue)) {
	MOVF        _queue+1, 0 
	XORWF       _queue+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Task_AD042
;main.c,71 :: 		OS_Queue_Send(queue, buf);
	MOVF        _queue+1, 0 
	XORWF       _queue+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_AD043
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
L_Task_AD043:
	MOVLW       _queue+0
	MOVWF       FARG__OS_Queue_Send_pQueue+0 
	MOVLW       hi_addr(_queue+0)
	MOVWF       FARG__OS_Queue_Send_pQueue+1 
	MOVLW       Task_AD0_buf_L0+0
	MOVWF       FARG__OS_Queue_Send_Msg+0 
	MOVLW       hi_addr(Task_AD0_buf_L0+0)
	MOVWF       FARG__OS_Queue_Send_Msg+1 
	CALL        __OS_Queue_Send+0, 0
;main.c,73 :: 		};
L_Task_AD042:
;main.c,76 :: 		OS_Delay(200 ms);
	MOVLW       200
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,77 :: 		}
	GOTO        L_Task_AD039
;main.c,78 :: 		}
L_end_Task_AD0:
	RETURN      0
; end of _Task_AD0

_Task_LED0:

;main.c,81 :: 		void Task_LED0 (void)
;main.c,83 :: 		for(;;)
L_Task_LED044:
;main.c,85 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,86 :: 		OS_Delay(1000 ms);
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
;main.c,87 :: 		}
	GOTO        L_Task_LED044
;main.c,88 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0
