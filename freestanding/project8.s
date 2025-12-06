	.file	"project8.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	pratham
	.type	pratham, @function
pratham:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	li	a5,8
	sw	a5,-20(s0)
	li	a5,2
	sw	a5,-24(s0)
.L4:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a4,-20(s0)
	li	a5,2
	beq	a4,a5,.L6
	lw	a5,-20(s0)
	addi	a5,a5,-3
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	li	a5,1
	bgt	a4,a5,.L4
	j	.L3
.L6:
	nop
.L3:
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	pratham, .-pratham
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
