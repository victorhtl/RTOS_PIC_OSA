
_InitUART:

;usart.c,7 :: 		void InitUART(void)
;usart.c,9 :: 		UART1_Init(9600);  //Baudrate 9600bps
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;usart.c,11 :: 		PIR1.RC1IF = 0;    //Flag setado assim que o byte for recebido na UART
	BCF         PIR1+0, 5 
;usart.c,12 :: 		IPR1.RC1IP = 1;    //Alta prioridade
	BSF         IPR1+0, 5 
;usart.c,13 :: 		PIE1.RC1IE = 1;    //habilita a interrupção UART na RECEPÇÃO
	BSF         PIE1+0, 5 
;usart.c,14 :: 		}
L_end_InitUART:
	RETURN      0
; end of _InitUART

_UartRx:

;usart.c,16 :: 		void UartRx(void)
;usart.c,23 :: 		if(PIR1.RC1IF == 1)
	BTFSS       PIR1+0, 5 
	GOTO        L_UartRx0
;usart.c,25 :: 		PIR1.RC1IF = 0;       //Apaga o flag. Este é o único periférico
	BCF         PIR1+0, 5 
;usart.c,29 :: 		rec = UART1_Read();   //lÊ o buffer de recepção UART
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       UartRx_rec_L0+0 
;usart.c,34 :: 		if(rec == '[')        //inici a recepção dos dados do frame
	MOVF        R0, 0 
	XORLW       91
	BTFSS       STATUS+0, 2 
	GOTO        L_UartRx1
;usart.c,36 :: 		aux = 1;          //flag que indica início do frame
	MOVLW       1
	MOVWF       UartRx_aux_L0+0 
;usart.c,37 :: 		Pt = dta;          //Passa o endereço inicial da matriz para o ponteiro
	MOVLW       UartRx_dta_L0+0
	MOVWF       UartRx_Pt_L0+0 
	MOVLW       hi_addr(UartRx_dta_L0+0)
	MOVWF       UartRx_Pt_L0+1 
;usart.c,38 :: 		}
	GOTO        L_UartRx2
L_UartRx1:
;usart.c,40 :: 		if(aux == 1)
	MOVF        UartRx_aux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UartRx3
;usart.c,42 :: 		*Pt = rec;       //salvo o byte recebido na matriz dta
	MOVFF       UartRx_Pt_L0+0, FSR1
	MOVFF       UartRx_Pt_L0+1, FSR1H
	MOVF        UartRx_rec_L0+0, 0 
	MOVWF       POSTINC1+0 
;usart.c,44 :: 		if((Pt-dta) > sizeof(dta))
	MOVLW       UartRx_dta_L0+0
	SUBWF       UartRx_Pt_L0+0, 0 
	MOVWF       R1 
	MOVLW       hi_addr(UartRx_dta_L0+0)
	SUBWFB      UartRx_Pt_L0+1, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__UartRx13
	MOVF        R1, 0 
	SUBLW       20
L__UartRx13:
	BTFSC       STATUS+0, 0 
	GOTO        L_UartRx4
;usart.c,46 :: 		aux = 0;
	CLRF        UartRx_aux_L0+0 
;usart.c,47 :: 		}
	GOTO        L_UartRx5
L_UartRx4:
;usart.c,49 :: 		Pt++;
	INFSNZ      UartRx_Pt_L0+0, 1 
	INCF        UartRx_Pt_L0+1, 1 
L_UartRx5:
;usart.c,51 :: 		}
L_UartRx3:
L_UartRx2:
;usart.c,53 :: 		if(rec == ']' && aux == 1)
	MOVF        UartRx_rec_L0+0, 0 
	XORLW       93
	BTFSS       STATUS+0, 2 
	GOTO        L_UartRx8
	MOVF        UartRx_aux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UartRx8
L__UartRx10:
;usart.c,55 :: 		aux = 0;
	CLRF        UartRx_aux_L0+0 
;usart.c,57 :: 		if (!OS_Queue_IsFull_I(queue)) {                 // If there is room
	MOVF        _queue+1, 0 
	XORWF       _queue+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UartRx9
;usart.c,58 :: 		OS_Queue_Send_I(queue, dta);
	MOVLW       _queue+0
	MOVWF       FARG__OS_Queue_Send_I_pQueue+0 
	MOVLW       hi_addr(_queue+0)
	MOVWF       FARG__OS_Queue_Send_I_pQueue+1 
	MOVLW       UartRx_dta_L0+0
	MOVWF       FARG__OS_Queue_Send_I_Msg+0 
	MOVLW       hi_addr(UartRx_dta_L0+0)
	MOVWF       FARG__OS_Queue_Send_I_Msg+1 
	CALL        __OS_Queue_Send_I+0, 0
;usart.c,60 :: 		};
L_UartRx9:
;usart.c,63 :: 		}
L_UartRx8:
;usart.c,66 :: 		}
L_UartRx0:
;usart.c,68 :: 		}
L_end_UartRx:
	RETURN      0
; end of _UartRx
