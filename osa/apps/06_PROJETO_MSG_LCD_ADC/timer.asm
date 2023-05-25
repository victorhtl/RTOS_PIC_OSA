
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
