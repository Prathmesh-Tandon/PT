Project2: m_2.s
	riscv64-unknown-elf-gcc -g -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_2.s -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

Project3: m_3.s m.ld 
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_3.s -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

Project4: c-asm_4.c m_4.s
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld c-asm_4.c -S
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_4.s c-asm_4.c -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

Project5: c-asm_5.c c-asm_5-1.c
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld c-asm_5.c -S
	riscv64-unknown-elf-gcc -O1 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld c-asm_5-1.c -S
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_4.s c-asm_5-1.c -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

Project7: project7.c m_7.s
	riscv64-unknown-elf-gcc -g -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_7.s project7.c -o main.elf
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld project7.c -S
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

Project8: project8.c m_7.s
	riscv64-unknown-elf-gcc -g -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_7.s project8.c -o main.elf
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld project8.c -S
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin



printbinary: main.bin
	xxd -e -c 4 -g 4 main.bin

startqemu: main.elf
	qemu-system-riscv32 -S -M virt -nographic -bios none -kernel main.elf -gdb tcp::1234

connectgdb: main.elf
	gdb-multiarch main.elf -ex "target remote localhost:1234" -ex "break _start" -ex "continue" -q

clean:
	rm -rf *.out *.bin *.elf *.bmp
