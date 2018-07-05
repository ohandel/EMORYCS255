******************************************************
* THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT 
* CONSULTING CODE WRITTEN BY OTHER STUDENTS.
* OWEN HANDEL
******************************************************

	xdef BubbleSort


BubbleSort:
******************************************************
* Write your bubble sort assembler subroutine here
*
*    BubbleSort: input  D0 = address of int array
*                       D1 = N
******************************************************
	move.l #0,fin
	move.l #1,a
	move.l D1,b
	move.l D0,A0

LoopStart:
	move.l fin,D0
	cmp.l #0,D0
	bne LoopEnd
	move.l #0,i
	move.l #1,fin

LoopInnerStart:
	move.l b,D0
	sub.l a,D0
	move.l D0,D1
	move.l i,D0
	cmp.l D0,D1
	ble LoopInnerEnd
	
IfStart:
	move.l i,D0
	muls #4,D0
	move.l 0(A0,D0),D1
	move.l 4(A0,D0),D2
	cmp.l D1,D2
	bge IfEnd
	move.l D2,0(A0,D0)
	move.l D1,4(A0,D0)
	move.l #0,fin
	bra IfEnd
	
IfEnd:
	move.l i,D0
	add.l #1,D0
	move.l D0,i
	bra LoopInnerStart
	
LoopInnerEnd:
	move.l a,D0
	add.l #1,D0
	move.l D0,a
	bra LoopStart
	
LoopEnd:

	rts

* *****************************************************************************
* If you need local variables, you can add variable definitions below this line
* *****************************************************************************
i: ds.l 1
j: ds.l 1
a: ds.l 1
b: ds.l 1
fin: ds.l 1

        end
