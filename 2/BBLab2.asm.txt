;Name: Kavon Cacho
;RedID: 822794135
;Class: TTH 8am
.386
.model flat, stdcall
.stack 4096
include Irvine32.inc
ExitProcess proto, dwExitCode : dword

.data 
array DWORD 30 DUP(?)	;array with 30 unknown elements

.code 
main PROC
	
	call fibonacci	;call the fibonacci procedure
	invoke ExitProcess,0

main endp

fibonacci PROC
	
	mov array, 1	;initialize the first element of the array with 1
	mov array+4, 1	;initialize the second element of the array with 1
	mov array+8, 2	;initialize the third element of the array with the sum, 2
	mov edx, OFFSET array	;move the first element into edx
	mov edi, OFFSET array + 4	;move the second element into edi
	mov esi, OFFSET array + 8	;move the third element into the pointer register
	mov ebp, OFFSET array + 12	;move the fourth (uninitialized) element into another pointer register
	mov ecx, 27	;set loop counter to the remainder 27 instead of 30 because the first 3 calculations are already done
	
	L1:
		mov eax, [edi]	;move the address of edi into eax
		mov ebx, [esi]	;move the address of esi into ebx
		add ebx,eax	;add eax and ebx
		add [ebp],ebx	;add the sum to the ebp
		add ebp,4	;increment ebp by 4
		add esi,4	;increment esi by 4
		add edi,4	;increment edi by 4
		
	loop L1

	mov esi,OFFSET array			
	mov ecx,LENGTHOF array			
	mov ebx,TYPE array				
	call DumpMem	;DumpMem stuff
	
	ret
fibonacci ENDP

end main