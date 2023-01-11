			.ORIG			x3000
			LD			R0, Number1
			LD			R1, Number2
			
			ST			R2, saveR2		;saves the current R2 value into saveR2
			LD			R5, adrSUB		;loads the address of the subroutine into R5
; call the SUB subroutine, use JSRR if the SUB is within 11 bit offset
			JSRR			R5			;actually goes to the subroutine	
			ST			R3, RESULT		;stores the result of R3 from SUB into RESULT
			LD			R2, saveR2		;because R2 was changed in SUB, we need to reload the original R2 back into R2


			HALT
Number1			.FILL			10
Number2			.FILL			8
RESULT			.BLKW			1
saveR2			.BLKW			1
adrSUB			.FILL			SUB

;;SUB is basically a method in java (TRAP)
SUB			NOT			R1, R1			;negate R1
			ADD			R2, R1, 1		;twos compliment of R1 and puts it into R2 (thus changing R2)
			ADD			R3, R0, R1 		;R3 = R0 + (-R1)
			RET						;RET is the end of the subroutine
			.END