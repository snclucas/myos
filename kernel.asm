bits	32
section		.text
	align	4
	dd	0x1BADB002
	dd	0x00
	dd	- (0x1BADB002+0x00)

global start
extern kmain		; this is c code (kernel.c)
start:
	cli		; clears the interrupts (we are in protected mode, 32 bit)
	call kmain	; calls the kernel kmain function, send processor to execute form kmain
	hlt		; halt the CPU
