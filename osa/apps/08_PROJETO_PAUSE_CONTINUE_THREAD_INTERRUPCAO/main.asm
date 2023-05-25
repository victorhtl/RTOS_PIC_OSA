
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
L__INTERRUPT_HIGH88:
	RETFIE      1
; end of _INTERRUPT_HIGH

_INTERRUPT_LOW:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;main.c,18 :: 		void INTERRUPT_LOW() iv 0x0018 ics ICS_AUTO {
;main.c,23 :: 		if(INTCON.TMR0IF == 1)
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPT_LOW6
;main.c,25 :: 		INTCON.TMR0IF = 0;  //Apaga o flag do TIMER0
	BCF         INTCON+0, 2 
;main.c,26 :: 		TMR0H = 0XC2;
	MOVLW       194
	MOVWF       TMR0H+0 
;main.c,27 :: 		TMR0L = 0XF7;       //Tempo para 1 seg
	MOVLW       247
	MOVWF       TMR0L+0 
;main.c,30 :: 		if (OS_Msg_Check_I (msg_pause)) {     // If message exists
	BTFSS       _msg_pause+0, 0 
	GOTO        L_INTERRUPT_LOW7
;main.c,31 :: 		OS_Msg_Accept_I(msg_pause, msg);  // then accept it
	CLRF        _msg_pause+0 
;main.c,33 :: 		LATD.RD6 = ~LATD.RD6; //Inverte o estado do LED
	BTG         LATD+0, 6 
;main.c,34 :: 		}
L_INTERRUPT_LOW7:
;main.c,36 :: 		if(!OS_Msg_Check_I (msg_int)){
	BTFSC       _msg_int+0, 0 
	GOTO        L_INTERRUPT_LOW8
;main.c,37 :: 		OS_Msg_Send_I(msg_int, "int");
	BCF         __OS_Flags+0, 0 
	BTFSS       _msg_int+0, 0 
	GOTO        L_INTERRUPT_LOW9
	BSF         __OS_Flags+0, 0 
L_INTERRUPT_LOW9:
	MOVLW       1
	MOVWF       _msg_int+0 
	MOVLW       ?lstr1_main+0
	MOVWF       _msg_int+1 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       _msg_int+2 
;main.c,38 :: 		}
L_INTERRUPT_LOW8:
;main.c,40 :: 		}
L_INTERRUPT_LOW6:
;main.c,43 :: 		}
L_end_INTERRUPT_LOW:
L__INTERRUPT_LOW90:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _INTERRUPT_LOW

_main:

;main.c,47 :: 		void main (void)
;main.c,49 :: 		InitMCU();                         //Inicializa os periféricos do MCU
	CALL        _InitMCU+0, 0
;main.c,50 :: 		TickTimerIE();                     //Configura e habilita a Interrupção TickTimer
	CALL        _TickTimerIE+0, 0
;main.c,51 :: 		InitLCD();
	CALL        _InitLCD+0, 0
;main.c,52 :: 		InitTIMER0_IE();
	CALL        _InitTIMER0_IE+0, 0
;main.c,54 :: 		OS_Init();                         //Inicializa RTO's
	CALL        _OS_Init+0, 0
;main.c,57 :: 		OS_Task_Create(0, Task_AD0);      //Cria task AD0 (máxima prioridade)
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
;main.c,58 :: 		if (!OS_IsError()) tp1 = OS_Task_GetCreated(); // Get descriptor
	BTFSC       __OS_Flags+0, 1 
	GOTO        L_main10
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
L_main10:
;main.c,60 :: 		OS_Task_Create(1, Task_AD1);      //Cria task AD1 (máxima prioridade)
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
;main.c,61 :: 		OS_Task_Create(2, Task_AD2);      //Cria task AD2 (máxima prioridade)
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
;main.c,62 :: 		OS_Task_Create(0, Task_LED0);      //Cria task LED0 (máxima prioridade)
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
;main.c,63 :: 		OS_Task_Create(3, Task_LCD);      //Cria task LCD (máxima prioridade)
	MOVLW       3
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
;main.c,64 :: 		OS_Task_Create(4, Task_BUTTON0);      //Cria task LE2 (máxima prioridade)
	MOVLW       4
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_BUTTON0+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_BUTTON0+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;main.c,66 :: 		OS_EI();
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main11
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main11:
;main.c,68 :: 		OS_Run();
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
	GOTO        L__main92
	MOVLW       __OS_Tasks+27
	SUBWF       __OS_CurTask+0, 0 
L__main92:
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
	GOTO        L__main86
	BTFSC       __OS_State+0, 7 
	GOTO        L__main86
	GOTO        L_main24
L__main86:
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
L__main85:
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
	GOTO        L__main84
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main93
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main93:
	BTFSC       STATUS+0, 2 
	GOTO        L__main84
	GOTO        L_main16
L__main84:
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
L__main83:
	GOTO        ___main__OS_SCHED_RUN
L_main39:
L_main35:
___main_SCHED_END:
	GOTO        L_main12
;main.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Task_LCD:

;main.c,74 :: 		void Task_LCD(void)
;main.c,80 :: 		for(;;)
L_Task_LCD40:
;main.c,83 :: 		if (OS_Msg_Check (msg_ad0)) {     // If message exists
	BTFSS       _msg_ad0+0, 0 
	GOTO        L_Task_LCD43
;main.c,84 :: 		OS_Msg_Accept(msg_ad0, msg);  // then accept it
	CALL        __OS_DI_INT+0, 0
	MOVF        _msg_ad0+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_ad0+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_ad0+0 
	CALL        __OS_RI_INT+0, 0
;main.c,85 :: 		Lcd_Out(1,1,(msg));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,86 :: 		}
L_Task_LCD43:
;main.c,87 :: 		if (OS_Msg_Check (msg_ad1)) {     // If message exists
	BTFSS       _msg_ad1+0, 0 
	GOTO        L_Task_LCD44
;main.c,88 :: 		OS_Msg_Accept(msg_ad1, msg);  // then accept it
	CALL        __OS_DI_INT+0, 0
	MOVF        _msg_ad1+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_ad1+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_ad1+0 
	CALL        __OS_RI_INT+0, 0
;main.c,89 :: 		Lcd_Out(1,10,(msg));
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,90 :: 		}
L_Task_LCD44:
;main.c,91 :: 		if (OS_Msg_Check (msg_ad2)) {     // If message exists
	BTFSS       _msg_ad2+0, 0 
	GOTO        L_Task_LCD45
;main.c,92 :: 		OS_Msg_Accept(msg_ad2, msg);  // then accept it
	CALL        __OS_DI_INT+0, 0
	MOVF        _msg_ad2+1, 0 
	MOVWF       Task_LCD_msg_L0+0 
	MOVF        _msg_ad2+2, 0 
	MOVWF       Task_LCD_msg_L0+1 
	CLRF        _msg_ad2+0 
	CALL        __OS_RI_INT+0, 0
;main.c,93 :: 		Lcd_Out(2,1,(msg));
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        Task_LCD_msg_L0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        Task_LCD_msg_L0+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,94 :: 		}
L_Task_LCD45:
;main.c,102 :: 		OS_Delay(20 ms);
	MOVLW       20
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,103 :: 		}
	GOTO        L_Task_LCD40
;main.c,104 :: 		}
L_end_Task_LCD:
	RETURN      0
; end of _Task_LCD

_Task_AD0:

;main.c,106 :: 		void Task_AD0(void)
;main.c,110 :: 		OS_Msg_Create (msg_ad0);
	CALL        __OS_DI_INT+0, 0
	CLRF        _msg_ad0+0 
	MOVLW       0
	MOVWF       _msg_ad0+1 
	MOVLW       0
	MOVWF       _msg_ad0+2 
	CALL        __OS_RI_INT+0, 0
;main.c,112 :: 		for(;;)
L_Task_AD046:
;main.c,114 :: 		result = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,115 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD0_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD0_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,116 :: 		OS_Msg_Send(msg_ad0, (OST_MSG)buf);
	CALL        __OS_DI_INT+0, 0
L_Task_AD049:
	BTFSS       _msg_ad0+0, 0 
	GOTO        L_Task_AD050
	CALL        __OS_RI_INT+0, 0
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
	CALL        __OS_DI_INT+0, 0
	GOTO        L_Task_AD049
L_Task_AD050:
	MOVLW       1
	MOVWF       _msg_ad0+0 
	MOVLW       Task_AD0_buf_L0+0
	MOVWF       _msg_ad0+1 
	MOVLW       hi_addr(Task_AD0_buf_L0+0)
	MOVWF       _msg_ad0+2 
	CALL        __OS_RI_INT+0, 0
;main.c,117 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_ad0));
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
;main.c,119 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,120 :: 		}
	GOTO        L_Task_AD046
;main.c,121 :: 		}
L_end_Task_AD0:
	RETURN      0
; end of _Task_AD0

_Task_AD1:

;main.c,124 :: 		void Task_AD1(void)
;main.c,128 :: 		OS_Msg_Create (msg_ad1);
	CALL        __OS_DI_INT+0, 0
	CLRF        _msg_ad1+0 
	MOVLW       0
	MOVWF       _msg_ad1+1 
	MOVLW       0
	MOVWF       _msg_ad1+2 
	CALL        __OS_RI_INT+0, 0
;main.c,130 :: 		for(;;)
L_Task_AD151:
;main.c,132 :: 		result = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,133 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD1_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD1_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,134 :: 		OS_Msg_Send(msg_ad1, (OST_MSG)buf);
	CALL        __OS_DI_INT+0, 0
L_Task_AD154:
	BTFSS       _msg_ad1+0, 0 
	GOTO        L_Task_AD155
	CALL        __OS_RI_INT+0, 0
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
	CALL        __OS_DI_INT+0, 0
	GOTO        L_Task_AD154
L_Task_AD155:
	MOVLW       1
	MOVWF       _msg_ad1+0 
	MOVLW       Task_AD1_buf_L0+0
	MOVWF       _msg_ad1+1 
	MOVLW       hi_addr(Task_AD1_buf_L0+0)
	MOVWF       _msg_ad1+2 
	CALL        __OS_RI_INT+0, 0
;main.c,135 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_ad1));
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
;main.c,137 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,138 :: 		}
	GOTO        L_Task_AD151
;main.c,139 :: 		}
L_end_Task_AD1:
	RETURN      0
; end of _Task_AD1

_Task_AD2:

;main.c,141 :: 		void Task_AD2(void)
;main.c,145 :: 		OS_Msg_Create (msg_ad2);
	CALL        __OS_DI_INT+0, 0
	CLRF        _msg_ad2+0 
	MOVLW       0
	MOVWF       _msg_ad2+1 
	MOVLW       0
	MOVWF       _msg_ad2+2 
	CALL        __OS_RI_INT+0, 0
;main.c,147 :: 		for(;;)
L_Task_AD256:
;main.c,149 :: 		result = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,150 :: 		WordToStr(result, buf);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Task_AD2_buf_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Task_AD2_buf_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,151 :: 		OS_Msg_Send(msg_ad2, (OST_MSG)buf);
	CALL        __OS_DI_INT+0, 0
L_Task_AD259:
	BTFSS       _msg_ad2+0, 0 
	GOTO        L_Task_AD260
	CALL        __OS_RI_INT+0, 0
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
	CALL        __OS_DI_INT+0, 0
	GOTO        L_Task_AD259
L_Task_AD260:
	MOVLW       1
	MOVWF       _msg_ad2+0 
	MOVLW       Task_AD2_buf_L0+0
	MOVWF       _msg_ad2+1 
	MOVLW       hi_addr(Task_AD2_buf_L0+0)
	MOVWF       _msg_ad2+2 
	CALL        __OS_RI_INT+0, 0
;main.c,152 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_ad2));
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
;main.c,154 :: 		OS_Delay(50 ms);
	MOVLW       50
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,156 :: 		}
	GOTO        L_Task_AD256
;main.c,157 :: 		}
L_end_Task_AD2:
	RETURN      0
; end of _Task_AD2

_Task_LED0:

;main.c,159 :: 		void Task_LED0 (void)
;main.c,162 :: 		for(;;)
L_Task_LED061:
;main.c,165 :: 		if (OS_Msg_Check (msg_int)) {     // If message exists
	BTFSS       _msg_int+0, 0 
	GOTO        L_Task_LED064
;main.c,166 :: 		OS_Msg_Accept(msg_int, msg);  // then accept it
	CALL        __OS_DI_INT+0, 0
	CLRF        _msg_int+0 
	CALL        __OS_RI_INT+0, 0
;main.c,167 :: 		LATD.RD0 = ~LATD.RD0;
	BTG         LATD+0, 0 
;main.c,168 :: 		}
L_Task_LED064:
;main.c,169 :: 		OS_Yield();
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,170 :: 		}
	GOTO        L_Task_LED061
;main.c,171 :: 		}
L_end_Task_LED0:
	RETURN      0
; end of _Task_LED0

_Task_BUTTON0:

;main.c,174 :: 		void Task_BUTTON0(void)
;main.c,176 :: 		OS_Msg_Create (msg_pause);
	CALL        __OS_DI_INT+0, 0
	CLRF        _msg_pause+0 
	MOVLW       0
	MOVWF       _msg_pause+1 
	MOVLW       0
	MOVWF       _msg_pause+2 
	CALL        __OS_RI_INT+0, 0
;main.c,178 :: 		for (;;)
L_Task_BUTTON065:
;main.c,181 :: 		do
L_Task_BUTTON068:
;main.c,183 :: 		OS_Cond_Wait(!BTN0);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTE+0, 0 
	GOTO        L__Task_BUTTON0100
	BSF         4056, 0 
	GOTO        L__Task_BUTTON0101
L__Task_BUTTON0100:
	BCF         4056, 0 
L__Task_BUTTON0101:
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
;main.c,184 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,185 :: 		} while (BTN0);
	BTFSC       PORTE+0, 0 
	GOTO        L_Task_BUTTON068
;main.c,188 :: 		LATD.RD7 = ~LATD.RD7;
	BTG         LATD+0, 7 
;main.c,189 :: 		if(LATD.RD7)
	BTFSS       LATD+0, 7 
	GOTO        L_Task_BUTTON071
;main.c,191 :: 		if (!OS_Task_IsPaused (tp1)) {
	MOVFF       _tp1+0, FSR0
	MOVFF       _tp1+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 7 
	GOTO        L_Task_BUTTON072
;main.c,192 :: 		OS_Msg_Send(msg_pause, "Pause");
	CALL        __OS_DI_INT+0, 0
L_Task_BUTTON073:
	BTFSS       _msg_pause+0, 0 
	GOTO        L_Task_BUTTON074
	CALL        __OS_RI_INT+0, 0
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
	CALL        __OS_DI_INT+0, 0
	GOTO        L_Task_BUTTON073
L_Task_BUTTON074:
	MOVLW       1
	MOVWF       _msg_pause+0 
	MOVLW       ?lstr2_main+0
	MOVWF       _msg_pause+1 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       _msg_pause+2 
	CALL        __OS_RI_INT+0, 0
;main.c,193 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_pause));
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
;main.c,194 :: 		OS_Task_Pause(tp1);        // Pause external task
	MOVFF       _tp1+0, FSR1
	MOVFF       _tp1+1, FSR1H
	BSF         POSTINC1+0, 7 
	MOVF        _tp1+1, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Task_BUTTON0102
	MOVF        __OS_CurTask+0, 0 
	XORWF       _tp1+0, 0 
L__Task_BUTTON0102:
	BTFSS       STATUS+0, 2 
	GOTO        L_Task_BUTTON075
	BSF         __OS_State+0, 7 
	CALL        __OS_ReturnSave+0, 0
	NOP
L_Task_BUTTON075:
;main.c,195 :: 		}
L_Task_BUTTON072:
;main.c,197 :: 		}
	GOTO        L_Task_BUTTON076
L_Task_BUTTON071:
;main.c,200 :: 		if (OS_Task_IsPaused (tp1)) {
	MOVFF       _tp1+0, FSR0
	MOVFF       _tp1+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSS       R0, 7 
	GOTO        L_Task_BUTTON077
;main.c,201 :: 		OS_Msg_Send(msg_pause, "Cont ");
	CALL        __OS_DI_INT+0, 0
L_Task_BUTTON078:
	BTFSS       _msg_pause+0, 0 
	GOTO        L_Task_BUTTON079
	CALL        __OS_RI_INT+0, 0
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
	CALL        __OS_DI_INT+0, 0
	GOTO        L_Task_BUTTON078
L_Task_BUTTON079:
	MOVLW       1
	MOVWF       _msg_pause+0 
	MOVLW       ?lstr3_main+0
	MOVWF       _msg_pause+1 
	MOVLW       hi_addr(?lstr3_main+0)
	MOVWF       _msg_pause+2 
	CALL        __OS_RI_INT+0, 0
;main.c,202 :: 		OS_Cond_Wait(!OS_Msg_Check(msg_pause));
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
;main.c,203 :: 		OS_Task_Continue(tp1);     // Continue paused task
	MOVFF       _tp1+0, FSR1
	MOVFF       _tp1+1, FSR1H
	BCF         POSTINC1+0, 7 
;main.c,204 :: 		}
L_Task_BUTTON077:
;main.c,205 :: 		}
L_Task_BUTTON076:
;main.c,208 :: 		do
L_Task_BUTTON080:
;main.c,210 :: 		OS_Cond_Wait(BTN0);
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
;main.c,211 :: 		OS_Delay(40 ms);                // 40 ms for debounce
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;main.c,212 :: 		} while (!BTN0);
	BTFSS       PORTE+0, 0 
	GOTO        L_Task_BUTTON080
;main.c,214 :: 		}
	GOTO        L_Task_BUTTON065
;main.c,215 :: 		}
L_end_Task_BUTTON0:
	RETURN      0
; end of _Task_BUTTON0
