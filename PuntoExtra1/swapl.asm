	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.intel_syntax noprefix
	.globl	_swaplong                       ## -- Begin function swaplong
	.p2align	4, 0x90

## Es igual a swap normal pero en lugar de trabajar con valores de 32 bits, trabaja con valores de 64 bits. 
## @swaplong
## intercambia los valores de dos punteros a enteros largos
## se asume que los punteros apuntan a elementos adyacentes de un stack
## la operación de intercambio se realiza mediante registros temporales
.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi   ## rdi contiene el primer puntero
	mov	qword ptr [rbp - 16], rsi  ## rsi contiene el segundo puntero
	mov	rax, qword ptr [rbp - 8]   ## se copia el primer valor en rax
	mov	rax, qword ptr [rax]      ## se obtiene el valor apuntado por el primer puntero
	mov	qword ptr [rbp - 24], rax  ## se almacena en memoria en una variable temporal
	mov	rax, qword ptr [rbp - 16]  ## se copia el segundo valor en rax
	mov	rax, qword ptr [rax]      ## se obtiene el valor apuntado por el segundo puntero
	mov	qword ptr [rbp - 32], rax  ## se almacena en memoria en otra variable temporal
	mov	rcx, qword ptr [rbp - 32]  ## se mueve el segundo valor al registro de contador rcx
	mov	rax, qword ptr [rbp - 8]   ## se copia el primer puntero en rax
	mov	qword ptr [rax], rcx       ## se guarda el segundo valor en la dirección apuntada por el primer puntero
	mov	rcx, qword ptr [rbp - 24]  ## se mueve el primer valor al registro de contador rcx
	mov	rax, qword ptr [rbp - 16]  ## se copia el segundo puntero en rax
	mov	qword ptr [rax], rcx       ## se guarda el primer valor en la dirección apuntada por el segundo puntero
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
