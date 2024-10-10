; bootloader.asm
[BITS 16]         
[ORG 0x7C00]

section .text
start:
    mov ax, 0x0003
    int 0x10       

    mov si, hello ;
.next_char:
    lodsb           
    cmp al, 0       
    je .done        
    mov ah, 0x0E    
    int 0x10       
    jmp .next_char  
.done:
    hlt             

section .data
hello db 'Hello, World!', 0

times 510-($-$$) db 0 ; Remplir avec des zéros jusqu'à 510 octets
dw 0xAA55               ; Signature du bootloader
