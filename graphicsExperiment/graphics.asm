#include "includes\ti84pce.inc"

.assume ADL=1
.org userMem-2
.db tExtTok,tAsm84CeCmp

 call _ClrScrnFull
 
 
 ld hl,vRam
 ld (hl),%00000000
 inc hl
 ld (hl),%11111000
 
 call _GetKey
 
 ret
 