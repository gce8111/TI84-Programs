#include "includes\ti84pce.inc"

.assume ADL=1
.org userMem-2
.db tExtTok,tAsm84CeCmp

 ld hl,Palette
 ld de,mpLcdPalette
 ld bc,2*2					;total number of bytes needed to store palette
 ldir
 
 ld a,lcdBpp1				;go to 8bpp mode
 ld (mpLcdCtrl),a
 
 call CLS
 
 call DrawMap
 
 call _GetKey				;wait for user
 
 ld a,lcdBpp16				;go back to 16bpp so screen isn't corrupted
 ld (mpLcdCtrl),a

 ret

DrawMap:
 ld hl,Map
 ld de,vRam
 ld bc,lcdWidth*lcdHeight/8	;number of bytes needed to define screen in 1bpp mode
 ldir
 
 ret

CLS:
 ld hl,vRam
 ld bc,lcdWidth*lcdHeight/8	;320 by 240 pixels, 8 pixels per byte, iterate through every byte of mem
CLSLoop:
 ld (hl),$FF				;set 8 pixels at a time
 inc hl
 
 dec bc						;using bc to countdown how many iterations we have left
 ld a,b						;check if zero left
 or c
 jp nz,CLSLoop				;repeat if non-zero amount left
 
 ret

Palette:
.dw $003E					;blue
.dw $FFFF					;white

#include "includes\Map.asm"