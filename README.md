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

