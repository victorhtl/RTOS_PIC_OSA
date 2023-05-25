
_InitMCU:

;bsp.c,3 :: 		void InitMCU(void)
;bsp.c,6 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;bsp.c,7 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;bsp.c,8 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;bsp.c,9 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;bsp.c,10 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;bsp.c,15 :: 		TRISD = 0;        //PORTD configurado como Saída
	CLRF        TRISD+0 
;bsp.c,16 :: 		PORTD = 0;        //LEDs OFF
	CLRF        PORTD+0 
;bsp.c,18 :: 		TRISE.RE0 = 1;    //pinos dos BTN como entrada
	BSF         TRISE+0, 0 
;bsp.c,19 :: 		TRISE.RE1 = 1;
	BSF         TRISE+0, 1 
;bsp.c,20 :: 		}
L_end_InitMCU:
	RETURN      0
; end of _InitMCU
