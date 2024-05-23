#include "includes\ti84pce.inc"

.assume ADL=1
.org userMem-2
.db tExtTok,tAsm84CeCmp

 call _GetKey
 
 ld hl,Palette
 ld de,mpLcdPalette
 ld bc,2*2
 ldir
 
 ld a,lcdBpp1
 ld (mpLcdCtrl),a

 ld hl,vRam
 ld bc,320*240/8		;320 by 240 pixels, 8 pixels per byte, iterate through every byte of mem
CLSLoop:
 ld (hl),$FF			;set 8 pixels at a time
 inc hl
 
 dec bc					;using bc to countdown how many iterations we have left
 ld a,b					;check if zero left
 or c
 jp nz,CLSLoop			;repeat if non-zero amount left

 call _GetKey
 
 ld a,lcdBpp16
 ld (mpLcdCtrl),a
 
 ;call _ClrScrnFull
 
 ret
 
Palette:
.dw $0000				;black
.dw $FFFF				;white
