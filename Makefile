OBJECTS = kasm.o kernel.o system.o string.o screen.o util.o kb.o

OBJECTS	+= netsubsystem.o nettask.o socket.o \
	  transportlayer.o networklayer.o linklayer.o netdevlayer.o arphandler.o \
	  icmphandler.o routecache.o \
	  netconnection.o udpconnection.o \
	  tcpconnection.o retransmissionqueue.o retranstimeoutcalc.o tcprejector.o \
	  netconfig.o ipaddress.o netqueue.o checksumcalculator.o \
	  dnsclient.o ntpclient.o \
	  dhcpclient.o ntpdaemon.o httpdaemon.o tftpdaemon.o

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
	qemu-system-i386 -kernel kernel.bin

kernel.bin: $(OBJECTS)
	ld $(LDFLAGS) $(OBJECTS) -o kernel.bin

%.o: include/%.c kernel.c
	$(CC) $(CFLAGS) $< -o $@
  
%.o: lib/net/%.cpp 
	$(CC) $(CFLAGS) $< -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf *.o  


