
;;; All tconst_tbl and the macros and the scheme-object printing procedure
;;; are defined in compiler.s
%include "compiler.s"
%include "prims.s"
section .bss
malloc_pointer:
    resq 1

section .data
const_tbl:
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED

fvar_tbl:
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
dq T_UNDEFINED
global main
not_enough_ram:
    mov rax, 0
	  mov rdi, .exit_malloc
	  call printf

    mov rax, 60       
    mov rdi, -1     ;EXIT_Failure
    syscall
section .data
.exit_malloc: 
    db "Failure! not enough ram!",0 

section .text
main:
    ;; set up the heap
    mov rdi, GB(1)
    call malloc
    cmp rax, 0
    je not_enough_ram
    mov [malloc_pointer], rax

    ;; Set up the dummy activation frame
    ;; The dummy return address is T_UNDEFINED
    ;; (which a is a macro for 0) so that returning
    ;; from the top level (which SHOULD NOT HAPPEN
    ;; AND IS A BUG) will cause a segfault.
    push qword 0
    push qword SOB_EMPTY_ENV

    call code_fragment
    add rsp, 2*8
    ret

code_fragment:
    ;; Set up the primitive stdlib fvars:
    ;; Since the primtive procedures are defined in assembly,
    ;; they are not generated by scheme (define ...) expressions.
    ;; This is where we emulate the missing (define ...) expressions
    ;; for all the primitive procedures.
    push rbp
    mov rbp, rsp

    mov rax, simples_const_tbl
      mov [const_tbl+0], rax
      mov rax, simples_const_tbl + 1
      mov [const_tbl+8], rax
      mov rax, simples_const_tbl + 2
      mov [const_tbl+16], rax
      mov rax, simples_const_tbl + 4
      mov [const_tbl+24], rax
      MAKE_INT (rax,1)
      mov [const_tbl+32], rax
      MAKE_INT (rax,2)
      mov [const_tbl+40], rax
      MAKE_INT (rax,3)
      mov [const_tbl+48], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, box)
    mov [fvar_tbl + WORD_SIZE*0], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, get_car)
    mov [fvar_tbl + WORD_SIZE*1], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, set_car)
    mov [fvar_tbl + WORD_SIZE*2], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, apply)
    mov [fvar_tbl + WORD_SIZE*3], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, get_car)
    mov [fvar_tbl + WORD_SIZE*4], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, get_cdr)
    mov [fvar_tbl + WORD_SIZE*5], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, cons)
    mov [fvar_tbl + WORD_SIZE*6], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, set_car)
    mov [fvar_tbl + WORD_SIZE*7], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, set_cdr)
    mov [fvar_tbl + WORD_SIZE*8], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_boolean)
    mov [fvar_tbl + WORD_SIZE*9], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_float)
    mov [fvar_tbl + WORD_SIZE*10], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_integer)
    mov [fvar_tbl + WORD_SIZE*11], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_pair)
    mov [fvar_tbl + WORD_SIZE*12], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_null)
    mov [fvar_tbl + WORD_SIZE*13], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_char)
    mov [fvar_tbl + WORD_SIZE*14], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_vector)
    mov [fvar_tbl + WORD_SIZE*15], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_string)
    mov [fvar_tbl + WORD_SIZE*16], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_procedure)
    mov [fvar_tbl + WORD_SIZE*17], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_symbol)
    mov [fvar_tbl + WORD_SIZE*18], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, string_length)
    mov [fvar_tbl + WORD_SIZE*19], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, string_ref)
    mov [fvar_tbl + WORD_SIZE*20], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, string_set)
    mov [fvar_tbl + WORD_SIZE*21], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, make_string)
    mov [fvar_tbl + WORD_SIZE*22], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, vector_length)
    mov [fvar_tbl + WORD_SIZE*23], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, vector_ref)
    mov [fvar_tbl + WORD_SIZE*24], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, vector_set)
    mov [fvar_tbl + WORD_SIZE*25], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, make_vector)
    mov [fvar_tbl + WORD_SIZE*26], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, symbol_to_string)
    mov [fvar_tbl + WORD_SIZE*27], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, char_to_integer)
    mov [fvar_tbl + WORD_SIZE*28], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, integer_to_char)
    mov [fvar_tbl + WORD_SIZE*29], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_eq)
    mov [fvar_tbl + WORD_SIZE*30], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_add)
    mov [fvar_tbl + WORD_SIZE*31], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_mul)
    mov [fvar_tbl + WORD_SIZE*32], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_sub)
    mov [fvar_tbl + WORD_SIZE*33], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_div)
    mov [fvar_tbl + WORD_SIZE*34], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_lt)
    mov [fvar_tbl + WORD_SIZE*35], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_equ)
    mov [fvar_tbl + WORD_SIZE*36], rax
love:
		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 32]
    push rax
    push qword 3
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody1)
		jmp doneclousure1
		lambody1:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 1
    mov rax, PVAR(0);get param:x
    leave
    ret
		doneclousure1:
    violation_check rax, T_CLOSURE
    rest_applic
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 32]
    push rax
    push qword 3
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody2)
		jmp doneclousure2
		lambody2:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 1
    mov rax, PVAR(1);get param:y
    leave
    ret
		doneclousure2:
    violation_check rax, T_CLOSURE
    rest_applic
		call write_sob_if_not_void
	ret