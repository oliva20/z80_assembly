ScreenSize equ &4000 ;Works as a constant

org &8000
	ld hl,&C000
	ld de,&C000+1
	ld bc,ScreenSize-1
	ld (h1),0
	ldir
ret