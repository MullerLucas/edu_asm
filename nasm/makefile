target_dir := targets

all: hello_elf repeat_elf renamer_elf starts_elf increment_elf adder_elf even_odder_elf clean

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



renamer_elf: renamer_elf.o
	ld -m elf_i386 -s -o $(target_dir)/renamer_elf renamer_elf.o

renamer_elf.o: renamer_elf.asm
	nasm -f elf renamer_elf.asm



starts_elf: starts_elf.o
	ld -m elf_i386 -s -o $(target_dir)/starts_elf starts_elf.o

starts_elf.o: starts_elf.asm
	nasm -f elf starts_elf.asm



increment_elf: increment_elf.o
	ld -m elf_i386 -s -o $(target_dir)/increment_elf increment_elf.o

increment_elf.o: increment_elf.asm
	nasm -f elf increment_elf.asm


adder_elf: adder_elf.o
	ld -m elf_i386 -s -o $(target_dir)/adder_elf adder_elf.o

adder_elf.o: adder_elf.asm
	nasm -f elf adder_elf.asm


even_odder_elf: even_odder_elf.o
	ld -m elf_i386 -s -o $(target_dir)/even_odder_elf even_odder_elf.o

even_odder_elf.o: even_odder_elf.asm
	nasm -f elf even_odder_elf.asm
