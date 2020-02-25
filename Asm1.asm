ScreenSize equ &4000 ;Works as a constant

org &8100 ;; Program starts at this address
	ld hl,&0000 ;; In this case HL register is the source memory address
	ld de,&C000 ;; In this case DE is a destination and &C000 is the start of the CPC screen
	ld bc,ScreenSize ;; In this case BC is byte count and &400 is the total size of the cpc srreen	
	;when brackets () are used in the assembly, they are used to define a memory location
	ldir ;; This means load, increment and repeat
ret ;;return to basic

