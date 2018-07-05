* ********************************************************************
* * Collaboration Statement:
* * THIS CODE WAS MY OWN WORK , IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS. 
* Owen Handel ************************************************************************************
*************
* ********************************************************************
        xdef Start, Stop, End
        xdef A, B, len_a, len_b, max, min, sum, common

* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* You can add more xdef here to export labels to emacsim
* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*      Put your assembler program here - between the start and stop label
*      DO NOT define any variables here - see the variable section below
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Start:
	
	move.l #0,i
	move.l A,max

FindMax:
	move.l i,D0
	cmp.l len_a,D0
	bge StartMin
	
	movea.l #A,A0
	movea.l #B,A1
	
	move.l i,D0
	muls #4,D0
	move.l 0(A0,D0),D1
	move.l 0(A1,D0),D2

	move.l max,D3
	cmp.l D1,D2
	ble IfAMax
	cmp.l D1,D2
	bgt IfBMax

IfAMax:
	cmp.l D3,D1
	ble IfEndMax
	
	move.l D1,max
	bra IfEndMax

IfBMax:
	cmp.l D3,D2
	ble IfEndMax
	
	move.l D2,max
	bra IfEndMax

IfEndMax: 
	move.l i,D0
	add.l #1,D0
	move.l D0,i
	
	bra FindMax



StartMin:
	move.l #0,i
	move.l A,min

FindMin:
	move.l i,D0
	cmp.l len_a,D0
	bge StartCommon
	
	movea.l #A,A0
	movea.l #B,A1
	
	move.l i,D0
	muls #4,D0
	move.l 0(A0,D0),D1
	move.l 0(A1,D0),D2

	move.l min,D3
	cmp.l D1,D2
	ble IfBMin
	cmp.l D1,D2
	bgt IfAMin

IfAMin:
	cmp.l D3,D1
	bge IfEndMin
	
	move.l D1,min
	bra IfEndMin

IfBMin:
	cmp.l D3,D2
	bge IfEndMin
	
	move.l D2,min
	bra IfEndMin

IfEndMin: 
	move.l i,D0
	add.l #1,D0
	move.l D0,i
	
	bra FindMin



StartCommon:
	move.l #0,i
	move.l #0,common
	move.l #0,j

FindCommon:
	move.l i,D0
	cmp.l len_a, D0
	bge StartSum
	
	movea.l #A,A0
	movea.l #B,A1

	move.l i,D0
	muls #4,D0
	
	move.l 0(A0,D0),D1

NestedCommon:
	move.l j, D3
	cmp.l len_a, D3
	bge IfEndCommon
	movea.l #B,A1
	muls #4,D3
	move.l 0(A1,D3),D2
	cmp.l D1,D2
	blt NestedLoop
	cmp.l D1,D2
	bgt NestedLoop
	move.l common,D0
	add.l #1,D0
	move.l D0, common
	bra IfEndCommon
	
NestedLoop:
	move.l j,D3
	add.l #1,D3
	move.l D3,j
	
	bra NestedCommon

IfEndCommon:
	move.l i,D0
	add.l #1,D0
	move.l D0,i
	move.l j,D0
	move.l #0,D0
	move.l D0,j
	
	bra FindCommon



StartSum:
	move.l #0,i
	move.l #0,sum
	

FindSumA:
	move.l i,D0
	cmp.l len_a, D0
	bge Reset
	movea.l #A,A0
	muls #4,D0
	move.l 0(A0,D0),D1
	add.l D1,sum
	
	bra LoopA

LoopA:
	move.l i,D0
	add.l #1,D0
	move.l D0,i
	
	bra FindSumA

Reset:
	move.l i,D0
	move.l #0,D0
	move.l D0,i
	
	bra FindSumB

FindSumB:
	move.l i,D0
	cmp.l len_b, D0
	bge EndSum
	movea.l #B,A0
	muls #4,D0
	move.l 0(A0,D0),D1
	add.l D1,sum
	
	bra LoopB

LoopB:
	move.l i,D0
	add.l #1,D0
	move.l D0,i
	
	bra FindSumB

EndSum:



	
* ********************************************************************
* Do not touch the stop label - you need it to stop the program
*********************************************************************
Stop:   nop
	


* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*    Variable Section -   Put your variables here IF you need more
*
*    DO NOT define A, B, len_a, len_b, max, min, sum and common !!!
*    They are already defined below
*
*    You can add more variables below this line if you need them
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
i:	dc.l 1
j:	dc.l 1




* ********************************************************************
* Adjust the arrays (and lengths) below to test different arrays
* ********************************************************************
A:      dc.l  13,3,21,1,8,5,4,23
B:      dc.l  4,8,15,16,23,42
len_a:  dc.l  8
len_b:  dc.l  6

* ********************************************************************
* Do not touch anything below this line !!!
* ********************************************************************
max:    ds.l  1
min:    ds.l  1
sum:    ds.l  1
common: ds.l  1

End:    nop
        end
