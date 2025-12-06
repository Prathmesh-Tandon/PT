	.file	"c-asm_5.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	piyush
	.type	piyush, @function
piyush:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	li	a5,65
	sb	a5,-17(s0)
	li	a5,1234
	sw	a5,-24(s0)
	lui	a5,%hi(.LC0)
	lw	a5,%lo(.LC0)(a5)
	sw	a5,-28(s0)
	li	a5,4096
	addi	a5,a5,-1874
	sh	a5,-30(s0)
	li	a5,1892925440
	addi	a5,a5,1752
	sw	a5,-36(s0)
	lui	a5,%hi(.LC1)
	lw	a4,%lo(.LC1)(a5)
	lw	a5,%lo(.LC1+4)(a5)
	sw	a4,-48(s0)
	sw	a5,-44(s0)
	li	a5,0
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	piyush, .-piyush
	.section	.rodata
	.align	2
.LC0:
	.word	1095052034
	.align	3
.LC1:
	.word	-1779662649
	.word	1093224200
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
