piyush: c-asm_1.c m_1.s
	riscv64-unknown-elf-gcc -g -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_1.s c-asm_1.c -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

assembly: c-asm_1.c
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld c-asm_1.c -S

compile: m.s m.ld 
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m_2.s -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin

printbinary: main.bin
	xxd -e -c 4 -g 4 main.bin

startqemu: main.elf
	qemu-system-riscv32 -S -M virt -nographic -bios none -kernel main.elf -gdb tcp::1234

connectgdb: main.elf
	gdb-multiarch main.elf -ex "target remote localhost:1234" -ex "break _start" -ex "continue" -q

clean:
	rm -rf *.out *.bin *.elf 
