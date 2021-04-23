.386
.model flat, stdcall
.stack 4096
include Irvine32.inc
ExitProcess proto, dwExitCode : dword

.data 
array BYTE 1, 2, 3, 4, 5, 6

.code 
main PROC

mov esi,0
mov edi,0
mov esi,OFFSET array
mov edi,OFFSET array + SIZEOF array - TYPE array
mov ecx, LENGTHOF array / 2

shloop:
	mov ah,[esi]
	mov bh,[edi]
	mov [esi],ah
	mov [edi],bh
	add esi,TYPE array
	sub edi,TYPE array
loop shloop

mov esi,OFFSET array
mov ecx,LENGTHOF array
mov ebx,TYPE array
call DumpMem

invoke ExitProcess,0
main endp
end main