target_dir := targets

all: hello_elf repeat_elf clean

clean:
	rm -f *.o




hello_elf: hello_elf.o
	ld -m elf_i386 -s -o $(target_dir)/hello_elf hello_elf.o

hello_elf.o: hello_elf.asm
	nasm -f elf hello_elf.asm



repeat_elf: repeat_elf.o
	ld -m elf_i386 -s -o $(target_dir)/repeat_elf repeat_elf.o

repeat_elf.o: repeat_elf.asm
	nasm -f elf repeat_elf.asm
