#include "includes\ti84pce.inc"

.assume ADL=1
.org userMem-2
.db tExtTok,tAsm84CeCmp

 call _homeup
 call _ClrScrnFull
 ld hl, Message
 call PrintString
 call _NewLine
 ret
 
PrintString:
 ld a, (hl)
 cp 0
 ret z
 inc hl
 call _PutC
 jr PrintString

Message:
.db "Hello World!",0