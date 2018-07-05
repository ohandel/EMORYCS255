* Collaboration Statement:
* * THIS CODE WAS MY OWN WORK , IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS. 
* Owen Handel ************************************************************************************
*************
	xdef Start, Stop, End
	xdef Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10
	xdef A, B, C
	xdef i, j, k
	xdef head
	xdef ans_b, ans_w, ans_l

Start:
*******************************************************************
* Put your assembler instructions here
* Write the answer to each question after the corresponding label.
* DO NOT REMOVE ANY LABEL IN THIS ASSIGNMENT
* *** Failure to do so will result in point dedections !!! ***
*******************************************************************

Q1:
*         ans_b = A[4];
 
 move.w #A, A0
 move.w 4(A0), D0
 move.w D0, ans_b


Q2:
*         ans_l = B[6];

 move.w #B, A0
 move.w 12(A0), D0
 move.l D0, ans_l

Q3:
*         ans_l = C[k];

 move.l #C, A0
 move.l 20(A0), D0
 move.l D0, ans_l


Q4:
*         ans_w = A[i + k];      

 movea.l #A, A0
 move.b i, D0
 ext.w D0
 ext.l D0
 add.l k, D0
 move.b 0(A0, D0.w), D0
 ext.w D0
 move.w D0, ans_w

Q5:
*         ans_w = C[i + j];      

 movea.l #C, A0
 move.b i, D0
 ext.w D0
 add.w j, D0
 muls #4, D0
 move.l 0(A0, D0), D0
 move.w D0, ans_w

Q6:
*         ans_l = A[k] + B[i];  

 movea.l #A, A0
 move.l k, D0
 move.b 0(A0,D0.w), D0
 ext.w D0
 ext.l D0
 movea.l #B, A0
 move.b i, D1
 muls #2, D1
 move.w 0(A0,D1.w), D1
 ext.l D1
 add.l D1, D0
 move.l D0, ans_l
	
	
	
	
Q7:
*         ans_l = A[A[j] + 64];      

 move.l #A, A0	
 move.w j, D0
 move.b 0(A0,D0.w), D0
 ext.w D0
 add.w #64, D0
 move.b 0(A0,D0.w), D0
 ext.w D0
 ext.l D0
 move.l D0, ans_l
	
Q8:
*         ans_w = B[13]

 move.l #B, A0
 move.w 26(A0), D0
 move.w D0, ans_w

Q9:
*	  ans_w = head.value2;

 move.l head, A0
 move.w 4(A0), D0
 move.w D0, ans_w

Q10:
*	  ans_l = head.next.value1;
	
 move.l head, A0
 move.l 6(A0), A0
 move.l 0(A0), D0
 move.l D0, ans_l


*************************************************
* Don't write any code below this line
*************************************************

Stop:	nop
	nop

*************************************************
* Don't touch these variables
* You do NOT need to define more variables !!!
*************************************************

************************************************************************
* Note the use of the even directive to locate the variables ans_w and j
* at an EVEN address due to the variables ans_b and i being bytes
* Short and int variables MUST start on an even address (or you 
* will get an "odd address" error)
************************************************************************

ans_b: ds.b 1
	even
ans_w: ds.w 1
ans_l: ds.l 1

i:     dc.b  3
	even
j:   dc.w  4
k:   dc.l  5

A:  dc.b   -11, 22, -33, 44, -55, 66, -77, 88, -99, 123

B:  dc.w   111, -222, 333, -444, 555, -666, 777, -888, 999, -5171

C:  dc.l   1111, -2222, 3333, -4444, 5555, -6666, 7777, -8888, 9999, -9183


head:   dc.l  list1

list3:  dc.l 2468
        dc.w 88
	dc.l list4
list2:  dc.l 1470
        dc.w 78
	dc.l list3
list4:  dc.l 4567
        dc.w 65
	dc.l list5
list1:  dc.l 1357
        dc.w 98
	dc.l list2
list5:  dc.l 9876
        dc.w 54
	dc.l 0


End:
	end
