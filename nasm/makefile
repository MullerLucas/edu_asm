target_dir := targets

hello_elf: hello_elf.o
	ld -m elf_i386 -s -o $(target_dir)/hello_elf hello.o

hello_elf.o: hello.asm
	nasm -f elf hello.asm

clean:
	rm -f *.o
