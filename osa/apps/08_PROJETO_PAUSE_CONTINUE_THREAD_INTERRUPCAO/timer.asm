
_TickTimerIE:

;timer.c,3 :: 		void TickTimerIE(void)
;timer.c,6 :: 		T2CON = T2CON_CONST;
	MOVLW       77
	MOVWF       T2CON+0 
;timer.c,7 :: 		PR2 = PR2_CONST;
	MOVLW       49
	MOVWF       PR2+0 
;timer.c,9 :: 		INTCON.GIEH = 1;
	BSF         INTCON+0, 7 
;timer.c,10 :: 		INTCON.GIEL = 1;
	BSF         INTCON+0, 6 
;timer.c,11 :: 		RCON.IPEN = 1;
	BSF         RCON+0, 7 
;timer.c,13 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;timer.c,14 :: 		TMR2IP_bit = 1;
	BSF         TMR2IP_bit+0, BitPos(TMR2IP_bit+0) 
;timer.c,15 :: 		T2CON.TMR2ON = 1;
	BSF         T2CON+0, 2 
;timer.c,16 :: 		}
L_end_TickTimerIE:
	RETURN      0
; end of _TickTimerIE

_InitTIMER0_IE:

;timer.c,18 :: 		void InitTIMER0_IE(void)
;timer.c,20 :: 		T0CON = 0B00000110; //Modo Temporizador, pres: 128
	MOVLW       6
	MOVWF       T0CON+0 
;timer.c,21 :: 		TMR0H = 0XC2;
	MOVLW       194
	MOVWF       TMR0H+0 
;timer.c,22 :: 		TMR0L = 0XF7;       //Tempo para 1 seg
	MOVLW       247
	MOVWF       TMR0L+0 
;timer.c,24 :: 		INTCON.TMR0IF = 0;  //Apaga o flag do TIMER0
	BCF         INTCON+0, 2 
;timer.c,25 :: 		T0CON.TMR0ON = 1;   //Liga o TIMER0
	BSF         T0CON+0, 7 
;timer.c,29 :: 		INTCON.TMR0IF  = 0;  //flag que provoca a interrupção da CPU
	BCF         INTCON+0, 2 
;timer.c,30 :: 		INTCON2.TMR0IP  = 0;  //Alta prioridade de interrupção
	BCF         INTCON2+0, 2 
;timer.c,31 :: 		INTCON.TMR0IE  = 1;  //chave que habilita a interrupção do periférico
	BSF         INTCON+0, 5 
;timer.c,32 :: 		}
L_end_InitTIMER0_IE:
	RETURN      0
; end of _InitTIMER0_IE
