nasm -f elf32 kernel.asm -o kasm.o
gcc  -m32 -c kernel.c -o kc.o -ffreestanding
gcc -m32 -c include/system.c -o obj/system.o
gcc -m32 -c include/string.c -o obj/string.o
gcc -m32 -c include/screen.c -o obj/screen.o
gcc -m32 -c include/util.c     -o obj/util.o
gcc -m32 -c include/kb.c     -o obj/kb.o
ld -m elf_i386 -T link.ld -o iso/boot/kernel.bin kasm.o kc.o obj/system.o obj/string.o obj/screen.o obj/kb.o obj/util.o
qemu-system-i386 -kernel iso/boot/kernel.bin
grub-mkrescue -o myos.iso iso/

read a


