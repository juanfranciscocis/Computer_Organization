	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.intel_syntax noprefix
	.globl	_abs_diff                       ## -- Begin function abs_diff
	.p2align	4, 0x90
## @abs_diff: esta función toma dos enteros y devuelve el valor absoluto de su diferencia
_abs_diff:
	.cfi_startproc 		   # Indica el inicio del procedimiento y actualiza la información de depuración
## %bb.0:
	push	rbp                # Reserva espacio en el stack para rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16    # Crea una entrada en el registro de información de depuración para rbp
	mov	rbp, rsp            # Establece rbp como el nuevo puntero del stack
	.cfi_def_cfa_register rbp   # Crea una entrada en el registro de información de depuración para rbp
	mov	dword ptr [rbp - 4], edi  # Guarda el primer argumento en [rbp - 4]
	mov	dword ptr [rbp - 8], esi  # Guarda el segundo argumento en [rbp - 8]
	mov	eax, dword ptr [rbp - 4]   # Mueve el primer argumento a eax
	sub	eax, dword ptr [rbp - 8]   # Resta el segundo argumento de eax
	mov	dword ptr [rbp - 12], eax  # Guarda el resultado en [rbp - 12]
	cmp	dword ptr [rbp - 12], 0    # Compara [rbp - 12] con 0
	jge	LBB0_2                   # Si es mayor o igual a 0, salta a LBB0_2
## %bb.1:
	xor	eax, eax            # Establece eax en 0
	sub	eax, dword ptr [rbp - 12]  # Resta [rbp - 12] de eax
	mov	dword ptr [rbp - 12], eax  # Guarda el resultado en [rbp - 12]
LBB0_2:
	mov	eax, dword ptr [rbp - 12]   # Mueve [rbp - 12] a eax
	pop	rbp                # Libera el espacio del stack reservado para rbp
	ret                      # Devuelve el valor de eax
	.cfi_endproc               # Indica el final del procedimiento y actualiza la información de depuración

                                        ## -- End function
.subsections_via_symbols
