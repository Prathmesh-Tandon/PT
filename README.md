# PT

### Toolchain

Execute the following commands to install the toolchain, QEMU and GDB

```bash
sudo apt update -y
sudo apt install -y gcc-riscv64-unknown-elf qemu-system-misc gdb-multiarch
```

### RISC-V Reference Card

Details of the RISC-V 32i Instruction Encoding: [Download the PDF](https://github.com/jameslzhu/riscv-card/releases/download/latest/riscv-card.pdf)

### Tools
1. [RISC-V Instruction Decoder](https://luplab.gitlab.io/rvcodecjs/)
1. [GDB Dashboard](https://github.com/cyrus-and/gdb-dashboard)
1. [Assembler (as) Documentation](https://ftp.gnu.org/old-gnu/Manuals/gas/html_chapter/as_7.html)
    1. [Document for RISC-V Assembler](https://sourceware.org/binutils/docs-2.31/as/RISC_002dV_002dDirectives.html)

### C
1. [ISO Standard](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf)
2. [GNU C Manual](https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.pdf)

### GIT commands
 step 1: After any insertion or any changes -> use git commit -a. 
 step 2: To add any file created -> git add.
 step 3: To update the changes in git repo -> git push.  
 step 4 :To check nothing to commit, working tree clean -> git status.


### Project_1 
1. To understand high level view of function, struct, pointer
        
### Project_2: 
1. To understand asm to bin via qemu and gdb 
          
          step 1: take assembly code (m.s) , internally linker assigned address to each instruction written in assembly (m.ld) and convert into binary (main.elf).

          step 2: load binary in qemu.through tunnel port 1234. ( to exit : ctrl+a then release followed by x).

          step 3: using gdb looked inside state of cpu via gdb.

          step 4: main.elf has binary code + some meta data for gdb, so strip away meta data and just have raw binary ( only instructions) objcopy will convert main.elf to bianry format, then create bin file (main.bin). now instruction can be seen in encoder/decoder by giving the instruction.

          step 5: download gdb tool ,do the automation to convert text to binary using commands directly using MAKEFILE.
          
          step 6: do startqemu and connectgdb using make cmd.

### Project_3:
        assembly program, writing code , debugging in GDB

        step 1: create m_2.s ( assembly file), after start label, give instructions, x3=x3+x1 upto x2 times,
        
        step 2: make compile to create elf, start qemu and connect gdb , all using make automation

        step 3: in gdb, it will show all 32 bit GPRs as per riscv card , values getting stored.

        step 4: close qemu ( ctrl+a followed by x), close gdb (q), make print binary to see all 6 instructions, one can verify it in encoder/decoder also.  

### project_4:
        take C program to assembly and relation ( assembly to object to binary)

        step 1: create c file ( c-asm_1.c) where the function is created which return int value.

        step 2: generate assembly file for c file created in step 1 above ( give make assembly file ), so through gcc, we are stopping at assembly generation before completing compiling part, c-asm_1.s will be generated, where we see directives (starts with dot (.) means hints/commands for assembler), labels, instructions.

        step 3: update m.s assembly file , where we are calling piyush function which is created in c-asm_1.c file, compile it , load qemu and connect gdb. 
                note: function requires stack, hence assign address to stack pointer also in m_1.s, that is mention in next step

        step 4: load the stack pointer register with reasonable value that can be reachable by CPU, and return function using jal (jump and link), make sure to use si instead of ni to jump inside c-asm_1.c instructions in gdb. 
                make piyush -> make startqemu -> make connectgdb

