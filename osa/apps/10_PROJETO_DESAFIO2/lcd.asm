
_InitLCD:

;lcd.c,3 :: 		void InitLCD(void)
;lcd.c,5 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lcd.c,6 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,7 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,9 :: 		}
L_end_InitLCD:
	RETURN      0
; end of _InitLCD
