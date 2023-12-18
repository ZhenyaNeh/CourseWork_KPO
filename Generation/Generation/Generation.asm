.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outnum PROTO : DWORD

 outstr PROTO : DWORD

 strcopy PROTO : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

.const
	message db 'Division by zerro error', 0
		newline byte 13, 10, 0
		LTRL1 sdword 12
		LTRL2 sdword 2
.data
		temp sdword ?
		buffer byte 256 dup(0)
		maina sdword 0
		mainb sdword 0
		mainres sdword 0
.code

;------------- MAIN --------------
main PROC
push LTRL1

pop ebx
mov maina, ebx

push LTRL2
push LTRL2
pop ebx
pop eax
sub eax, ebx
push eax

pop ebx
mov mainb, ebx

push maina
push mainb
pop ebx
cmp ebx, 0
je division_by_zerro_error
pop eax
cdq
idiv ebx
push eax

pop ebx
mov mainres, ebx


push mainres
call outnum

push offset newline
call outstr


;-----If division by zero occurs -----
jmp end_of_code
division_by_zerro_error:
push offset message
call outstr
push offset newline
call outstr
end_of_code:

push 0
call ExitProcess
main ENDP
end main
