OBJECTS = kasm.o kernel.o system.o string.o screen.o util.o kb.o
CC = gcc
AS = nasm
CFLAGS = -c -m32 -pedantic -ffreestanding -nostdinc -nostdlib -fno-stack-protector -Wall -Werror -Wextra -nodefaultlibs -nostartfiles
LDFLAGS = -m elf_i386 -T link.ld
ASFLAGS = -f elf32

all: kernel.bin

iso: kernel.bin
	cp kernel.bin iso/boot/kernel.bin
	grub-mkrescue -o myos.iso iso/

run: kernel.bin
	qemu-system-i386 -kernel iso/boot/kernel.bin

kernel.bin: $(OBJECTS)
	ld $(LDFLAGS) $(OBJECTS) -o kernel.bin

%.o: include/%.c kernel.c
	$(CC) $(CFLAGS) $< -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf *.o  

#nasm -f elf32 kernel.asm -o kasm.o
#gcc $(CFLAGS) -c kernel.c -o kernel.o
#gcc $(CFLAGS) -c include/system.c -o system.o
#gcc $(CFLAGS) -c include/string.c -o string.o
#gcc $(CFLAGS) -c include/screen.c -o screen.o
#gcc $(CFLAGS) -c include/util.c   -o util.o
#gcc $(CFLAGS) -c include/kb.c     -o kb.o
#ld $(LDFLAGS) $(OBJECTS) -o iso/boot/kernel.bin
#qemu-system-i386 -kernel iso/boot/kernel.bin
#grub-mkrescue -o myos.iso iso/

#read a


