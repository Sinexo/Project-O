gdt_start:
    dw 0x0000       ; Limite (0)
    dw 0x0000       ; Base (0)
    db 0x00         ; Propriétés (non utilisé)
    db 0x9A         ; Code segment (exécutable, accessible)
    db 0x00         ; Propriétés (non utilisé)
    dw 0xFFFF       ; Limite (16 Mo)
    dw 0x0000       ; Base (0)

gdt_code:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

gw_data:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; Taille de la GDT
    dw gdt_start                ; Adresse de la GDT

lgdt [gdt_descriptor]