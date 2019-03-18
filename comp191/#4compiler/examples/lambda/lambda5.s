
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
	dq T_UNDEFINED
	dq T_UNDEFINED
symbols_tbl:
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

jmp sympass0
	sym0:
		db 98,111,120, 0
	sympass0:
	mov qword[symbols_tbl+0], sym0
  jmp sympass1
	sym1:
		db 117,110,98,111,120, 0
	sympass1:
	mov qword[symbols_tbl+1], sym1
  jmp sympass2
	sym2:
		db 115,101,116,45,98,111,120,33, 0
	sympass2:
	mov qword[symbols_tbl+2], sym2
  jmp sympass3
	sym3:
		db 97,112,112,108,121, 0
	sympass3:
	mov qword[symbols_tbl+3], sym3
  jmp sympass4
	sym4:
		db 99,97,114, 0
	sympass4:
	mov qword[symbols_tbl+4], sym4
  jmp sympass5
	sym5:
		db 99,100,114, 0
	sympass5:
	mov qword[symbols_tbl+5], sym5
  jmp sympass6
	sym6:
		db 99,111,110,115, 0
	sympass6:
	mov qword[symbols_tbl+6], sym6
  jmp sympass7
	sym7:
		db 115,101,116,45,99,97,114,33, 0
	sympass7:
	mov qword[symbols_tbl+7], sym7
  jmp sympass8
	sym8:
		db 115,101,116,45,99,100,114,33, 0
	sympass8:
	mov qword[symbols_tbl+8], sym8
  jmp sympass9
	sym9:
		db 98,111,111,108,101,97,110,63, 0
	sympass9:
	mov qword[symbols_tbl+9], sym9
  jmp sympass10
	sym10:
		db 102,108,111,97,116,63, 0
	sympass10:
	mov qword[symbols_tbl+10], sym10
  jmp sympass11
	sym11:
		db 105,110,116,101,103,101,114,63, 0
	sympass11:
	mov qword[symbols_tbl+11], sym11
  jmp sympass12
	sym12:
		db 112,97,105,114,63, 0
	sympass12:
	mov qword[symbols_tbl+12], sym12
  jmp sympass13
	sym13:
		db 110,117,108,108,63, 0
	sympass13:
	mov qword[symbols_tbl+13], sym13
  jmp sympass14
	sym14:
		db 99,104,97,114,63, 0
	sympass14:
	mov qword[symbols_tbl+14], sym14
  jmp sympass15
	sym15:
		db 118,101,99,116,111,114,63, 0
	sympass15:
	mov qword[symbols_tbl+15], sym15
  jmp sympass16
	sym16:
		db 115,116,114,105,110,103,63, 0
	sympass16:
	mov qword[symbols_tbl+16], sym16
  jmp sympass17
	sym17:
		db 112,114,111,99,101,100,117,114,101,63, 0
	sympass17:
	mov qword[symbols_tbl+17], sym17
  jmp sympass18
	sym18:
		db 115,121,109,98,111,108,63, 0
	sympass18:
	mov qword[symbols_tbl+18], sym18
  jmp sympass19
	sym19:
		db 115,116,114,105,110,103,45,108,101,110,103,116,104, 0
	sympass19:
	mov qword[symbols_tbl+19], sym19
  jmp sympass20
	sym20:
		db 115,116,114,105,110,103,45,114,101,102, 0
	sympass20:
	mov qword[symbols_tbl+20], sym20
  jmp sympass21
	sym21:
		db 115,116,114,105,110,103,45,115,101,116,33, 0
	sympass21:
	mov qword[symbols_tbl+21], sym21
  jmp sympass22
	sym22:
		db 109,97,107,101,45,115,116,114,105,110,103, 0
	sympass22:
	mov qword[symbols_tbl+22], sym22
  jmp sympass23
	sym23:
		db 118,101,99,116,111,114,45,108,101,110,103,116,104, 0
	sympass23:
	mov qword[symbols_tbl+23], sym23
  jmp sympass24
	sym24:
		db 118,101,99,116,111,114,45,114,101,102, 0
	sympass24:
	mov qword[symbols_tbl+24], sym24
  jmp sympass25
	sym25:
		db 118,101,99,116,111,114,45,115,101,116,33, 0
	sympass25:
	mov qword[symbols_tbl+25], sym25
  jmp sympass26
	sym26:
		db 109,97,107,101,45,118,101,99,116,111,114, 0
	sympass26:
	mov qword[symbols_tbl+26], sym26
  jmp sympass27
	sym27:
		db 115,121,109,98,111,108,45,62,115,116,114,105,110,103, 0
	sympass27:
	mov qword[symbols_tbl+27], sym27
  jmp sympass28
	sym28:
		db 99,104,97,114,45,62,105,110,116,101,103,101,114, 0
	sympass28:
	mov qword[symbols_tbl+28], sym28
  jmp sympass29
	sym29:
		db 105,110,116,101,103,101,114,45,62,99,104,97,114, 0
	sympass29:
	mov qword[symbols_tbl+29], sym29
  jmp sympass30
	sym30:
		db 101,113,63, 0
	sympass30:
	mov qword[symbols_tbl+30], sym30
  jmp sympass31
	sym31:
		db 43, 0
	sympass31:
	mov qword[symbols_tbl+31], sym31
  jmp sympass32
	sym32:
		db 42, 0
	sympass32:
	mov qword[symbols_tbl+32], sym32
  jmp sympass33
	sym33:
		db 45, 0
	sympass33:
	mov qword[symbols_tbl+33], sym33
  jmp sympass34
	sym34:
		db 47, 0
	sympass34:
	mov qword[symbols_tbl+34], sym34
  jmp sympass35
	sym35:
		db 60, 0
	sympass35:
	mov qword[symbols_tbl+35], sym35
  jmp sympass36
	sym36:
		db 61, 0
	sympass36:
	mov qword[symbols_tbl+36], sym36
  jmp sympass37
	sym37:
		db 99,111,117,110,116,101,114, 0
	sympass37:
	mov qword[symbols_tbl+37], sym37
  jmp sympass38
	sym38:
		db 99,111,117,110,116, 0
	sympass38:
	mov qword[symbols_tbl+38], sym38
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
      MAKE_INT (rax,0)
      mov [const_tbl+40], rax
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
		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody1)
		jmp doneclousure1
		lambody1:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody2)
		jmp doneclousure2
		lambody2:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 32]
    push rax
			GET_BOUND rax,0,0;get bound:init
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*31];get fvar:+
		IS_UNDEF fvar_tbl + WORD_SIZE*31
    violation_check rax, T_CLOSURE
    rest_applic
    EXIT_APPLIC
    SET_BOUND rbx, rax,0,0;setting bound:init
    mov rax, SOB_VOID_ADDRESS
		GET_BOUND rax,0,0;get bound:init;seq ret
    leave
    ret
		doneclousure2:
    leave
    ret
		doneclousure1:
    mov qword [fvar_tbl + WORD_SIZE*38], rax;setting fvar:count
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 40]
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*38];get fvar:count
		IS_UNDEF fvar_tbl + WORD_SIZE*38
    violation_check rax, T_CLOSURE
    rest_applic
    EXIT_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:counter
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		mov rax, qword [fvar_tbl + WORD_SIZE*38];get fvar:count
		IS_UNDEF fvar_tbl + WORD_SIZE*38
		call write_sob_if_not_void

		mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:counter
		IS_UNDEF fvar_tbl + WORD_SIZE*37
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
    push qword 0
    mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:counter
		IS_UNDEF fvar_tbl + WORD_SIZE*37
    violation_check rax, T_CLOSURE
    rest_applic
    EXIT_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
    push qword 0
    mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:counter
		IS_UNDEF fvar_tbl + WORD_SIZE*37
    violation_check rax, T_CLOSURE
    rest_applic
    EXIT_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
    push qword 0
    mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:counter
		IS_UNDEF fvar_tbl + WORD_SIZE*37
    violation_check rax, T_CLOSURE
    rest_applic
    EXIT_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
    push qword 0
    mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:counter
		IS_UNDEF fvar_tbl + WORD_SIZE*37
    violation_check rax, T_CLOSURE
    rest_applic
    EXIT_APPLIC
		call write_sob_if_not_void
	ret