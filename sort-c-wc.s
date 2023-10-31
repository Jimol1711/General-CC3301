	.file	"sort-c-wc.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	contarPalabras
	.type	contarPalabras, @function
contarPalabras:
	mv	a5,a0
	lbu	a4,0(a0)
	beq	a4,zero,.L5
	li	a3,0
	li	a0,0
	li	a2,32
	li	a1,0
	li	a6,1
	j	.L4
.L6:
	mv	a3,a1
.L3:
	addi	a5,a5,1
	lbu	a4,0(a5)
	beq	a4,zero,.L8
.L4:
	beq	a4,a2,.L6
	bne	a3,zero,.L3
	addi	a0,a0,1
	mv	a3,a6
	j	.L3
.L8:
	ret
.L5:
	li	a0,0
	ret
	.size	contarPalabras, .-contarPalabras
	.align	2
	.globl	sort
	.type	sort, @function
sort:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	slli	s4,a1,2
	addi	s4,s4,-4
	add	s4,a0,s4
	bgeu	a0,s4,.L9
	mv	s5,a0
	mv	s0,a0
	j	.L13
.L11:
	sw	s3,0(s0)
	sw	s2,4(s0)
	mv	s0,s5
.L13:
	lw	s2,0(s0)
	mv	a0,s2
	call	contarPalabras
	mv	s1,a0
	lw	s3,4(s0)
	mv	a0,s3
	call	contarPalabras
	bgt	s1,a0,.L11
	addi	s0,s0,4
	bgtu	s4,s0,.L13
.L9:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jr	ra
	.size	sort, .-sort
	.ident	"GCC: (GNU) 11.1.0"
