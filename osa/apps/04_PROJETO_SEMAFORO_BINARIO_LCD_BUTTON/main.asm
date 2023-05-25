
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
;main.c,17 :: 		}
L_end_INTERRUPT_HIGH:
L__INTERRUPT_HIGH69:
	RETFIE      1
; end of _INTERRUPT_HIGH

_main:

;main.c,20 :: 		void main (void)
;main.c,22 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,23 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,24 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,26 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,29 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LE0 (máxima prioridade)
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
;main.c,30 :: 		OS_Task_Create(0, Task_LED1);      //Cria task LE1 (máxima prioridade)
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
;main.c,31 :: 		OS_Task_Create(0, Task_LED2);      //Cria task LE2 (máxima prioridade)
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
;main.c,32 :: 		OS_Task_Create(0, Task_LCD);       //Cria a task LCD
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
;main.c,33 :: 		OS_Task_Create(0, Task_BUTTON0);       //Cria a task LCD
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
;main.c,34 :: 		OS_Task_Create(0, Task_BUTTON1);       //Cria a task LCD
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
;main.c,36 :: 		OS_Bsem_Reset(BS_LED0);    //Reset -> OCUPADO - Set -> LIVRE
	BCF         __OS_Bsems+0, 0 
;main.c,37 :: 		OS_Bsem_Reset(BS_LED1);
	BCF         __OS_Bsems+0, 1 
;main.c,38 :: 		OS_Bsem_Reset(BS_LED2);
	BCF         __OS_Bsems+0, 2 
;main.c,40 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main6
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main6:
;main.c,42 :: 		OS_Run();
L_main7:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main10:
	MOVLW       hi_addr(__OS_Tasks+27)
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main71
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main71:
	BTFSS       STATUS+0, 0 
	GOTO        L_main13
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main14
L_main13:
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
L_main14:
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
L_main15:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
	BTFSS       __OS_State+0, 6 
	GOTO        L__main67
	BTFSC       __OS_State+0, 7 
	GOTO        L__main67
	GOTO        L_main18
L__main67:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main18:
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_Best_Priority+0, 0 
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main19
	GOTO        ___main__OS_SCHED_CONTINUE
L_main19:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main20
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
	GOTO        L_main21
	GOTO        ___main_SCHED_END
L_main21:
L_main20:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main24
	BTFSC       __OS_State+0, 5 
	GOTO        L_main24
L__main66:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main24:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main25
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
	GOTO        L_main26
	GOTO        L_main11
L_main26:
L_main25:
___main__OS_SCHED_CONTINUE:
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main72
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main72:
	BTFSC       STATUS+0, 2 
	GOTO        L__main65
	GOTO        L_main10
L__main65:
L_main11:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main29
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
L_main30:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
	BTFSS       __OS_State+0, 6 
	GOTO        L_main33
	BTFSC       __OS_State+0, 7 
	GOTO        L_main33
L__main64:
	GOTO        ___main__OS_SCHED_RUN
L_main33:
L_main29:
___main_SCHED_END:
	GOTO        L_main7
;main.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_LCD:

;main.c,47 :: 		void Task_LCD(void)
;main.c,52 :: 		for(;;)
L_Task_LCD34:
;main.c,54 :: 		count++;
	INFSNZ      Task_LCD_count_L0+0, 1 
	INCF        Task_LCD_count_L0+1, 1 
;main.c,55 :: 		WordToStr(count, txt);
	MOVF        Task_LCD_count_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        Task_LCD_count_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,56 :: 		Lcd_Out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Task_LCD_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Task_LCD_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,57 :: 		OS_Delay(500);
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
;main.c,58 :: 		}
	GOTO        L_Task_LCD34
;main.c,59 :: 		}
L_end_Task_LCD:
	RETURN      0
; end of _Task_LCD

_Task_BUTTON0:

;main.c,61 :: 		void Task_BUTTON0(void)
;main.c,63 :: 		for (;;)
L_Task_BUTTON037:
;main.c,65 :: 		do
L_Task_BUTTON040:
;main.c,67 :: 		OS_Cond_Wait(!BTN0);            //pino RB0 for aterrado
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 0 
	GOTO        L__Task_BUTTON075
	BSF         4056, 0 
	GOTO        L__Task_BUTTON076
L__Task_BUTTON075:
	BCF         4056, 0 
L__Task_BUTTON076:
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
;main.c,68 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,69 :: 		} while (BTN0);
	BTFSC       PORTE+0, 0 
	GOTO        L_Task_BUTTON040
;main.c,71 :: 		LATD.RD7 = ~LATD.RD7;             //Inverte o estado lógico do LED RD7
	BTG         LATD+0, 7 
;main.c,73 :: 		do
L_Task_BUTTON043:
;main.c,75 :: 		OS_Cond_Wait(BTN0);
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
;main.c,76 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,77 :: 		} while (!BTN0);
	BTFSS       PORTE+0, 0 
	GOTO        L_Task_BUTTON043
;main.c,79 :: 		}
	GOTO        L_Task_BUTTON037
;main.c,80 :: 		}
L_end_Task_BUTTON0:
	RETURN      0
; end of _Task_BUTTON0

_Task_BUTTON1:

;main.c,82 :: 		void Task_BUTTON1(void)
;main.c,84 :: 		for (;;)
L_Task_BUTTON146:
;main.c,86 :: 		do
L_Task_BUTTON149:
;main.c,88 :: 		OS_Cond_Wait(!BTN1);            //pino RB0 for aterrado
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 1 
	GOTO        L__Task_BUTTON178
	BSF         4056, 0 
	GOTO        L__Task_BUTTON179
L__Task_BUTTON178:
	BCF         4056, 0 
L__Task_BUTTON179:
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
;main.c,89 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,90 :: 		} while (BTN1);
	BTFSC       PORTE+0, 1 
	GOTO        L_Task_BUTTON149
;main.c,92 :: 		LATD.RD6 = ~LATD.RD6;             //Inverte o estado lógico do LED RD7
	BTG         LATD+0, 6 
;main.c,94 :: 		do
L_Task_BUTTON152:
;main.c,96 :: 		OS_Cond_Wait(BTN1);
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
;main.c,97 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,98 :: 		} while (!BTN1);
	BTFSS       PORTE+0, 1 
	GOTO        L_Task_BUTTON152
;main.c,100 :: 		}
	GOTO        L_Task_BUTTON146
;main.c,101 :: 		}
L_end_Task_BUTTON1:
	RETURN      0
; end of _Task_BUTTON1

_Task_LED0:

;main.c,104 :: 		void Task_LED0(void)
;main.c,106 :: 		OS_Bsem_Set(BS_LED0);
	BSF         __OS_Bsems+0, 0 
;main.c,108 :: 		for(;;)
L_Task_LED055:
;main.c,110 :: 		OS_Bsem_Wait(BS_LED0); //BS_LED0 == 1?? SIM, DESCE, CASO CONTRÁRIO, DEVOLVE O CONTROLE PARA O RTOS
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       __OS_Bsems+0, 0 
	MOVWF       R0 
	MOVLW       0
	ANDLW       0
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_LED081
	MOVLW       0
	XORWF       R0, 0 
L__Task_LED081:
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	MOVLW       254
	ANDWF       __OS_Bsems+0, 1 
;main.c,112 :: 		LATD.RD0 = ~LATD.RD0;  //LED
	BTG         LATD+0, 0 
;main.c,113 :: 		OS_Delay(300 ms);      //Aguarda 300ms
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
;main.c,115 :: 		OS_Bsem_Reset(BS_LED0);
	MOVLW       254
	ANDWF       __OS_Bsems+0, 1 
;main.c,116 :: 		OS_Bsem_Set(BS_LED1);
	BSF         __OS_Bsems+0, 1 
;main.c,118 :: 		}
	GOTO        L_Task_LED055
;main.c,119 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_LED1:

;main.c,121 :: 		void Task_LED1(void)
;main.c,123 :: 		for(;;)
L_Task_LED158:
;main.c,125 :: 		OS_Bsem_Wait(BS_LED1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       2
	ANDWF       __OS_Bsems+0, 0 
	MOVWF       R0 
	MOVLW       0
	ANDLW       0
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_LED183
	MOVLW       0
	XORWF       R0, 0 
L__Task_LED183:
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	MOVLW       253
	ANDWF       __OS_Bsems+0, 1 
;main.c,127 :: 		LATD.RD1 = ~LATD.RD1;
	BTG         LATD+0, 1 
;main.c,128 :: 		OS_Delay(300 ms);
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
;main.c,130 :: 		OS_Bsem_Reset(BS_LED1);
	MOVLW       253
	ANDWF       __OS_Bsems+0, 1 
;main.c,131 :: 		OS_Bsem_Set(BS_LED2);
	BSF         __OS_Bsems+0, 2 
;main.c,132 :: 		}
	GOTO        L_Task_LED158
;main.c,133 :: 		}
L_end_Task_LED1:
	RETURN      0
; end of _Task_LED1

_Task_LED2:

;main.c,135 :: 		void Task_LED2(void)
;main.c,137 :: 		for(;;)
L_Task_LED261:
;main.c,139 :: 		OS_Bsem_Wait(BS_LED2);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       4
	ANDWF       __OS_Bsems+0, 0 
	MOVWF       R0 
	MOVLW       0
	ANDLW       0
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_LED285
	MOVLW       0
	XORWF       R0, 0 
L__Task_LED285:
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	MOVLW       251
	ANDWF       __OS_Bsems+0, 1 
;main.c,141 :: 		LATD.RD2 = ~LATD.RD2;
	BTG         LATD+0, 2 
;main.c,142 :: 		OS_Delay(300 ms);
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
;main.c,144 :: 		OS_Bsem_Reset(BS_LED2);
	MOVLW       251
	ANDWF       __OS_Bsems+0, 1 
;main.c,145 :: 		OS_Bsem_Set(BS_LED0);
	BSF         __OS_Bsems+0, 0 
;main.c,146 :: 		}
	GOTO        L_Task_LED261
;main.c,147 :: 		}
L_end_Task_LED2:
	RETURN      0
; end of _Task_LED2
