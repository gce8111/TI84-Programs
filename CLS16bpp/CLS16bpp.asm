#include "includes\ti84pce.inc"

.assume ADL=1
.org userMem-2
.db tExtTok,tAsm84CeCmp

 call _GetKey
 
 call CLS 

 call _GetKey
 
 call _WHomeUp
 
 ret
 
CLS:
 ld hl,vRam
 ld de,%1111111111111111 	;fill screen color (white)
 ld bc,320*240/2			;halve total number of pixels so we can use 16 bit loop
 
CLSLoop:
 ld (hl),de					;set first pixel to fill color
 inc hl						;go 2 pixels forward since we're in 16bpp mode
 inc hl
 
 ld (hl),de					;do 2 pixels per loop, again so we can use 16 bit loop
 inc hl
 inc hl
 
 dec bc						;using bc to countdown how many iterations we have left
 ld a,b						;check if zero left
 or c
 jp nz,CLSLoop				;repeat if non-zero amount left
 ret						;otherwise return
 