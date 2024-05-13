#include "includes\ti84pce.inc"

.assume ADL=1
.org userMem-2
.db tExtTok,tAsm84CeCmp

 call _homeup
 call _ClrScrnFull
 ld a, 72
 call _PutC
 call _NewLine
 ret
 