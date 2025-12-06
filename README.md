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

basic cmds: git reset --hard, git pull --rebase ( to pull latest changes)

 step 1: After any insertion or any changes -> use git commit -a. 

 step 2: To add any file created -> git add.
 
 step 3: To update the changes in git repo -> git push.  
 
 step 4 :To check nothing to commit, working tree clean -> git status.


### Project_1.c 
1. To understand high level view of function, struct, pointer.

2. Run a c program use -> gcc file.c then ./a.out
        
### Project_2: To understand asm to bin via qemu and gdb 
          
          step 1: take assembly code (m_2.s) , internally linker assigned address to each instruction written in assembly (m.ld) and convert into binary (main.elf).[make Project2]

          step 2: load binary in qemu.through tunnel port 1234. ( to exit : ctrl+a then release followed by x). [make startqemu]

          step 3: using info reg in gdb, we can look inside state of cpu i.e program counter, all registers etc. [make connectgdb] 
          note: download gdb dashboard if its not coming, link is in tools section

          step 4: main.elf has binary code + some meta data for gdb, so strip away meta data and just have raw binary ( only instructions) objcopy will convert main.elf to bianry format, then create bin file (main.bin). now instruction can be seen in encoder/decoder by giving the instruction. [part of make Project2 only, then make printbinary to see instructions]

          step 5: download gdb tool ,do the automation to convert text to binary using commands directly using MAKEFILE.
          
          step 6: do startqemu and connectgdb using make cmd.

### Project_3: assembly program, writing code , debugging in GDB

        step 1: create m_3.s (assembly file), after start label, give instructions, x3=x3+x1 upto x2 times,
        
        step 2: make compile to create elf, start qemu and connect gdb , all using make automation

        step 3: in gdb, it will show all 32 bit GPRs as per riscv card , values getting stored.

        step 4: close qemu ( ctrl+a followed by x), close gdb (q), make print binary to see all 6 instructions, one can verify it in encoder/decoder also.  

### project_4: take C program to assembly and relation ( assembly to object to binary)

        step 1: create c file ( c-asm_4.c) where the function is created which return int value.

        step 2: generate assembly file for C file created in step 1 above. [make Project4], here through gcc, we are stopping at assembly generation before completing compiling part, c-asm_4.s will be generated, where we see directives (starts with dot (.) means hints/commands for assembler), labels, instructions.

        step 3: update m_4.s assembly file , where we are calling piyush function which is created in c-asm_4.c file, compile it [make Project4] , load qemu and connect gdb. 
                note: function requires stack, hence assign address to stack pointer also in m_4.s, that is mention in next step

        step 4: load the stack pointer register with reasonable value that can be reachable by CPU, and return function using jal (jump and link), make sure to use si instead of ni to jump inside c-asm_4.c instructions in gdb. 
                [make Project4 -> make startqemu -> make connectgdb]

### project_5: exploring size of data types

        Step 1: create c-asm_5.c, make assembly to see how it is assigning size of different data types (char,int,float). [make Project5]

        Step 2: floating and double word can be converted from dec to binary. Thus from there we can see how encoding scheme works.

        Step 3: use of const and volatile, create c-asm_5-1.c. define const int variable, and then use of volatile even afte 01 optimisation  then compile the c and asm file.
        [make Project5]

### project_6: native compiling ( gcc ) forward

        Step 1: use of typedef and sizeof() keywords in project6.c.
        Step 2: use of struct & union in project6.c.

### project_7: branching at assembly level
        
        step 1: create project7.c , use if else, switch case effects at assembly level
        step 2: create assembly, run qemu, check via gdb.

### project_8: looping at asm, storage classes/duration using local gcc instead of riscV toolchain

        Step 1: create project8.c, use do while and update make automation
        Step 2: create project8_1.c, use local gcc ,due to usage of printf for auto (prooving auto is local to fn)
        
### project_9: variables and functions, cross compiling, local gcc.
        Step 1: create freestanding where all projects till 8 moved.
        Step 2: create project9.c
        Step 3: implement calculator, project10.c