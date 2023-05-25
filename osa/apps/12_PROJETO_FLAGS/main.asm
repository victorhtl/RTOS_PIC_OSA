
_INTERRUPT_HIGH:

;main.c,18 :: 		void INTERRUPT_HIGH() iv 0x0008 ics ICS_AUTO {
;main.c,21 :: 		if (TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_INTERRUPT_HIGH0
;main.c,22 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;main.c,23 :: 		OS_Timer();
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
;main.c,24 :: 		}
L_INTERRUPT_HIGH0:
;main.c,26 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH69:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,29 :: 		void main (void)
;main.c,31 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,32 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,33 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,35 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,38 :: 		OS_Task_Create(0, Task_BUTTON0);      //Cria task BTN0 (máxima prioridade)
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
;main.c,39 :: 		OS_Task_Create(0, Task_BUTTON1);      //Cria task BTN1 (máxima prioridade)
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
;main.c,40 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade)
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
;main.c,41 :: 		OS_Task_Create(0, Task_LCD);      //Cria task LCD (máxima prioridade)
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
;main.c,43 :: 		OS_Flag_Create (flag);
	CLRF        _flag+0 
;main.c,44 :: 		OS_Flag_Init (flag, 0x0);
	CLRF        _flag+0 
;main.c,46 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main6
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main6:
;main.c,48 :: 		OS_Run();
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
	GOTO        L__main71
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main71:
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
	GOTO        L__main67
	BTFSC       __OS_State+0, 7 
	GOTO        L__main67
	GOTO        L_main19
L__main67:
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
L__main66:
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
	GOTO        L__main65
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main72
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main72:
	BTFSC       STATUS+0, 2 
	GOTO        L__main65
	GOTO        L_main11
L__main65:
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
L__main64:
	GOTO        ___main__OS_SCHED_RUN
L_main34:
L_main30:
___main_SCHED_END:
	GOTO        L_main7
;main.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_BUTTON0:

;main.c,54 :: 		void Task_BUTTON0(void)
;main.c,56 :: 		for (;;)
L_Task_BUTTON035:
;main.c,58 :: 		do //botão pressionado?
L_Task_BUTTON038:
;main.c,60 :: 		OS_Cond_Wait(!BTN0);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 0 
	GOTO        L__Task_BUTTON074
	BSF         4056, 0 
	GOTO        L__Task_BUTTON075
L__Task_BUTTON074:
	BCF         4056, 0 
L__Task_BUTTON075:
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
;main.c,61 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,62 :: 		} while (BTN0);
	BTFSC       PORTE+0, 0 
	GOTO        L_Task_BUTTON038
;main.c,65 :: 		LATD.RD7 = ~LATD.RD7;
	BTG         LATD+0, 7 
;main.c,66 :: 		if(LATD.RD7) {
	BTFSS       LATD+0, 7 
	GOTO        L_Task_BUTTON041
;main.c,67 :: 		OS_Flag_Set(flag, 0x01);   // Set bits 1
	BSF         _flag+0, 0 
;main.c,68 :: 		}else
	GOTO        L_Task_BUTTON042
L_Task_BUTTON041:
;main.c,69 :: 		OS_Flag_Clear(flag, 0x01); // Clear bits 1
	MOVLW       254
	ANDWF       _flag+0, 1 
L_Task_BUTTON042:
;main.c,72 :: 		do  //botão solto?
L_Task_BUTTON043:
;main.c,74 :: 		OS_Cond_Wait(BTN0);
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
;main.c,75 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,76 :: 		} while (!BTN0);
	BTFSS       PORTE+0, 0 
	GOTO        L_Task_BUTTON043
;main.c,78 :: 		}
	GOTO        L_Task_BUTTON035
;main.c,79 :: 		}
L_end_Task_BUTTON0:
	RETURN      0
; end of _Task_BUTTON0

_Task_BUTTON1:

;main.c,81 :: 		void Task_BUTTON1(void)
;main.c,83 :: 		for (;;)
L_Task_BUTTON146:
;main.c,85 :: 		do   //botão pressionado?
L_Task_BUTTON149:
;main.c,87 :: 		OS_Cond_Wait(!BTN1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 1 
	GOTO        L__Task_BUTTON177
	BSF         4056, 0 
	GOTO        L__Task_BUTTON178
L__Task_BUTTON177:
	BCF         4056, 0 
L__Task_BUTTON178:
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
;main.c,88 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,89 :: 		} while (BTN1);
	BTFSC       PORTE+0, 1 
	GOTO        L_Task_BUTTON149
;main.c,92 :: 		LATD.RD6 = ~LATD.RD6;
	BTG         LATD+0, 6 
;main.c,93 :: 		if(LATD.RD7){
	BTFSS       LATD+0, 7 
	GOTO        L_Task_BUTTON152
;main.c,94 :: 		OS_Flag_Set(flag, 0x02);   // Set bits 1
	BSF         _flag+0, 1 
;main.c,95 :: 		}else
	GOTO        L_Task_BUTTON153
L_Task_BUTTON152:
;main.c,96 :: 		OS_Flag_Clear(flag, 0x02); // Clear bits 1
	BCF         _flag+0, 1 
L_Task_BUTTON153:
;main.c,99 :: 		do   //Botão solto?
L_Task_BUTTON154:
;main.c,101 :: 		OS_Cond_Wait(BTN1);
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
;main.c,102 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,103 :: 		} while (!BTN1);
	BTFSS       PORTE+0, 1 
	GOTO        L_Task_BUTTON154
;main.c,105 :: 		}
	GOTO        L_Task_BUTTON146
;main.c,106 :: 		}
L_end_Task_BUTTON1:
	RETURN      0
; end of _Task_BUTTON1

_Task_LCD:

;main.c,108 :: 		void Task_LCD(void)
;main.c,113 :: 		for(;;)
L_Task_LCD57:
;main.c,116 :: 		if(OS_Flag_Check_AllOn (flag, 0x3))
	MOVLW       3
	ANDWF       _flag+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_LCD60
;main.c,119 :: 		count++;
	INFSNZ      Task_LCD_count_L0+0, 1 
	INCF        Task_LCD_count_L0+1, 1 
;main.c,120 :: 		WordToStr(count, txt);
	MOVF        Task_LCD_count_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        Task_LCD_count_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,121 :: 		Lcd_Out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,122 :: 		}
L_Task_LCD60:
;main.c,124 :: 		OS_Delay(500 ms);
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
;main.c,125 :: 		}
	GOTO        L_Task_LCD57
;main.c,126 :: 		}
L_end_Task_LCD:
	RETURN      0
; end of _Task_LCD

_Task_LED0:

;main.c,128 :: 		void Task_LED0 (void)
;main.c,130 :: 		for(;;)
L_Task_LED061:
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
	GOTO        L_Task_LED061
;main.c,135 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0
