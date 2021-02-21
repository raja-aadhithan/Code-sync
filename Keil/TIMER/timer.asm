; 250 us DELAY
; 250 us / 1.085 us = 230 and 65536 – 230 = 65306 
; 65306 which in hex is FF1A H
; TL = 1A and TH = FF
		ORG 0000H
		MOV  P1  , #00H ; Clearing the Port
		MOV  TMOD, #10H ; Timer 1 , Mod 1
  AGAIN:MOV  TL1 , #1AH ; Lower byte
		MOV  TH1 ,#0FFH ; Higher byte
		SETB TR1		; Start timer
   BACK:JNB  TF1 ,BACK  ; Check timer status
		CLR  TR1		; Stop timer
		CPL  P1.5		; Compliment bit
		CLR  TF1		; Reset flag
		SJMP AGAIN		; Reload
		END