
_ADCRead:

;adc.c,5 :: 		unsigned int ADCRead(unsigned char Canal)
;adc.c,7 :: 		switch(Canal)
	GOTO        L_ADCRead0
;adc.c,9 :: 		case 0: {
L_ADCRead2:
;adc.c,10 :: 		ANSELA.RA0 = 1;        //Somente RA0/AN0 como ADC  - valido somente para o PIC18F45K22
	BSF         ANSELA+0, 0 
;adc.c,11 :: 		TRISA.RA0 = 1;        //Entrada pois estamos usando AN0
	BSF         TRISA+0, 0 
;adc.c,12 :: 		PORTA.RA0 = 1;        //Opcional
	BSF         PORTA+0, 0 
;adc.c,14 :: 		ADCON0 = 0B00000001;  //AN0 -> AD ligado
	MOVLW       1
	MOVWF       ADCON0+0 
;adc.c,15 :: 		ADCON1 = 0B00001110;  //AN0/RA0 config. como AD, tensão de referencia interna do ADC.
	MOVLW       14
	MOVWF       ADCON1+0 
;adc.c,17 :: 		break;
	GOTO        L_ADCRead1
;adc.c,20 :: 		case 1: {
L_ADCRead3:
;adc.c,21 :: 		ANSELA.B1 = 1;        //Somente RA1/AN1 como ADC  - valido somente para o PIC18F45K22
	BSF         ANSELA+0, 1 
;adc.c,22 :: 		TRISA.RA1 = 1;        //Entrada pois estamos usando AN0
	BSF         TRISA+0, 1 
;adc.c,23 :: 		PORTA.RA1 = 1;        //Opcional
	BSF         PORTA+0, 1 
;adc.c,25 :: 		ADCON0 = 0B00000101;  //AN0 -> AD ligado
	MOVLW       5
	MOVWF       ADCON0+0 
;adc.c,26 :: 		ADCON1 = 0B00001111;  //Caso venhamos a usar o PIC18F4520
	MOVLW       15
	MOVWF       ADCON1+0 
;adc.c,31 :: 		break;
	GOTO        L_ADCRead1
;adc.c,34 :: 		}
L_ADCRead0:
	MOVF        FARG_ADCRead_Canal+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_ADCRead2
	MOVF        FARG_ADCRead_Canal+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_ADCRead3
L_ADCRead1:
;adc.c,36 :: 		ADCON2 = 0B10101010;  //justificativa para direita, Fosc/32, 12Tad
	MOVLW       170
	MOVWF       ADCON2+0 
;adc.c,37 :: 		ADCON0.GO_DONE = 1;           //Start na conversão do ADC
	BSF         ADCON0+0, 1 
;adc.c,38 :: 		while(ADCON0.GO_DONE == 1);   //Aguardar o término da conversão
L_ADCRead4:
	BTFSS       ADCON0+0, 1 
	GOTO        L_ADCRead5
	GOTO        L_ADCRead4
L_ADCRead5:
;adc.c,39 :: 		return ((ADRESH << 8) | (int)ADRESL);  //0 a 1023 pois ADC é 10bits
	MOVF        ADRESH+0, 0 
	MOVWF       R3 
	CLRF        R2 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
	IORWF       R0, 1 
	MOVF        R3, 0 
	IORWF       R1, 1 
;adc.c,41 :: 		}
L_end_ADCRead:
	RETURN      0
; end of _ADCRead
