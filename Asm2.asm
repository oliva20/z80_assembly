ScreenSize equ &4000
org &8200
	ld a,%00001111
FillAgain: ;; this is the definition of a label
	ld hl,&C000 ;; C001 - C002 - C003  and etc 
	ld de,&C000+1 ;;/ 
	ld bc,ScreenSize-1 
	ld (hl),a
	ldir
	dec a ; decrease a
	cp 255 ; check if a equals 255
	jp nz,FillAgain ; if condition is not met
ret