
__OS_JumpToTask:

;osa_pic18_mikroc.c,64 :: 		
;osa_pic18_mikroc.c,66 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,67 :: 		
	MOVF        4078, 0 
	MOVWF       __OS_State+0 
;osa_pic18_mikroc.c,69 :: 		
	PUSH
;osa_pic18_mikroc.c,70 :: 		
	MOVF        4078, 0, 0
;osa_pic18_mikroc.c,71 :: 		
	MOVWF       4093, 1
;osa_pic18_mikroc.c,72 :: 		
	MOVF        4078, 0, 0
;osa_pic18_mikroc.c,73 :: 		
	MOVWF       4094, 1
;osa_pic18_mikroc.c,74 :: 		
	MOVF        4078, 0, 0
;osa_pic18_mikroc.c,75 :: 		
	MOVWF       4095, 1
;osa_pic18_mikroc.c,76 :: 		
	RETURN      0
;osa_pic18_mikroc.c,78 :: 		
L_end__OS_JumpToTask:
	RETURN      0
; end of __OS_JumpToTask

__OS_ReturnSave:

;osa_pic18_mikroc.c,106 :: 		
;osa_pic18_mikroc.c,108 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,109 :: 		
	MOVF        4093, 0 
	MOVWF       4076 
	MOVF        4094, 0 
	MOVWF       4076 
	MOVF        4095, 0 
	MOVWF       4076 
;osa_pic18_mikroc.c,110 :: 		
	BSF         __OS_State+0, 3 
;osa_pic18_mikroc.c,111 :: 		
	POP
;osa_pic18_mikroc.c,112 :: 		
L_end__OS_ReturnSave:
	RETURN      0
; end of __OS_ReturnSave

__OS_ReturnNoSave:

;osa_pic18_mikroc.c,132 :: 		
;osa_pic18_mikroc.c,134 :: 		
	POP
;osa_pic18_mikroc.c,135 :: 		
L_end__OS_ReturnNoSave:
	RETURN      0
; end of __OS_ReturnNoSave

__OS_EnterWaitMode:

;osa_pic18_mikroc.c,156 :: 		
;osa_pic18_mikroc.c,158 :: 		
	CLRF        __OS_Temp+0 
;osa_pic18_mikroc.c,159 :: 		
	CALL        __OS_ClrReadySetClrCanContinue+0, 0
;osa_pic18_mikroc.c,160 :: 		
L_end__OS_EnterWaitMode:
	RETURN      0
; end of __OS_EnterWaitMode

__OS_EnterWaitModeTO:

;osa_pic18_mikroc.c,181 :: 		
;osa_pic18_mikroc.c,183 :: 		
	MOVLW       255
	MOVWF       __OS_Temp+0 
;osa_pic18_mikroc.c,184 :: 		
	CALL        __OS_ClrReadySetClrCanContinue+0, 0
;osa_pic18_mikroc.c,185 :: 		
L_end__OS_EnterWaitModeTO:
	RETURN      0
; end of __OS_EnterWaitModeTO

__OS_ClrReadySetClrCanContinue:

;osa_pic18_mikroc.c,207 :: 		
;osa_pic18_mikroc.c,209 :: 		
	POP
;osa_pic18_mikroc.c,211 :: 		
	BCF         __OS_Flags+0, 0 
;osa_pic18_mikroc.c,213 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,214 :: 		
	MOVF        4093, 0 
	MOVWF       4076 
	MOVF        4094, 0 
	MOVWF       4076 
	MOVF        4095, 0 
	MOVWF       4076 
;osa_pic18_mikroc.c,215 :: 		
	BCF         __OS_State+0, 3 
;osa_pic18_mikroc.c,218 :: 		
	BTFSC       __OS_State+0, 4 
	GOTO        L__OS_ClrReadySetClrCanContinue0
	BCF         __OS_State+0, 5 
L__OS_ClrReadySetClrCanContinue0:
;osa_pic18_mikroc.c,219 :: 		
	BTFSS       __OS_Temp+0, 0 
	GOTO        L__OS_ClrReadySetClrCanContinue1
	BSF         __OS_State+0, 5 
L__OS_ClrReadySetClrCanContinue1:
;osa_pic18_mikroc.c,222 :: 		
L_end__OS_ClrReadySetClrCanContinue:
	RETURN      0
; end of __OS_ClrReadySetClrCanContinue

__OS_SET_FSR_CUR_TASK:

;osa_pic18_mikroc.c,242 :: 		
;osa_pic18_mikroc.c,244 :: 		
	MOVF        __OS_CurTask+0, 0 
	MOVWF       4073 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       4074 
;osa_pic18_mikroc.c,245 :: 		
L_end__OS_SET_FSR_CUR_TASK:
	RETURN      0
; end of __OS_SET_FSR_CUR_TASK

_OS_DI:

;osa_pic18_mikroc.c,281 :: 		
;osa_pic18_mikroc.c,284 :: 		
	MOVLW       192
	ANDWF       4082, 0 
	MOVWF       R1 
;osa_pic18_mikroc.c,285 :: 		
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;osa_pic18_mikroc.c,286 :: 		
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_OS_DI2
	BCF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_OS_DI2:
;osa_pic18_mikroc.c,287 :: 		
	MOVF        R1, 0 
	MOVWF       R0 
;osa_pic18_mikroc.c,288 :: 		
L_end_OS_DI:
	RETURN      0
; end of _OS_DI

__OS_DI_INT:

;osa_pic18_mikroc.c,294 :: 		
;osa_pic18_mikroc.c,296 :: 		
	MOVLW       192
	ANDWF       4082, 0 
	MOVWF       __OS_Temp_I+0 
;osa_pic18_mikroc.c,297 :: 		
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;osa_pic18_mikroc.c,298 :: 		
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L__OS_DI_INT3
	BCF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L__OS_DI_INT3:
;osa_pic18_mikroc.c,299 :: 		
L_end__OS_DI_INT:
	RETURN      0
; end of __OS_DI_INT

_OS_RI:

;osa_pic18_mikroc.c,326 :: 		
;osa_pic18_mikroc.c,328 :: 		
	BTFSS       FARG_OS_RI_temp+0, 7 
	GOTO        L_OS_RI4
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
L_OS_RI4:
;osa_pic18_mikroc.c,329 :: 		
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_OS_RI5
;osa_pic18_mikroc.c,331 :: 		
	BTFSS       FARG_OS_RI_temp+0, 6 
	GOTO        L_OS_RI6
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_OS_RI6:
;osa_pic18_mikroc.c,332 :: 		
L_OS_RI5:
;osa_pic18_mikroc.c,333 :: 		
L_end_OS_RI:
	RETURN      0
; end of _OS_RI

__OS_RI_INT:

;osa_pic18_mikroc.c,339 :: 		
;osa_pic18_mikroc.c,341 :: 		
	BTFSS       __OS_Temp_I+0, 7 
	GOTO        L__OS_RI_INT7
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
L__OS_RI_INT7:
;osa_pic18_mikroc.c,342 :: 		
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L__OS_RI_INT8
;osa_pic18_mikroc.c,344 :: 		
	BTFSS       __OS_Temp_I+0, 6 
	GOTO        L__OS_RI_INT9
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L__OS_RI_INT9:
;osa_pic18_mikroc.c,345 :: 		
L__OS_RI_INT8:
;osa_pic18_mikroc.c,346 :: 		
L_end__OS_RI_INT:
	RETURN      0
; end of __OS_RI_INT

__OS_CheckEvent:

;osa_pic18_mikroc.c,383 :: 		
;osa_pic18_mikroc.c,421 :: 		
	BCF         __OS_Flags+0, 5 
;osa_pic18_mikroc.c,422 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,424 :: 		
	MOVF        FARG__OS_CheckEvent_bEvent+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__OS_CheckEvent10
;osa_pic18_mikroc.c,426 :: 		
	BTFSS       __OS_State+0, 3 
	GOTO        L__OS_CheckEvent11
;osa_pic18_mikroc.c,430 :: 		
	BCF         __OS_State+0, 4 
;osa_pic18_mikroc.c,431 :: 		
	BCF         4079, 4 
;osa_pic18_mikroc.c,439 :: 		
	GOTO        L_end__OS_CheckEvent
;osa_pic18_mikroc.c,440 :: 		
L__OS_CheckEvent11:
;osa_pic18_mikroc.c,442 :: 		
	BSF         __OS_State+0, 3 
;osa_pic18_mikroc.c,444 :: 		
	GOTO        L__OS_CheckEvent12
L__OS_CheckEvent10:
;osa_pic18_mikroc.c,445 :: 		
	BCF         __OS_State+0, 3 
;osa_pic18_mikroc.c,446 :: 		
L__OS_CheckEvent12:
;osa_pic18_mikroc.c,450 :: 		
	BTFSC       __OS_State+0, 4 
	GOTO        L__OS_CheckEvent15
	BTFSS       __OS_State+0, 5 
	GOTO        L__OS_CheckEvent15
L___OS_CheckEvent45:
;osa_pic18_mikroc.c,452 :: 		
	BSF         __OS_State+0, 3 
;osa_pic18_mikroc.c,453 :: 		
	BSF         __OS_Flags+0, 5 
;osa_pic18_mikroc.c,459 :: 		
	GOTO        L_end__OS_CheckEvent
;osa_pic18_mikroc.c,460 :: 		
L__OS_CheckEvent15:
;osa_pic18_mikroc.c,464 :: 		
	POP
;osa_pic18_mikroc.c,469 :: 		
L_end__OS_CheckEvent:
	RETURN      0
; end of __OS_CheckEvent

__OS_Stimer_GetFree:

;osa_stimer.c,93 :: 		
;osa_stimer.c,98 :: 		
	BCF         __OS_Flags+0, 1 
;osa_stimer.c,100 :: 		
	CLRF        R3 
L__OS_Stimer_GetFree16:
	MOVF        R3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Stimer_GetFree17
;osa_stimer.c,102 :: 		
	MOVLW       __OS_StimersFree+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(__OS_StimersFree+0)
	MOVWF       FSR0L+1 
	MOVF        R3, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R5 
;osa_stimer.c,103 :: 		
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__OS_Stimer_GetFree19
;osa_stimer.c,105 :: 		
	BTFSC       FARG__OS_Stimer_GetFree_bCreate+0, 0 
	GOTO        L__OS_Stimer_GetFree20
	CLRF        R0 
	GOTO        L_end__OS_Stimer_GetFree
L__OS_Stimer_GetFree20:
;osa_stimer.c,107 :: 		
	MOVF        R3, 0 
	MOVWF       R4 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R4, 1 
	BCF         R4, 0 
;osa_stimer.c,108 :: 		
	MOVLW       1
	MOVWF       R6 
;osa_stimer.c,109 :: 		
L__OS_Stimer_GetFree21:
	MOVF        R6, 0 
	ANDWF       R5, 0 
	MOVWF       R0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Stimer_GetFree22
;osa_stimer.c,111 :: 		
	RLCF        R6, 1 
	BCF         R6, 0 
;osa_stimer.c,112 :: 		
	INCF        R4, 1 
;osa_stimer.c,113 :: 		
	GOTO        L__OS_Stimer_GetFree21
L__OS_Stimer_GetFree22:
;osa_stimer.c,114 :: 		
	MOVLW       __OS_StimersFree+0
	MOVWF       R1 
	MOVLW       hi_addr(__OS_StimersFree+0)
	MOVWF       R2 
	MOVF        R3, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	COMF        R6, 0 
	MOVWF       R0 
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        POSTINC0+0, 0 
	ANDWF       R0, 1 
	MOVFF       R1, FSR1L+0
	MOVFF       R2, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;osa_stimer.c,115 :: 		
	MOVF        R4, 0 
	MOVWF       R0 
	GOTO        L_end__OS_Stimer_GetFree
;osa_stimer.c,116 :: 		
L__OS_Stimer_GetFree19:
;osa_stimer.c,100 :: 		
	INCF        R3, 1 
;osa_stimer.c,117 :: 		
	GOTO        L__OS_Stimer_GetFree16
L__OS_Stimer_GetFree17:
;osa_stimer.c,119 :: 		
	BSF         __OS_Flags+0, 1 
;osa_stimer.c,120 :: 		
	MOVLW       255
	MOVWF       R0 
;osa_stimer.c,121 :: 		
L_end__OS_Stimer_GetFree:
	RETURN      0
; end of __OS_Stimer_GetFree

__OS_Stimer_Free:

;osa_stimer.c,126 :: 		
;osa_stimer.c,128 :: 		
	MOVF        FARG__OS_Stimer_Free_ID+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       __OS_StimersFree+0
	MOVWF       R2 
	MOVLW       hi_addr(__OS_StimersFree+0)
	MOVWF       R3 
	MOVF        R0, 0 
	ADDWF       R2, 1 
	BTFSC       STATUS+0, 0 
	INCF        R3, 1 
	MOVLW       7
	ANDWF       FARG__OS_Stimer_Free_ID+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L___OS_Stimer_Free60:
	BZ          L___OS_Stimer_Free61
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L___OS_Stimer_Free60
L___OS_Stimer_Free61:
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	IORWF       R0, 1 
	MOVFF       R2, FSR1L+0
	MOVFF       R3, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;osa_stimer.c,129 :: 		
L_end__OS_Stimer_Free:
	RETURN      0
; end of __OS_Stimer_Free

__OS_InitDelay:

;osa_ttimer.c,69 :: 		
;osa_ttimer.c,72 :: 		
	BCF         __OS_State+0, 5 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR1L+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR1L+1 
	BCF         POSTINC1+0, 4 
;osa_ttimer.c,77 :: 		
	MOVF        FARG__OS_InitDelay_Delay+0, 0 
	IORWF       FARG__OS_InitDelay_Delay+1, 0 
	IORWF       FARG__OS_InitDelay_Delay+2, 0 
	IORWF       FARG__OS_InitDelay_Delay+3, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__OS_InitDelay23
;osa_ttimer.c,79 :: 		
	MOVLW       255
	XORWF       FARG__OS_InitDelay_Delay+0, 0 
	MOVWF       R0 
	MOVLW       255
	XORWF       FARG__OS_InitDelay_Delay+1, 0 
	MOVWF       R1 
	MOVLW       255
	XORWF       FARG__OS_InitDelay_Delay+2, 0 
	MOVWF       R2 
	MOVLW       255
	XORWF       FARG__OS_InitDelay_Delay+3, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVF        R1, 0 
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVF        R2, 0 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVF        R3, 0 
	MOVWF       FARG__OS_InitDelay_Delay+3 
;osa_ttimer.c,80 :: 		
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       R6 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R7 
	MOVF        R4, 0 
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVF        R5, 0 
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVF        R6, 0 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVF        R7, 0 
	MOVWF       FARG__OS_InitDelay_Delay+3 
;osa_ttimer.c,81 :: 		
	MOVF        __OS_CurTask+0, 0 
	MOVWF       R0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       R1 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        R4, 0 
	MOVWF       POSTINC1+0 
	MOVF        R5, 0 
	MOVWF       POSTINC1+0 
	MOVF        R6, 0 
	MOVWF       POSTINC1+0 
	MOVF        R7, 0 
	MOVWF       POSTINC1+0 
;osa_ttimer.c,82 :: 		
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR1L+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR1L+1 
	BSF         POSTINC1+0, 3 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR1L+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR1L+1 
	BSF         POSTINC1+0, 4 
;osa_ttimer.c,87 :: 		
	BSF         __OS_State+0, 4 
;osa_ttimer.c,88 :: 		
	BSF         __OS_State+0, 3 
;osa_ttimer.c,90 :: 		
L__OS_InitDelay23:
;osa_ttimer.c,91 :: 		
L_end__OS_InitDelay:
	RETURN      0
; end of __OS_InitDelay

__OS_Queue_Send:

;osa_queue.c,64 :: 		
;osa_queue.c,70 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVLW       4
	MOVWF       FSR1L+0 
	MOVLW       0
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Send_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVF        FARG__OS_Queue_Send_pQueue+1, 0 
	MOVWF       FSR0L+1 
L__OS_Queue_Send24:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send24
;osa_queue.c,71 :: 		
	BCF         __OS_Flags+0, 0 
;osa_queue.c,77 :: 		
	MOVF        R4, 0 
	XORWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send25
;osa_queue.c,79 :: 		
	MOVLW       3
	ADDWF       FARG__OS_Queue_Send_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG__OS_Queue_Send_pQueue+1, 0 
	MOVWF       FSR0L+1 
	MOVF        R6, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       FSR1L+0 
	MOVF        R1, 0 
	ADDWFC      POSTINC0+0, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Send_Msg+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Queue_Send_Msg+1, 0 
	MOVWF       POSTINC1+0 
;osa_queue.c,80 :: 		
	MOVF        R6, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R6 
;osa_queue.c,81 :: 		
	MOVF        R6, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send26
	CLRF        R6 
L__OS_Queue_Send26:
;osa_queue.c,83 :: 		
	BSF         __OS_Flags+0, 0 
;osa_queue.c,84 :: 		
	GOTO        ____OS_Queue_Send_EXIT
;osa_queue.c,85 :: 		
L__OS_Queue_Send25:
;osa_queue.c,92 :: 		
	MOVF        R6, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       R7 
	MOVF        R3, 0 
	MOVWF       R8 
;osa_queue.c,93 :: 		
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L___OS_Queue_Send64
	MOVF        R4, 0 
	SUBWF       R2, 0 
L___OS_Queue_Send64:
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Queue_Send27
	MOVF        R4, 0 
	SUBWF       R7, 1 
	MOVLW       0
	SUBWFB      R8, 1 
L__OS_Queue_Send27:
;osa_queue.c,94 :: 		
	MOVLW       3
	ADDWF       FARG__OS_Queue_Send_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG__OS_Queue_Send_pQueue+1, 0 
	MOVWF       FSR0L+1 
	MOVF        R7, 0 
	MOVWF       R0 
	MOVF        R8, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       FSR1L+0 
	MOVF        R1, 0 
	ADDWFC      POSTINC0+0, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Send_Msg+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Queue_Send_Msg+1, 0 
	MOVWF       POSTINC1+0 
;osa_queue.c,95 :: 		
	MOVF        R5, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R5 
;osa_queue.c,97 :: 		
____OS_Queue_Send_EXIT:
;osa_queue.c,99 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVF        FARG__OS_Queue_Send_pQueue+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FARG__OS_Queue_Send_pQueue+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       4
	MOVWF       FSR0L+0 
	MOVLW       0
	MOVWF       FSR0L+1 
L__OS_Queue_Send28:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send28
;osa_queue.c,100 :: 		
L_end__OS_Queue_Send:
	RETURN      0
; end of __OS_Queue_Send

__OS_Queue_Send_I:

;osa_queue.c,136 :: 		
;osa_queue.c,142 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVLW       4
	MOVWF       FSR1L+0 
	MOVLW       0
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Send_I_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVF        FARG__OS_Queue_Send_I_pQueue+1, 0 
	MOVWF       FSR0L+1 
L__OS_Queue_Send_I29:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send_I29
;osa_queue.c,143 :: 		
	BCF         __OS_Flags+0, 0 
;osa_queue.c,149 :: 		
	MOVF        R4, 0 
	XORWF       R5, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send_I30
;osa_queue.c,151 :: 		
	MOVLW       3
	ADDWF       FARG__OS_Queue_Send_I_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG__OS_Queue_Send_I_pQueue+1, 0 
	MOVWF       FSR0L+1 
	MOVF        R6, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       FSR1L+0 
	MOVF        R1, 0 
	ADDWFC      POSTINC0+0, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Send_I_Msg+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Queue_Send_I_Msg+1, 0 
	MOVWF       POSTINC1+0 
;osa_queue.c,152 :: 		
	MOVF        R6, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R6 
;osa_queue.c,153 :: 		
	MOVF        R6, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send_I31
	CLRF        R6 
L__OS_Queue_Send_I31:
;osa_queue.c,155 :: 		
	BSF         __OS_Flags+0, 0 
;osa_queue.c,156 :: 		
	GOTO        ____OS_Queue_Send_I_EXIT
;osa_queue.c,157 :: 		
L__OS_Queue_Send_I30:
;osa_queue.c,163 :: 		
	MOVF        R6, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       R7 
	MOVF        R3, 0 
	MOVWF       R8 
;osa_queue.c,164 :: 		
	MOVLW       0
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L___OS_Queue_Send_I66
	MOVF        R4, 0 
	SUBWF       R2, 0 
L___OS_Queue_Send_I66:
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Queue_Send_I32
	MOVF        R4, 0 
	SUBWF       R7, 1 
	MOVLW       0
	SUBWFB      R8, 1 
L__OS_Queue_Send_I32:
;osa_queue.c,165 :: 		
	MOVLW       3
	ADDWF       FARG__OS_Queue_Send_I_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG__OS_Queue_Send_I_pQueue+1, 0 
	MOVWF       FSR0L+1 
	MOVF        R7, 0 
	MOVWF       R0 
	MOVF        R8, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       FSR1L+0 
	MOVF        R1, 0 
	ADDWFC      POSTINC0+0, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Send_I_Msg+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Queue_Send_I_Msg+1, 0 
	MOVWF       POSTINC1+0 
;osa_queue.c,166 :: 		
	MOVF        R5, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R5 
;osa_queue.c,168 :: 		
____OS_Queue_Send_I_EXIT:
;osa_queue.c,170 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVF        FARG__OS_Queue_Send_I_pQueue+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FARG__OS_Queue_Send_I_pQueue+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       4
	MOVWF       FSR0L+0 
	MOVLW       0
	MOVWF       FSR0L+1 
L__OS_Queue_Send_I33:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Send_I33
;osa_queue.c,171 :: 		
L_end__OS_Queue_Send_I:
	RETURN      0
; end of __OS_Queue_Send_I

__OS_Queue_Get:

;osa_queue.c,213 :: 		
;osa_queue.c,220 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVLW       3
	MOVWF       FSR1L+0 
	MOVLW       0
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Get_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVF        FARG__OS_Queue_Get_pQueue+1, 0 
	MOVWF       FSR0L+1 
L__OS_Queue_Get34:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Get34
;osa_queue.c,221 :: 		
	MOVF        R5, 0 
	MOVWF       R6 
;osa_queue.c,222 :: 		
	MOVF        R5, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R5 
;osa_queue.c,224 :: 		
	MOVF        R3, 0 
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Queue_Get35
	CLRF        R5 
L__OS_Queue_Get35:
;osa_queue.c,226 :: 		
	DECF        R4, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R4 
;osa_queue.c,227 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVF        FARG__OS_Queue_Get_pQueue+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FARG__OS_Queue_Get_pQueue+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       3
	MOVWF       FSR0L+0 
	MOVLW       0
	MOVWF       FSR0L+1 
L__OS_Queue_Get36:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Get36
;osa_queue.c,229 :: 		
	MOVLW       3
	ADDWF       FARG__OS_Queue_Get_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG__OS_Queue_Get_pQueue+1, 0 
	MOVWF       FSR0L+1 
	MOVF        R6, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      POSTINC0+0, 0 
	MOVWF       FSR0L+1 
;osa_queue.c,231 :: 		
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
;osa_queue.c,232 :: 		
L_end__OS_Queue_Get:
	RETURN      0
; end of __OS_Queue_Get

__OS_Queue_Get_I:

;osa_queue.c,267 :: 		
;osa_queue.c,272 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVLW       3
	MOVWF       FSR1L+0 
	MOVLW       0
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Queue_Get_I_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVF        FARG__OS_Queue_Get_I_pQueue+1, 0 
	MOVWF       FSR0L+1 
L__OS_Queue_Get_I37:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Get_I37
;osa_queue.c,273 :: 		
	MOVF        R5, 0 
	MOVWF       R6 
;osa_queue.c,274 :: 		
	MOVF        R5, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R5 
;osa_queue.c,276 :: 		
	MOVF        R3, 0 
	SUBWF       R5, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Queue_Get_I38
	CLRF        R5 
L__OS_Queue_Get_I38:
;osa_queue.c,278 :: 		
	DECF        R4, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R4 
;osa_queue.c,279 :: 		
	MOVLW       3
	MOVWF       R0 
	MOVF        FARG__OS_Queue_Get_I_pQueue+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FARG__OS_Queue_Get_I_pQueue+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       3
	MOVWF       FSR0L+0 
	MOVLW       0
	MOVWF       FSR0L+1 
L__OS_Queue_Get_I39:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Queue_Get_I39
;osa_queue.c,281 :: 		
	MOVLW       3
	ADDWF       FARG__OS_Queue_Get_I_pQueue+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG__OS_Queue_Get_I_pQueue+1, 0 
	MOVWF       FSR0L+1 
	MOVF        R6, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      POSTINC0+0, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
;osa_queue.c,282 :: 		
L_end__OS_Queue_Get_I:
	RETURN      0
; end of __OS_Queue_Get_I

_OS_Init:

;osa_system.c,67 :: 		
;osa_system.c,72 :: 		
	CLRF        __OS_Flags+0 
;osa_system.c,81 :: 		
	MOVLW       __OS_Tasks+27
	MOVWF       __OS_LastTask+0 
	MOVLW       hi_addr(__OS_Tasks+27)
	MOVWF       __OS_LastTask+1 
;osa_system.c,238 :: 		
	MOVLW       3
	MOVWF       __OS_StimersFree+0 
;osa_system.c,260 :: 		
	CLRF        __OS_Bsems+0 
;osa_system.c,326 :: 		
	BCF         __OS_Tasks+0, 6 
;osa_system.c,329 :: 		
	BCF         __OS_Tasks+9, 6 
;osa_system.c,333 :: 		
	BCF         __OS_Tasks+18, 6 
;osa_system.c,337 :: 		
	BCF         __OS_Tasks+27, 6 
;osa_system.c,394 :: 		
L_end_OS_Init:
	RETURN      0
; end of _OS_Init

__OS_Task_Create:

;osa_tasks.c,75 :: 		
;osa_tasks.c,79 :: 		
	BCF         __OS_Flags+0, 1 
;osa_tasks.c,88 :: 		
	MOVLW       __OS_Tasks+0
	MOVWF       R1 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       R2 
;osa_tasks.c,89 :: 		
	CLRF        __OS_Temp+0 
;osa_tasks.c,91 :: 		
L__OS_Task_Create40:
;osa_tasks.c,93 :: 		
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 6 
	GOTO        L__OS_Task_Create43
;osa_tasks.c,95 :: 		
	BSF         FARG__OS_Task_Create_priority+0, 6 
;osa_tasks.c,96 :: 		
	BSF         FARG__OS_Task_Create_priority+0, 3 
;osa_tasks.c,98 :: 		
	MOVLW       1
	ADDWF       R1, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG__OS_Task_Create_TaskAddr+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Task_Create_TaskAddr+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Task_Create_TaskAddr+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Task_Create_TaskAddr+3, 0 
	MOVWF       POSTINC1+0 
;osa_tasks.c,101 :: 		
	MOVLW       5
	ADDWF       R1, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;osa_tasks.c,108 :: 		
	MOVFF       R1, FSR1L+0
	MOVFF       R2, FSR1H+0
	MOVF        FARG__OS_Task_Create_priority+0, 0 
	MOVWF       POSTINC1+0 
;osa_tasks.c,111 :: 		
	MOVF        R2, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L___OS_Task_Create71
	MOVF        __OS_CurTask+0, 0 
	XORWF       R1, 0 
L___OS_Task_Create71:
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Task_Create44
	MOVF        FARG__OS_Task_Create_priority+0, 0 
	MOVWF       __OS_State+0 
L__OS_Task_Create44:
;osa_tasks.c,126 :: 		
	BCF         __OS_Flags+0, 1 
;osa_tasks.c,128 :: 		
	GOTO        L_end__OS_Task_Create
;osa_tasks.c,130 :: 		
L__OS_Task_Create43:
;osa_tasks.c,132 :: 		
	MOVLW       9
	ADDWF       R1, 1 
	MOVLW       0
	ADDWFC      R2, 1 
;osa_tasks.c,134 :: 		
	INCF        __OS_Temp+0, 1 
	MOVLW       4
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Task_Create40
;osa_tasks.c,137 :: 		
	BSF         __OS_Flags+0, 1 
;osa_tasks.c,139 :: 		
;osa_tasks.c,140 :: 		
L_end__OS_Task_Create:
	RETURN      0
; end of __OS_Task_Create
