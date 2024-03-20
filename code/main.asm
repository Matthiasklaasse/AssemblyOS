	BITS 16
	text_string db 'This is my cool OS!', 0xd, 0xA
	text_string1 db 'This is my cool line of code!', 0xd, 0xA
	color db 0x0
	
start:
    mov     ax, 0x0012  ; maakt de bios 16-kleur mode
    int     10h

	mov ax, 0x07C0
    add ax, 288 
	mov ss, ax
	mov sp, 4096
	; dit is de stack space vanaf 0x07C0 tot 0x07C0+288 zit de romvoor de bootloader

	mov ax, 0x07C0
	mov ds, ax; veel te moeilijk ben nu al vergeten hoe dit werkte was iets met een stack space LIFO etc.
	; edit: dit blijkt de stack space te zijn hier slaan we variables zoals [color] in op vanaf 0x07C0 tot 288 verder zit dit in de ram


	mov byte [color], 14
	mov si, text_string ;in si drop je de HEX locatie van de 1ste byte je sting
	call print_string	; print_string print de str die in si aangewezen word
	mov byte [color], 1
	mov si, text_string1
	call print_string

	jmp $

print_string:
	mov bl, [color]	;laad de kleur van 0x2048 in bl
	mov ah, 0x0E	    ; ah op 0Eh zetten zet BIOS in text mode

.print_string_repeat:
	lodsb			; lodsb pakt si en gaat 1 byte omhoog in de al register om naar de vogende character van de str te gaan
	cmp al, 0xA     ; kijk of de al 0xA is wat dat is het einde v de str
	int 0x10    	; dan printen we de str
	je .print_string_done		; jmp naar done als het echt het eind is
	jmp .print_string_repeat    ; en jmp weer lekker verder

.print_string_done:
	ret             ; return(naar je oude positie)


	times 510-($-$$) db 0	; maak de code 512 bytes zodat hij prcies in de bootsector past
	dw 0xAA55				; aant einde van de code moeten we 0xAA55 hebben da ziiet biosdit als een bootble drive