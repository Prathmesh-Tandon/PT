# PT
###Project_1: 
        to understand high level view of function, struct, pointer
        
###Project_2: 
        to understand asm to bin via qemu and gdb 
          
          step 1: take assembly code (m.s) , internally linker assigned address to each instruction written in assembly (m.ld) and convert into binary (main.elf).

          step 2: load binary in qemu.through tunnel port 1234. ( to exit : ctrl+a then release followed by x).

          step 3: using gdb looked inside state of cpu via gdb.

          step 4: main.elf has binary code + some meta data for gdb, so strip away meta data and just have raw binary ( only instructions) objcopy will convert main.elf to bianry format, then create bin file (main.bin). now instruction can be seen in encoder/decoder by giving the instruction.

          step 5: download gdb tool ,do the automation to convert text to binary using commands directly using MAKEFILE.
          
          step 6: do startqemu and connectgdb using make cmd.

###Project_3:
        assembly program, writing code , debugging in GDB

        step 1: create m_2.s ( assembly file), after start label, give instructions, x3=x3+x1 upto x2 times,
        
        step 2: make compile to create elf, start qemu and connect gdb , all using make automation

        step 3: in gdb, it will show all 32 bit GPRs as per riscv card , values getting stored.

        step 4: close qemu ( ctrl+a followed by x), close gdb (q), make print binary to see all 6 instructions, one can verify it in encoder/decoder also.  


