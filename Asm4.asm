org &8000 ; start the program at memory address &8000 
	ld a,(&9000) ; a stands for accumulator 
	ld bc,(&9001) ; its going to load from 9001 9002 because bc is a 16 bit register |  bc stands for byte count
	
;============================================================================================================
	; ==================== CHECK USER INPUT AND JUMP TO APPRIATE LABEL =================================
	cp 0 ; compares the accumulator with 0 If true proceed with the command afterwards
	jr z,MathAdd ; if user input equals 0 jump to function MathAdd
	cp 1 ; compares the accumulator with 1
	jr z,MathSub ; if user input equals 1 jump to function MathSub | 'Z' means that the difference is "zero"
	cp 2 ; compares a with 2
	jr z,MathMult
	cp 3 ; compares a with 3
	jr z,MathDiv 
;====================================================================================================  ========
	ld a,0 ; load a with zero 

SaveResult: ; create  a label 
	ld (&9003),a ;use a different destination in source. an store a value to 90003 
ret

MathSub:
	ld a,c ; load c in to a 
	sub b ; subtract 'b' from 'a'
jr SaveResult ; jump to save result


MathAdd:
	ld a,c ; load c into a
	add b ; add a into a 
jr SaveResult ; save the result 


MathMult:
	ld a,b 
	cp 0 
	jr z, SaveResult
	ld a,0

MathMultAgain:
	add c
	djnz MathMultAgain	

jr SaveResult


MathDiv:
	ld a,c
	cp 0 ; compare a accumulator to 0 
	jr z, SaveResult
	ld d,0 ; how many is the value in the other value
	
MathDivAgain 
	sub b
	inc d
	jr nc,MathDivAgain ; if there condition true and keep looping
	dec d ; decrease d by one
	ld a,d
jr SaveResult 