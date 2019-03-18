
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
	dq T_UNDEFINED
	dq T_UNDEFINED
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
	mov qword[symbols_tbl+0*WORD_SIZE], sym0
  jmp sympass1
	sym1:
		db 117,110,98,111,120, 0
	sympass1:
	mov qword[symbols_tbl+1*WORD_SIZE], sym1
  jmp sympass2
	sym2:
		db 115,101,116,45,98,111,120,33, 0
	sympass2:
	mov qword[symbols_tbl+2*WORD_SIZE], sym2
  jmp sympass3
	sym3:
		db 97,112,112,108,121, 0
	sympass3:
	mov qword[symbols_tbl+3*WORD_SIZE], sym3
  jmp sympass4
	sym4:
		db 99,97,114, 0
	sympass4:
	mov qword[symbols_tbl+4*WORD_SIZE], sym4
  jmp sympass5
	sym5:
		db 99,100,114, 0
	sympass5:
	mov qword[symbols_tbl+5*WORD_SIZE], sym5
  jmp sympass6
	sym6:
		db 99,111,110,115, 0
	sympass6:
	mov qword[symbols_tbl+6*WORD_SIZE], sym6
  jmp sympass7
	sym7:
		db 115,101,116,45,99,97,114,33, 0
	sympass7:
	mov qword[symbols_tbl+7*WORD_SIZE], sym7
  jmp sympass8
	sym8:
		db 115,101,116,45,99,100,114,33, 0
	sympass8:
	mov qword[symbols_tbl+8*WORD_SIZE], sym8
  jmp sympass9
	sym9:
		db 98,111,111,108,101,97,110,63, 0
	sympass9:
	mov qword[symbols_tbl+9*WORD_SIZE], sym9
  jmp sympass10
	sym10:
		db 102,108,111,97,116,63, 0
	sympass10:
	mov qword[symbols_tbl+10*WORD_SIZE], sym10
  jmp sympass11
	sym11:
		db 105,110,116,101,103,101,114,63, 0
	sympass11:
	mov qword[symbols_tbl+11*WORD_SIZE], sym11
  jmp sympass12
	sym12:
		db 112,97,105,114,63, 0
	sympass12:
	mov qword[symbols_tbl+12*WORD_SIZE], sym12
  jmp sympass13
	sym13:
		db 110,117,108,108,63, 0
	sympass13:
	mov qword[symbols_tbl+13*WORD_SIZE], sym13
  jmp sympass14
	sym14:
		db 99,104,97,114,63, 0
	sympass14:
	mov qword[symbols_tbl+14*WORD_SIZE], sym14
  jmp sympass15
	sym15:
		db 118,101,99,116,111,114,63, 0
	sympass15:
	mov qword[symbols_tbl+15*WORD_SIZE], sym15
  jmp sympass16
	sym16:
		db 115,116,114,105,110,103,63, 0
	sympass16:
	mov qword[symbols_tbl+16*WORD_SIZE], sym16
  jmp sympass17
	sym17:
		db 112,114,111,99,101,100,117,114,101,63, 0
	sympass17:
	mov qword[symbols_tbl+17*WORD_SIZE], sym17
  jmp sympass18
	sym18:
		db 115,121,109,98,111,108,63, 0
	sympass18:
	mov qword[symbols_tbl+18*WORD_SIZE], sym18
  jmp sympass19
	sym19:
		db 115,116,114,105,110,103,45,108,101,110,103,116,104, 0
	sympass19:
	mov qword[symbols_tbl+19*WORD_SIZE], sym19
  jmp sympass20
	sym20:
		db 115,116,114,105,110,103,45,114,101,102, 0
	sympass20:
	mov qword[symbols_tbl+20*WORD_SIZE], sym20
  jmp sympass21
	sym21:
		db 115,116,114,105,110,103,45,115,101,116,33, 0
	sympass21:
	mov qword[symbols_tbl+21*WORD_SIZE], sym21
  jmp sympass22
	sym22:
		db 109,97,107,101,45,115,116,114,105,110,103, 0
	sympass22:
	mov qword[symbols_tbl+22*WORD_SIZE], sym22
  jmp sympass23
	sym23:
		db 118,101,99,116,111,114,45,108,101,110,103,116,104, 0
	sympass23:
	mov qword[symbols_tbl+23*WORD_SIZE], sym23
  jmp sympass24
	sym24:
		db 118,101,99,116,111,114,45,114,101,102, 0
	sympass24:
	mov qword[symbols_tbl+24*WORD_SIZE], sym24
  jmp sympass25
	sym25:
		db 118,101,99,116,111,114,45,115,101,116,33, 0
	sympass25:
	mov qword[symbols_tbl+25*WORD_SIZE], sym25
  jmp sympass26
	sym26:
		db 109,97,107,101,45,118,101,99,116,111,114, 0
	sympass26:
	mov qword[symbols_tbl+26*WORD_SIZE], sym26
  jmp sympass27
	sym27:
		db 115,121,109,98,111,108,45,62,115,116,114,105,110,103, 0
	sympass27:
	mov qword[symbols_tbl+27*WORD_SIZE], sym27
  jmp sympass28
	sym28:
		db 99,104,97,114,45,62,105,110,116,101,103,101,114, 0
	sympass28:
	mov qword[symbols_tbl+28*WORD_SIZE], sym28
  jmp sympass29
	sym29:
		db 105,110,116,101,103,101,114,45,62,99,104,97,114, 0
	sympass29:
	mov qword[symbols_tbl+29*WORD_SIZE], sym29
  jmp sympass30
	sym30:
		db 101,113,63, 0
	sympass30:
	mov qword[symbols_tbl+30*WORD_SIZE], sym30
  jmp sympass31
	sym31:
		db 43, 0
	sympass31:
	mov qword[symbols_tbl+31*WORD_SIZE], sym31
  jmp sympass32
	sym32:
		db 42, 0
	sympass32:
	mov qword[symbols_tbl+32*WORD_SIZE], sym32
  jmp sympass33
	sym33:
		db 45, 0
	sympass33:
	mov qword[symbols_tbl+33*WORD_SIZE], sym33
  jmp sympass34
	sym34:
		db 47, 0
	sympass34:
	mov qword[symbols_tbl+34*WORD_SIZE], sym34
  jmp sympass35
	sym35:
		db 60, 0
	sympass35:
	mov qword[symbols_tbl+35*WORD_SIZE], sym35
  jmp sympass36
	sym36:
		db 61, 0
	sympass36:
	mov qword[symbols_tbl+36*WORD_SIZE], sym36
  jmp sympass37
	sym37:
		db 120, 0
	sympass37:
	mov qword[symbols_tbl+37*WORD_SIZE], sym37
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
      MAKE_INT (rax,0)
      mov [const_tbl+56], rax
      MAKE_INT (rax,4)
      mov [const_tbl+64], rax
      MAKE_INT (rax,5)
      mov [const_tbl+72], rax
      MAKE_INT (rax,6)
      mov [const_tbl+80], rax
      MAKE_INT (rax,7)
      mov [const_tbl+88], rax
      MAKE_INT (rax,8)
      mov [const_tbl+96], rax
      MAKE_INT (rax,9)
      mov [const_tbl+104], rax
      MAKE_INT (rax,10)
      mov [const_tbl+112], rax
      MAKE_INT (rax,11)
      mov [const_tbl+120], rax
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
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    mov rbx, fvar_tbl + WORD_SIZE*31
       mov rax, qword [rbx];get fvar:+
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure1:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 32]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 32]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody2)
		jmp doneclousure2
		lambody2:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody3)
		jmp doneclousure3
		lambody3:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    GET_BOUND rax,0,0;get bound:x
    leave
    ret
		doneclousure3:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 0
    REST_APPLICTP
    leave
    ret
		doneclousure2:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 32]
    push rax
			mov rax, [const_tbl + 40]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 32]
    push rax
			mov rax, [const_tbl + 40]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody4)
		jmp doneclousure4
		lambody4:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody5)
		jmp doneclousure5
		lambody5:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    mov rax, PVAR(0);get param:x
    leave
    ret
		doneclousure5:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure4:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 40]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 40]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody6)
		jmp doneclousure6
		lambody6:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 56]
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody7)
		jmp doneclousure7
		lambody7:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    GET_BOUND rax,0,0;get bound:x
    leave
    ret
		doneclousure7:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure6:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody8)
		jmp doneclousure8
		lambody8:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 72]
    push rax
			mov rax, [const_tbl + 72]
    push rax
			mov rax, [const_tbl + 72]
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody9)
		jmp doneclousure9
		lambody9:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    mov rax, PVAR(2);get param:z
    leave
    ret
		doneclousure9:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 3
    REST_APPLICTP
    leave
    ret
		doneclousure8:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody10)
		jmp doneclousure10
		lambody10:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 80]
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody11)
		jmp doneclousure11
		lambody11:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    mov rax, PVAR(2);get param:z
    leave
    ret
		doneclousure11:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 4
    REST_APPLICTP
    leave
    ret
		doneclousure10:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody12)
		jmp doneclousure12
		lambody12:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
			mov rax, [const_tbl + 88]
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody13)
		jmp doneclousure13
		lambody13:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 8
    mov rax, PVAR(2);get param:z
    leave
    ret
		doneclousure13:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 9
    REST_APPLICTP
    leave
    ret
		doneclousure12:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 80]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 3
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody14)
		jmp doneclousure14
		lambody14:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
			mov rax, [const_tbl + 56]
    push rax
    
    mov rbx, fvar_tbl + WORD_SIZE*31
       mov rax, qword [rbx];get fvar:+
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure14:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 32]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 96]
    push rax
    push qword 4
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody15)
		jmp doneclousure15
		lambody15:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, [const_tbl + 56]
    push rax
    
    mov rbx, fvar_tbl + WORD_SIZE*31
       mov rax, qword [rbx];get fvar:+
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure15:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 32]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 104]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 4
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody16)
		jmp doneclousure16
		lambody16:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    push SOB_NIL_ADDRESS
			mov rax, PVAR(2);get param:z
    push rax
			mov rax, [const_tbl + 56]
    push rax
    
    mov rbx, fvar_tbl + WORD_SIZE*31
       mov rax, qword [rbx];get fvar:+
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure16:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 32]
    push rax
			mov rax, [const_tbl + 112]
    push rax
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 4
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody17)
		jmp doneclousure17
		lambody17:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    push SOB_NIL_ADDRESS
			mov rax, PVAR(3);get param:w
    push rax
			mov rax, [const_tbl + 56]
    push rax
    
    mov rbx, fvar_tbl + WORD_SIZE*31
       mov rax, qword [rbx];get fvar:+
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure17:
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:x
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, [const_tbl + 120]
    push rax
			mov rax, [const_tbl + 40]
    push rax
			mov rax, [const_tbl + 48]
    push rax
			mov rax, [const_tbl + 64]
    push rax
    push qword 4
    mov rbx, fvar_tbl + WORD_SIZE*37
       mov rax, qword [rbx];get fvar:x
		IS_UNDEF rbx
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void
	ret