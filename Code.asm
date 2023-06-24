;;;;;;;;;;;;;;;;;;;;
; Hammad Khalid    ;
; PERFECT NO CHECK ;
;;;;;;;;;;;;;;;;;;;;
.model small
.stack 100h
.data
var db 0
digit db 0
perfect_num db 0
MSG1 db 'Enter Number:','$'
MSG2 db 'PERFECT',10,13,'$'
MSG3 db 'NOT PERFECT',10,13,'$'
comma db ',','$'
count db 0
Space db 10,13,'$'
.code
start:
JMP MAIN
FIND_PERFECT proc
    push bp
	mov bp,sp
	; PUSHING ALL VALUES TO STACK IN ORDER SAVE THESE VALUES IF TO BE USED NEXT ....
	push ax
	push bx
	push cx
	push dx
	push si
	push di
    ; LOOP FOR FINDING FACTORIAL ...
	factorial:
		mov cl,digit
		dec cl
		mov bl,1
		LOOP1:
			mov ax,0
			mov al,digit
			div bl
			cmp ah,0
			; CALLING DISPLAYING LOOP..
			je DISPLAY
			inc bl
			cmp bl,digit
			je check
		loop LOOP1
    ; FOR DISPLAYING ON SCREEN... 
	DISPLAY:
		mov bh,0
		push bx
		mov dl,bl
		add dl,48
		mov ah,02
		int 21h
		mov dx,offset comma
		mov ah,09
		int 21h
		inc bl
		inc count
		jmp LOOP1
	check:
	; FOR DISPLAYING THE SPACE ON SCREEN ..
		mov dx,offset Space
		mov ah,09
		int 21h
    ; SETTING THE VALUE OF CX TO BE USED IN PERFECT LOOP...  
		mov cl,count
		PERFECT:
			pop dx
			add perfect_num,dl
		loop PERFECT
		mov al,perfect_num
        mov ah,digit
		cmp al,ah
		je print1
		jmp print2
		print1:
		; DISPLAYING MESSAGE IF NUMBER IS PERFECT....
			mov dx,offset MSG2
			mov ah,09
			int 21h
			;JUMPING TO EXIT AFTER DISPLAYING..
			jmp EXIT
		print2:
		; DISPLAYING MESSAGE IF NUMBER IS NOT PERFECT...
			mov dx,offset MSG3
			mov ah,09
			int 21h
		EXIT:
		;POPPING OUT ALL UNUSED REGISTER VALUES WHICH WERE PUSHED IN START...
		pop ax
	    pop bx
	    pop cx
	    pop dx
	    pop si
	    pop di
		pop bp
		;RETURNING TO MAIN PROC...
			ret
FIND_PERFECT endp
; MAIN PROCEDURE....
MAIN PROC
mov ax,@data
mov ds,ax
; DISPLAYING THE MESSAGE 1..
mov dx,offset MSG1
mov ah,09
int 21h
; SETTING THE VALUES OF REGISTER
mov ax,0
mov bl,10
; MOVING VALUE IN CX FOR COUNT REGISTER...
mov cl,3
; TAKING INPUT FROM THE USER TO GET THE VALUE...
INPUT:
	mov ah,01h
	int 21h
	cmp al,13
	je call_function
	sub al,30H
	add al,var
	; STORING MULTI-DIGIT NUMBER IN DIGIT VARIABLE.....
	mov digit,al 		 
	mul bl
	mov var,al   
	loop INPUT
; CALLING FUNCTION TO FIND IF THE NUMBER IS A PERFECT NUMBER OR NOT...
call_function:
   call FIND_PERFECT
   ;PROGRAM TERMINATES OVER HERE....
   mov ah,4ch
   int 21h
MAIN ENDP
end start

