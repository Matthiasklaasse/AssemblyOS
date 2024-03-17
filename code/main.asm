org 0x7C00

mov ax, 0x03        ; Set video mode 0x03 (80x25 text mode)
int 0x10            ; BIOS interrupt call to set video mode

mov ah, 0x0C        ; AH = 0x0C: write pixel function
mov al, 0x0F        ; AL = 0x0F: blue color attribute (default background)
mov bh, 0x00        ; BH = 0x00: display page
mov cx, 0x0F        ; CX = 0x0F: height of the box
mov dx, 0x0140      ; DX = 0x0140: starting column and row (80x20 position)

draw_loop:
    mov si, 0x0A    ; SI = 0x0A: width of the box

draw_pixel:
    int 0x10        ; BIOS interrupt call to write pixel
    dec si
    jnz draw_pixel  ; Continue drawing pixels until SI becomes zero

    dec cx          ; Decrease height
    jnz draw_loop   ; Continue drawing rows until CX becomes zero

; Print "Hello, World!"
mov ah, 0x0E
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
mov al, ','
int 0x10
mov al, ' '
int 0x10
mov al, 'W'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10
mov al, '!'
int 0x10

times 510-($-$$) db 0  ; Fill the rest of the boot sector with zeros
dw 0xAA55              ; Boot signature
