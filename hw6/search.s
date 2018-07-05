******************************************************
* THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT 
* CONSULTING CODE WRITTEN BY OTHER STUDENTS.
* OWEN HANDEL
******************************************************



	xdef BinarySearch
	xdef x

BinarySearch:
******************************************************
* Write your recursive binary search assembler subroutine here
*
*    BinarySearch: input stack frame (see pdf for details)
*                    
******************************************************
	

	move.l A6,-(A7)
	move.l A7,A6
	suba.l #4, a7
	

***CALCULATE MID
	move.l 12(A6),D1 ***LOW VALUE
	move.l 8(A6),D2 ***HIGH VALUE
	add.l D1,D2
	divs #2,D2
	ext.l D2
	move.l D2,-4(a6)
	

***COMPARE TO SEE IF EXEC
	move.l 8(A6),D2
	move.l 12(A6),D1
	cmp.l D2,D1
	ble IF
	

***RETURN -1 IF KEY NOT IN ARRAY
	move.l #-1,D0
	

***POSTLUDE 
	move.l A6,A7
	move.l (A7)+,A6
	rts


IF:

***A[MID]>KEY
	move.l 20(A6),A0
	move.l 16(A6),D3
	move.l -4(a6),D1
	muls #4,D1
	move.l (A0,D1),D2
	cmp.l D2,D3
	bge IF1


***CONTINUE IF LESS THAN
	move.l 8(A6),D1
	move.l -4(a6),D1
	adda.l #4,A7
	sub.l #1,D1
	***PARAMETERS
	move.l A0,-(A7)
	move.l D3,-(A7)
	move.l 12(A6),-(A7)
	move.l D1,-(A7)
	bsr BinarySearch
	***CLEAN STACK
	adda.l #16,A7 
	
	***POSTLUDE
	move.l A6,A7
	move.l (A7)+,A6
	rts


IF1:

***A[MID]<KEY
	move.l 16(A6),D3
	move.l -4(a6),D1
	adda.l #4,A7
	muls #4,D1
	move.l (A0,D1),D2
	cmp.l D2,D3
	beq ELSE

***CONTINUE IF NOT EQUAL
	move.l 12(A6),D1
	move.l -4(a6),D1
	add.l #1,D1
	

***PARAMETERS
	move.l A0,-(A7)
	move.l D3,-(A7)
	move.l D1,-(A7)
	move.l 8(A6),-(A7)
	bsr BinarySearch
	

***CLEAN STACK
	adda.l #16,A7 
	

***POSTLUDE
	move.l A6,A7
	move.l (A7)+,A6
	rts

ELSE:

***IF KEY IS FOUND
	move.l -4(a6),D0
	

***POSTLUDE
	move.l A6,A7
	move.l (A7)+,A6
	rts
End:
	rts


* *****************************************************************************
* If you need local variables, you can add variable definitions below this line
* *****************************************************************************

a: ds.l 1



