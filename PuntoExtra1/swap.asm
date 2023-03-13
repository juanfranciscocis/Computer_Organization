	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.intel_syntax noprefix
	.globl	_swap                           ## -- Begin function swap
	.p2align	4, 0x90
## @swap
## intercambia los valores de dos punteros enteros
## se asume que los punteros apuntan a elementos adyacentes de un stack
## la operación de intercambio se realiza mediante registros temporales
_swap:                                      ## @swap
.cfi_startproc  ## Marca el inicio de la función y proporciona información de depuración al compilador.

## %bb.0:

## Procedimiento estándar de inicio de función. Define el marco del stack y la información de depuración.
	push	rbp  
	.cfi_def_cfa_offset 16 
	.cfi_offset rbp, -16

## Configura el puntero base del stack.
	mov	rbp, rsp 						
	.cfi_def_cfa_register rbp	

## Copia los valores de los parámetros pasados en el stack en variables locales.
	mov	qword ptr [rbp - 8], rdi 		
	mov	qword ptr [rbp - 16], rsi   

## Carga el valor apuntado por el primer parámetro en eax y lo guarda en una variable local en el stack.
	mov	rax, qword ptr [rbp - 8]
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 20], eax

## Carga el valor apuntado por el segundo parámetro en eax y lo guarda en una variable local en el stack.
	mov	rax, qword ptr [rbp - 16]
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 24], eax

## Intercambia los valores de las dos ubicaciones de memoria.
	mov	ecx, dword ptr [rbp - 24]   ## Carga el valor almacenado en la segunda ubicación en el registro ecx.
	mov	rax, qword ptr [rbp - 8]    ## Carga la dirección de memoria almacenada en el primer parámetro en rax.
	mov	dword ptr [rax], ecx       ## Almacena el valor de ecx en la primera ubicación de memoria, intercambiando los valores.

## Intercambia los valores de las dos ubicaciones de memoria.
	mov	ecx, dword ptr [rbp - 20]   ## Carga el valor almacenado en la primera ubicación en el registro ecx.
	mov	rax, qword ptr [rbp - 16]   ## Carga la dirección de memoria almacenada en el segundo parámetro en rax.
	mov	dword ptr [rax], ecx       ## Almacena el valor de ecx en la segunda ubicación de memoria, intercambiando los valores.

## Procedimiento estándar de finalización de función. Restaura el puntero base y la información de depuración.
	pop	rbp
	ret
	.cfi_endproc                    ## Marca el final de la función y proporciona información de depuración.

                                        ## -- End function
.subsections_via_symbols
