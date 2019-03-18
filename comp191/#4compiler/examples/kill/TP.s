
;;; All tconst_tbl and the macros and the scheme-object printing procedure
;;; are defined in compiler.s
%include "compiler.s"
%include "prims.s"
section .bss
malloc_pointer:
    resq 1

section .data
const_tbl:
  MAKE_BYTE_LIT(T_VOID)
	MAKE_BYTE_LIT(T_NIL)
	MAKE_LITERAL_BOOL(0)
	MAKE_LITERAL_BOOL(1)
	MAKE_LITERAL_STRING (8)
    
  db 119,104,97,116,101,118,101,114

	MAKE_LITERAL_SYMBOL (const_tbl+6)
	MAKE_LITERAL_STRING (51)
    
  db 69,114,114,111,114,58,32,97,112,112,108,121,32,97,114,103,108,105,115,116,32,104,97,118,101,32,116,111,32,98,101,32,102,105,110,105,115,104,101,100,32,119,105,116,104,32,108,105,115,116,33

	MAKE_LITERAL_INT (0)
	MAKE_LITERAL_INT (1)
	MAKE_LITERAL_STRING (57)
    
  db 116,104,105,115,32,115,104,111,117,108,100,32,98,101,32,97,110,32,101,114,114,111,114,44,32,98,117,116,32,121,111,117,32,100,111,110,39,116,32,115,117,112,112,111,114,116,32,101,120,99,101,112,116,105,111,110,115

	MAKE_LITERAL_CHAR (0)
	MAKE_LITERAL_INT (2)
	MAKE_LITERAL_INT (3)
	MAKE_LITERAL_INT (4)
	MAKE_LITERAL_INT (5)
	MAKE_LITERAL_INT (6)
	MAKE_LITERAL_INT (7)
	MAKE_LITERAL_INT (8)
	MAKE_LITERAL_PAIR (const_tbl+232, const_tbl+1)
	MAKE_LITERAL_PAIR (const_tbl+223, const_tbl+241)
	MAKE_LITERAL_PAIR (const_tbl+214, const_tbl+258)
	MAKE_LITERAL_PAIR (const_tbl+205, const_tbl+275)
	MAKE_LITERAL_PAIR (const_tbl+196, const_tbl+292)
	MAKE_LITERAL_PAIR (const_tbl+187, const_tbl+309)
	MAKE_LITERAL_PAIR (const_tbl+178, const_tbl+326)
	MAKE_LITERAL_PAIR (const_tbl+101, const_tbl+343)
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
  sym0:
    db 101,118,101,110,63, 0
	sym1:
    db 97,112,112,108,121, 0
	sym2:
    db 99,97,114, 0
	sym3:
    db 99,100,114, 0
	sym4:
    db 99,111,110,115, 0
	sym5:
    db 115,101,116,45,99,97,114,33, 0
	sym6:
    db 115,101,116,45,99,100,114,33, 0
	sym7:
    db 98,111,111,108,101,97,110,63, 0
	sym8:
    db 102,108,111,97,116,63, 0
	sym9:
    db 105,110,116,101,103,101,114,63, 0
	sym10:
    db 112,97,105,114,63, 0
	sym11:
    db 110,117,108,108,63, 0
	sym12:
    db 99,104,97,114,63, 0
	sym13:
    db 118,101,99,116,111,114,63, 0
	sym14:
    db 115,116,114,105,110,103,63, 0
	sym15:
    db 112,114,111,99,101,100,117,114,101,63, 0
	sym16:
    db 115,121,109,98,111,108,63, 0
	sym17:
    db 115,116,114,105,110,103,45,108,101,110,103,116,104, 0
	sym18:
    db 115,116,114,105,110,103,45,114,101,102, 0
	sym19:
    db 115,116,114,105,110,103,45,115,101,116,33, 0
	sym20:
    db 109,97,107,101,45,115,116,114,105,110,103, 0
	sym21:
    db 118,101,99,116,111,114,45,108,101,110,103,116,104, 0
	sym22:
    db 118,101,99,116,111,114,45,114,101,102, 0
	sym23:
    db 118,101,99,116,111,114,45,115,101,116,33, 0
	sym24:
    db 109,97,107,101,45,118,101,99,116,111,114, 0
	sym25:
    db 115,121,109,98,111,108,45,62,115,116,114,105,110,103, 0
	sym26:
    db 99,104,97,114,45,62,105,110,116,101,103,101,114, 0
	sym27:
    db 105,110,116,101,103,101,114,45,62,99,104,97,114, 0
	sym28:
    db 101,113,63, 0
	sym29:
    db 43, 0
	sym30:
    db 42, 0
	sym31:
    db 45, 0
	sym32:
    db 47, 0
	sym33:
    db 60, 0
	sym34:
    db 61, 0
	sym35:
    db 101,120,112,108,111,100,101, 0
	sym36:
    db 107,105,108,108,45,116,112, 0
	sym37:
    db 108,115,116, 0
	sym38:
    db 102,105,110, 0
	sym39:
    db 101,113,117,97,108,63, 0
	sym40:
    db 110,111,116, 0
	sym41:
    db 110,101,103,97,116,105,118,101,63, 0
	sym42:
    db 112,111,115,105,116,105,118,101,63, 0
	sym43:
    db 62, 0
	sym44:
    db 115,101,116,45,98,111,120,33, 0
	sym45:
    db 117,110,98,111,120, 0
	sym46:
    db 98,111,120, 0
	sym47:
    db 108,101,110,103,116,104, 0
	sym48:
    db 118,101,99,116,111,114, 0
	sym49:
    db 108,105,115,116,45,62,118,101,99,116,111,114, 0
	sym50:
    db 118,101,99,116,111,114,45,62,108,105,115,116, 0
	sym51:
    db 109,97,112, 0
	sym52:
    db 110,117,109,98,101,114,63, 0
	sym53:
    db 108,105,115,116,63, 0
	sym54:
    db 122,101,114,111,63, 0
	sym55:
    db 97,112,112,101,110,100, 0
	sym56:
    db 114,101,118,101,114,115,101, 0
	sym57:
    db 108,105,115,116, 0
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
wanted_ram:
  dq GB(4)
malloc_end:
  dq 0

section .text
main:
    ;; set up the heap
    mov rdi, qword [wanted_ram]
    call malloc
    cmp rax, 0
    je not_enough_ram
    mov [malloc_pointer], rax
    add rax, qword [wanted_ram]
    mov [malloc_end],   rax

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

    MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, even_val)
    mov [fvar_tbl + WORD_SIZE*0], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, apply)
    mov [fvar_tbl + WORD_SIZE*1], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, get_car)
    mov [fvar_tbl + WORD_SIZE*2], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, get_cdr)
    mov [fvar_tbl + WORD_SIZE*3], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, cons)
    mov [fvar_tbl + WORD_SIZE*4], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, set_car)
    mov [fvar_tbl + WORD_SIZE*5], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, set_cdr)
    mov [fvar_tbl + WORD_SIZE*6], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_boolean)
    mov [fvar_tbl + WORD_SIZE*7], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_float)
    mov [fvar_tbl + WORD_SIZE*8], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_integer)
    mov [fvar_tbl + WORD_SIZE*9], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_pair)
    mov [fvar_tbl + WORD_SIZE*10], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_null)
    mov [fvar_tbl + WORD_SIZE*11], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_char)
    mov [fvar_tbl + WORD_SIZE*12], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_vector)
    mov [fvar_tbl + WORD_SIZE*13], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_string)
    mov [fvar_tbl + WORD_SIZE*14], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_procedure)
    mov [fvar_tbl + WORD_SIZE*15], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_symbol)
    mov [fvar_tbl + WORD_SIZE*16], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, string_length)
    mov [fvar_tbl + WORD_SIZE*17], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, string_ref)
    mov [fvar_tbl + WORD_SIZE*18], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, string_set)
    mov [fvar_tbl + WORD_SIZE*19], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, make_string)
    mov [fvar_tbl + WORD_SIZE*20], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, vector_length)
    mov [fvar_tbl + WORD_SIZE*21], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, vector_ref)
    mov [fvar_tbl + WORD_SIZE*22], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, vector_set)
    mov [fvar_tbl + WORD_SIZE*23], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, make_vector)
    mov [fvar_tbl + WORD_SIZE*24], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, symbol_to_string)
    mov [fvar_tbl + WORD_SIZE*25], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, char_to_integer)
    mov [fvar_tbl + WORD_SIZE*26], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, integer_to_char)
    mov [fvar_tbl + WORD_SIZE*27], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, is_eq)
    mov [fvar_tbl + WORD_SIZE*28], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_add)
    mov [fvar_tbl + WORD_SIZE*29], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_mul)
    mov [fvar_tbl + WORD_SIZE*30], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_sub)
    mov [fvar_tbl + WORD_SIZE*31], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_div)
    mov [fvar_tbl + WORD_SIZE*32], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_lt)
    mov [fvar_tbl + WORD_SIZE*33], rax
      MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, bin_equ)
    mov [fvar_tbl + WORD_SIZE*34], rax
love:
		;;Define of :set-box!

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*5];get fvar:set-car!
		IS_UNDEF sym5
    push rax
    push qword 1
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
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:val
    push rax
			mov rax, PVAR(0);get param:box
    push rax
    
    GET_BOUND rax,0,0;get bound:set-car!
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure2:
    leave
    ret
		doneclousure1:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*44], rax;setting fvar:set-box!
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :unbox

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody3)
		jmp doneclousure3
		lambody3:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody4)
		jmp doneclousure4
		lambody4:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:box
    push rax
    
    GET_BOUND rax,0,0;get bound:car
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure4:
    leave
    ret
		doneclousure3:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*45], rax;setting fvar:unbox
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :box

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*4];get fvar:cons
		IS_UNDEF sym4
    push rax
    push qword 1
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
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody6)
		jmp doneclousure6
		lambody6:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 1
    push rax
			mov rax, PVAR(0);get param:to-box
    push rax
    
    GET_BOUND rax,0,0;get bound:cons
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure6:
    leave
    ret
		doneclousure5:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*46], rax;setting fvar:box
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :list

    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody7)
		jmp doneclousure7
		lambody7:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    mov rax, PVAR(0);get param:x
    leave
    ret
		doneclousure7:
    mov qword [fvar_tbl + WORD_SIZE*57], rax;setting fvar:list
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :append

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*4];get fvar:cons
		IS_UNDEF sym4
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody8)
		jmp doneclousure8
		lambody8:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody9)
		jmp doneclousure9
		lambody9:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:args
    push rax
			mov rax, const_tbl + 1
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody10)
		jmp doneclousure10
		lambody10:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:f
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:f
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody11)
		jmp doneclousure11
		lambody11:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:args
    push rax
    push qword 1
    GET_BOUND rax,2,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif1
    mov rax, PVAR(0);get param:ls
    jmp doneif1
    dif1:
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody12)
		jmp doneclousure12
		lambody12:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:g
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:g
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody13)
		jmp doneclousure13
		lambody13:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,4,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif2
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,1,1;get bound:args
    push rax
    push qword 1
    GET_BOUND rax,4,2;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,1,1;get bound:args
    push rax
    push qword 1
    GET_BOUND rax,4,1;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,2,0;get bound:f
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif2
    dif2:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,4,2;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:g
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,4,1;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,4,3;get bound:cons
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif2:
    leave
    ret
		doneclousure13:
    push rax
			mov rax, PVAR(0);get param:g
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:g
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC;seq ret;seq ret
    leave
    ret
		doneclousure12:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    doneif1:
    leave
    ret
		doneclousure11:
    push rax
			mov rax, PVAR(0);get param:f
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:f
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC;seq ret;seq ret
    leave
    ret
		doneclousure10:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure9:
    leave
    ret
		doneclousure8:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*55], rax;setting fvar:append
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :reverse

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*55];get fvar:append
		IS_UNDEF sym55
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*57];get fvar:list
		IS_UNDEF sym57
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*4];get fvar:cons
		IS_UNDEF sym4
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 9
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody14)
		jmp doneclousure14
		lambody14:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 9
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody15)
		jmp doneclousure15
		lambody15:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:rev-loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:rev-loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody16)
		jmp doneclousure16
		lambody16:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif3
    mov rax, PVAR(0);get param:x
    jmp doneif3
    dif3:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:list
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:rev-loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,1,5;get bound:append
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif3:
    leave
    ret
		doneclousure16:
    push rax
			mov rax, PVAR(0);get param:rev-loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:rev-loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC;seq ret;seq ret
    leave
    ret
		doneclousure15:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure14:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*56], rax;setting fvar:reverse
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :apply

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*10];get fvar:pair?
		IS_UNDEF sym10
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*55];get fvar:append
		IS_UNDEF sym55
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*56];get fvar:reverse
		IS_UNDEF sym56
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*1];get fvar:apply
		IS_UNDEF sym1
    push rax
    push qword 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody17)
		jmp doneclousure17
		lambody17:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody18)
		jmp doneclousure18
		lambody18:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,0,5;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody19)
		jmp doneclousure19
		lambody19:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:lst
    push rax
    push qword 1
    GET_BOUND rax,1,6;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:reverse
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody20)
		jmp doneclousure20
		lambody20:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,5;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody21)
		jmp doneclousure21
		lambody21:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ending_lst
    push rax
    push qword 1
    GET_BOUND rax,3,1;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor1
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ending_lst
    push rax
    push qword 1
    GET_BOUND rax,3,4;get bound:pair?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor1
		mov rax, const_tbl + 2
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor1    
    doneor1:
    cmp rax, SOB_FALSE_ADDRESS
    je dif4
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:lst
    push rax
    push qword 1
    GET_BOUND rax,3,6;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ending_lst
    push rax
    push qword 1
    GET_BOUND rax,3,2;get bound:reverse
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,3,3;get bound:append
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			GET_BOUND rax,1,0;get bound:f
    push rax
    
    GET_BOUND rax,3,0;get bound:apply
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif4
    dif4:
    mov rax, const_tbl + 32
    doneif4:
    leave
    ret
		doneclousure21:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure20:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure19:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure18:
    leave
    ret
		doneclousure17:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*1], rax;setting fvar:apply
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :zero?

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody22)
		jmp doneclousure22
		lambody22:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody23)
		jmp doneclousure23
		lambody23:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,0;get bound:=
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure23:
    leave
    ret
		doneclousure22:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*54], rax;setting fvar:zero?
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :list?

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*10];get fvar:pair?
		IS_UNDEF sym10
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 3
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody24)
		jmp doneclousure24
		lambody24:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody25)
		jmp doneclousure25
		lambody25:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,0,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor2
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,0,1;get bound:pair?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif5
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,0,2;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*53];get fvar:list?
		IS_UNDEF sym53
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    jmp doneif5
    dif5:
    mov rax, const_tbl + 2
    doneif5:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor2
		mov rax, const_tbl + 2
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor2    
    doneor2:
    leave
    ret
		doneclousure25:
    leave
    ret
		doneclousure24:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*53], rax;setting fvar:list?
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :length

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*29];get fvar:+
		IS_UNDEF sym29
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*10];get fvar:pair?
		IS_UNDEF sym10
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 4
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody26)
		jmp doneclousure26
		lambody26:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody27)
		jmp doneclousure27
		lambody27:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody28)
		jmp doneclousure28
		lambody28:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(1), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		
    mov rax, const_tbl + 92
    mov PVAR(0), rax;setting param:count
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody29)
		jmp doneclousure29
		lambody29:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif6
    mov rax, PVAR(1);get param:count
    jmp doneif6
    dif6:
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,1;get bound:pair?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif7
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:count
    push rax
			mov rax, const_tbl + 101
    push rax
    push qword 2
    GET_BOUND rax,2,3;get bound:+
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,2;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,1;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif7
    dif7:
    mov rax, const_tbl + 110
    doneif7:
    doneif6:
    leave
    ret
		doneclousure29:
    push rax
			mov rax, PVAR(1);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			GET_BOUND rax,0,0;get bound:x
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP;seq ret;seq ret
    leave
    ret
		doneclousure28:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure27:
    leave
    ret
		doneclousure26:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*47], rax;setting fvar:length
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :make-string

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*47];get fvar:length
		IS_UNDEF sym47
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*20];get fvar:make-string
		IS_UNDEF sym20
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 5
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody30)
		jmp doneclousure30
		lambody30:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 5
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody31)
		jmp doneclousure31
		lambody31:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,0,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif8
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 176
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,1;get bound:make-string
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif8
    dif8:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,0,4;get bound:length
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, const_tbl + 101
    push rax
    push qword 2
    GET_BOUND rax,0,3;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif9
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,0,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,1;get bound:make-string
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif9
    dif9:
    mov rax, const_tbl + 110
    doneif9:
    doneif8:
    leave
    ret
		doneclousure31:
    leave
    ret
		doneclousure30:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*20], rax;setting fvar:make-string
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :make-vector

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*24];get fvar:make-vector
		IS_UNDEF sym24
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*47];get fvar:length
		IS_UNDEF sym47
    push rax
    push qword 4
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody32)
		jmp doneclousure32
		lambody32:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody33)
		jmp doneclousure33
		lambody33:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,0,3;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif10
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,1;get bound:make-vector
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif10
    dif10:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,0,0;get bound:length
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, const_tbl + 101
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif11
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,0,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,1;get bound:make-vector
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif11
    dif11:
    mov rax, const_tbl + 110
    doneif11:
    doneif10:
    leave
    ret
		doneclousure33:
    leave
    ret
		doneclousure32:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*24], rax;setting fvar:make-vector
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :not

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*28];get fvar:eq?
		IS_UNDEF sym28
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody34)
		jmp doneclousure34
		lambody34:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody35)
		jmp doneclousure35
		lambody35:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 4
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    push qword 2
    GET_BOUND rax,0,0;get bound:eq?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif12
    mov rax, const_tbl + 2
    jmp doneif12
    dif12:
    mov rax, const_tbl + 4
    doneif12:
    leave
    ret
		doneclousure35:
    leave
    ret
		doneclousure34:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*40], rax;setting fvar:not
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :number?

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*9];get fvar:integer?
		IS_UNDEF sym9
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*8];get fvar:float?
		IS_UNDEF sym8
    push rax
    push qword 2
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody36)
		jmp doneclousure36
		lambody36:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody37)
		jmp doneclousure37
		lambody37:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,0,0;get bound:float?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor3
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,1;get bound:integer?
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor3
		mov rax, const_tbl + 2
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor3    
    doneor3:
    leave
    ret
		doneclousure37:
    leave
    ret
		doneclousure36:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*52], rax;setting fvar:number?
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :map

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*1];get fvar:apply
		IS_UNDEF sym1
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*4];get fvar:cons
		IS_UNDEF sym4
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 8
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody38)
		jmp doneclousure38
		lambody38:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 8
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody39)
		jmp doneclousure39
		lambody39:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(2);get param:more
    push rax
    push qword 1
    GET_BOUND rax,0,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif13
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:ls
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody43)
		jmp doneclousure43
		lambody43:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody44)
		jmp doneclousure44
		lambody44:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:map1
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:map1
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody45)
		jmp doneclousure45
		lambody45:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,3,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif15
    mov rax, const_tbl + 1
    jmp doneif15
    dif15:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,3,4;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:map1
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,3,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    GET_BOUND rax,2,0;get bound:f
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,3,1;get bound:cons
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif15:
    leave
    ret
		doneclousure45:
    push rax
			mov rax, PVAR(0);get param:map1
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:ls
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:map1
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP;seq ret;seq ret
    leave
    ret
		doneclousure44:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure43:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    jmp doneif13
    dif13:
    push SOB_NIL_ADDRESS
			mov rax, PVAR(2);get param:more
    push rax
			mov rax, PVAR(1);get param:ls
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody40)
		jmp doneclousure40
		lambody40:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody41)
		jmp doneclousure41
		lambody41:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:map-more
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:map-more
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody42)
		jmp doneclousure42
		lambody42:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,3,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif14
    mov rax, const_tbl + 1
    jmp doneif14
    dif14:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:more
    push rax
			GET_BOUND rax,3,4;get bound:cdr
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*51];get fvar:map
		IS_UNDEF sym51
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,3,4;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:map-more
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:more
    push rax
			GET_BOUND rax,3,3;get bound:car
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*51];get fvar:map
		IS_UNDEF sym51
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:ls
    push rax
    push qword 1
    GET_BOUND rax,3,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			GET_BOUND rax,2,0;get bound:f
    push rax
    push qword 3
    GET_BOUND rax,3,2;get bound:apply
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,3,1;get bound:cons
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif14:
    leave
    ret
		doneclousure42:
    push rax
			mov rax, PVAR(0);get param:map-more
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			GET_BOUND rax,0,1;get bound:more
    push rax
			GET_BOUND rax,0,0;get bound:ls
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:map-more
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP;seq ret;seq ret
    leave
    ret
		doneclousure41:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure40:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif13:
    leave
    ret
		doneclousure39:
    leave
    ret
		doneclousure38:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*51], rax;setting fvar:map
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :list->vector

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*29];get fvar:+
		IS_UNDEF sym29
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*47];get fvar:length
		IS_UNDEF sym47
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*24];get fvar:make-vector
		IS_UNDEF sym24
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*10];get fvar:pair?
		IS_UNDEF sym10
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 10
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody46)
		jmp doneclousure46
		lambody46:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 10
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody47)
		jmp doneclousure47
		lambody47:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody48)
		jmp doneclousure48
		lambody48:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody49)
		jmp doneclousure49
		lambody49:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif16
    mov rax, PVAR(1);get param:vec
    jmp doneif16
    dif16:
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,1;get bound:pair?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif17
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(2);get param:count
    push rax
			mov rax, const_tbl + 101
    push rax
    push qword 2
    GET_BOUND rax,2,6;get bound:+
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(2);get param:count
    push rax
			mov rax, PVAR(1);get param:vec
    push rax
    push qword 3
    mov rax, qword [fvar_tbl + WORD_SIZE*23];get fvar:vector-set!
		IS_UNDEF sym23
    violation_check rax, T_CLOSURE
      REST_APPLIC
		mov rax, PVAR(1);get param:vec;seq ret
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,2,3;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 3
    REST_APPLICTP
    jmp doneif17
    dif17:
    mov rax, const_tbl + 110
    doneif17:
    doneif16:
    leave
    ret
		doneclousure49:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:lst
    push rax
    push qword 1
    GET_BOUND rax,1,5;get bound:length
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:make-vector
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			GET_BOUND rax,0,0;get bound:lst
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 3
    REST_APPLICTP;seq ret;seq ret
    leave
    ret
		doneclousure48:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure47:
    leave
    ret
		doneclousure46:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*49], rax;setting fvar:list->vector
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :vector->list

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*31];get fvar:-
		IS_UNDEF sym31
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*21];get fvar:vector-length
		IS_UNDEF sym21
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*4];get fvar:cons
		IS_UNDEF sym4
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*22];get fvar:vector-ref
		IS_UNDEF sym22
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*33];get fvar:<
		IS_UNDEF sym33
    push rax
    push qword 8
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody50)
		jmp doneclousure50
		lambody50:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 8
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody51)
		jmp doneclousure51
		lambody51:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody52)
		jmp doneclousure52
		lambody52:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody53)
		jmp doneclousure53
		lambody53:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 3
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			mov rax, PVAR(2);get param:count
    push rax
    push qword 2
    GET_BOUND rax,2,0;get bound:<
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif18
    mov rax, PVAR(1);get param:lst
    jmp doneif18
    dif18:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, const_tbl + 101
    push rax
			mov rax, PVAR(2);get param:count
    push rax
    push qword 2
    GET_BOUND rax,2,4;get bound:-
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(2);get param:count
    push rax
			mov rax, PVAR(0);get param:vec
    push rax
    push qword 2
    GET_BOUND rax,2,1;get bound:vector-ref
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,2,2;get bound:cons
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:vec
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 3
    REST_APPLICTP
    doneif18:
    leave
    ret
		doneclousure53:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, const_tbl + 101
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:vec
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:vector-length
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,4;get bound:-
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, const_tbl + 1
    push rax
			GET_BOUND rax,0,0;get bound:vec
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 3
    REST_APPLICTP;seq ret;seq ret
    leave
    ret
		doneclousure52:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure51:
    leave
    ret
		doneclousure50:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*50], rax;setting fvar:vector->list
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :vector

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*49];get fvar:list->vector
		IS_UNDEF sym49
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody54)
		jmp doneclousure54
		lambody54:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody55)
		jmp doneclousure55
		lambody55:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,0;get bound:list->vector
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure55:
    leave
    ret
		doneclousure54:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*48], rax;setting fvar:vector
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :+

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*1];get fvar:apply
		IS_UNDEF sym1
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*29];get fvar:+
		IS_UNDEF sym29
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 8
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody56)
		jmp doneclousure56
		lambody56:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 8
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody57)
		jmp doneclousure57
		lambody57:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody58)
		jmp doneclousure58
		lambody58:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif19
    mov rax, const_tbl + 92
    jmp doneif19
    dif19:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,3;get bound:apply
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,1,1;get bound:+
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif19:
    leave
    ret
		doneclousure58:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC;seq ret;seq ret
    leave
    ret
		doneclousure57:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure56:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*29], rax;setting fvar:+
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :*

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*1];get fvar:apply
		IS_UNDEF sym1
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*30];get fvar:*
		IS_UNDEF sym30
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 8
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody59)
		jmp doneclousure59
		lambody59:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 8
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody60)
		jmp doneclousure60
		lambody60:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody61)
		jmp doneclousure61
		lambody61:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif20
    mov rax, const_tbl + 101
    jmp doneif20
    dif20:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,3;get bound:apply
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,1,1;get bound:*
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif20:
    leave
    ret
		doneclousure61:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC;seq ret;seq ret
    leave
    ret
		doneclousure60:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure59:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*30], rax;setting fvar:*
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :-

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*47];get fvar:length
		IS_UNDEF sym47
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*1];get fvar:apply
		IS_UNDEF sym1
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*29];get fvar:+
		IS_UNDEF sym29
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*31];get fvar:-
		IS_UNDEF sym31
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 10
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody62)
		jmp doneclousure62
		lambody62:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 10
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody63)
		jmp doneclousure63
		lambody63:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody64)
		jmp doneclousure64
		lambody64:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif21
    mov rax, const_tbl + 92
    jmp doneif21
    dif21:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,6;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,4;get bound:apply
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,1,1;get bound:-
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif21:
    leave
    ret
		doneclousure64:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody65)
		jmp doneclousure65
		lambody65:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif22
    mov rax, const_tbl + 110
    jmp doneif22
    dif22:
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 101
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,1,5;get bound:length
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif23
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, const_tbl + 92
    push rax
    
    GET_BOUND rax,1,1;get bound:-
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif23
    dif23:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,1,6;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,4;get bound:apply
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,1,2;get bound:+
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif23:
    doneif22:
    leave
    ret
		doneclousure65:;seq ret;seq ret
    leave
    ret
		doneclousure63:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure62:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*31], rax;setting fvar:-
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :/

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*47];get fvar:length
		IS_UNDEF sym47
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*1];get fvar:apply
		IS_UNDEF sym1
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*30];get fvar:*
		IS_UNDEF sym30
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*32];get fvar:/
		IS_UNDEF sym32
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody66)
		jmp doneclousure66
		lambody66:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody67)
		jmp doneclousure67
		lambody67:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,0,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif24
    mov rax, const_tbl + 110
    jmp doneif24
    dif24:
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 101
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,0,5;get bound:length
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif25
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,0,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, const_tbl + 101
    push rax
    
    GET_BOUND rax,0,1;get bound:/
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif25
    dif25:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,0,6;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			GET_BOUND rax,0,2;get bound:*
    push rax
    push qword 2
    GET_BOUND rax,0,4;get bound:apply
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:num
    push rax
    push qword 1
    GET_BOUND rax,0,3;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    GET_BOUND rax,0,1;get bound:/
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif25:
    doneif24:
    leave
    ret
		doneclousure67:
    leave
    ret
		doneclousure66:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*32], rax;setting fvar:/
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :=

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody68)
		jmp doneclousure68
		lambody68:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 7
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody69)
		jmp doneclousure69
		lambody69:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody70)
		jmp doneclousure70
		lambody70:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif26
    mov rax, const_tbl + 4
    jmp doneif26
    dif26:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:element
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif27
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif27
    dif27:
    mov rax, const_tbl + 2
    doneif27:
    doneif26:
    leave
    ret
		doneclousure70:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody71)
		jmp doneclousure71
		lambody71:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif28
    mov rax, const_tbl + 110
    jmp doneif28
    dif28:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif28:
    leave
    ret
		doneclousure71:;seq ret;seq ret
    leave
    ret
		doneclousure69:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure68:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*34], rax;setting fvar:=
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :<

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*33];get fvar:<
		IS_UNDEF sym33
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 7
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody72)
		jmp doneclousure72
		lambody72:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 7
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody73)
		jmp doneclousure73
		lambody73:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody74)
		jmp doneclousure74
		lambody74:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif29
    mov rax, const_tbl + 4
    jmp doneif29
    dif29:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:element
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:<
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif30
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif30
    dif30:
    mov rax, const_tbl + 2
    doneif30:
    doneif29:
    leave
    ret
		doneclousure74:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody75)
		jmp doneclousure75
		lambody75:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif31
    mov rax, const_tbl + 110
    jmp doneif31
    dif31:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif31:
    leave
    ret
		doneclousure75:;seq ret;seq ret
    leave
    ret
		doneclousure73:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure72:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*33], rax;setting fvar:<
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :>

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*40];get fvar:not
		IS_UNDEF sym40
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*33];get fvar:<
		IS_UNDEF sym33
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    push rax
    push qword 9
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody76)
		jmp doneclousure76
		lambody76:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 9
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody77)
		jmp doneclousure77
		lambody77:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody78)
		jmp doneclousure78
		lambody78:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif32
    mov rax, const_tbl + 4
    jmp doneif32
    dif32:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:element
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:<
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor4
		push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(0);get param:element
    push rax
    push qword 2
    GET_BOUND rax,1,2;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor4
		mov rax, const_tbl + 2
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor4    
    doneor4:
    push rax
    push qword 1
    GET_BOUND rax,1,3;get bound:not
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif33
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,5;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    jmp doneif33
    dif33:
    mov rax, const_tbl + 2
    doneif33:
    doneif32:
    leave
    ret
		doneclousure78:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody79)
		jmp doneclousure79
		lambody79:
		push rbp
    mov rbp, rsp
    OPT_MAKE_LIST_IF_NEEDED 0
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,0;get bound:null?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif34
    mov rax, const_tbl + 110
    jmp doneif34
    dif34:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,5;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:lst
    push rax
    push qword 1
    GET_BOUND rax,1,4;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    doneif34:
    leave
    ret
		doneclousure79:;seq ret;seq ret
    leave
    ret
		doneclousure77:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure76:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*43], rax;setting fvar:>
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :positive?

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*43];get fvar:>
		IS_UNDEF sym43
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody80)
		jmp doneclousure80
		lambody80:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody81)
		jmp doneclousure81
		lambody81:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,0;get bound:>
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure81:
    leave
    ret
		doneclousure80:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*42], rax;setting fvar:positive?
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :negative?

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*33];get fvar:<
		IS_UNDEF sym33
    push rax
    push qword 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody82)
		jmp doneclousure82
		lambody82:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody83)
		jmp doneclousure83
		lambody83:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,0,0;get bound:<
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure83:
    leave
    ret
		doneclousure82:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*41], rax;setting fvar:negative?
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :equal?

    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*31];get fvar:-
		IS_UNDEF sym31
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*26];get fvar:char->integer
		IS_UNDEF sym26
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*2];get fvar:car
		IS_UNDEF sym2
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*28];get fvar:eq?
		IS_UNDEF sym28
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*13];get fvar:vector?
		IS_UNDEF sym13
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*14];get fvar:string?
		IS_UNDEF sym14
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*12];get fvar:char?
		IS_UNDEF sym12
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*10];get fvar:pair?
		IS_UNDEF sym10
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*8];get fvar:float?
		IS_UNDEF sym8
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*9];get fvar:integer?
		IS_UNDEF sym9
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*21];get fvar:vector-length
		IS_UNDEF sym21
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*22];get fvar:vector-ref
		IS_UNDEF sym22
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*18];get fvar:string-ref
		IS_UNDEF sym18
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*17];get fvar:string-length
		IS_UNDEF sym17
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*40];get fvar:not
		IS_UNDEF sym40
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*34];get fvar:=
		IS_UNDEF sym34
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*33];get fvar:<
		IS_UNDEF sym33
    push rax
    push qword 18
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody84)
		jmp doneclousure84
		lambody84:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 18
    push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody87)
		jmp doneclousure87
		lambody87:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody88)
		jmp doneclousure88
		lambody88:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:loop
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody89)
		jmp doneclousure89
		lambody89:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 4
    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 92
    push rax
			mov rax, PVAR(3);get param:index
    push rax
    push qword 2
    GET_BOUND rax,2,0;get bound:<
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif48
    mov rax, const_tbl + 4
    jmp doneif48
    dif48:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(3);get param:index
    push rax
			mov rax, PVAR(1);get param:container-2
    push rax
    push qword 2
    mov rax, PVAR(2);get param:container-ref-fun
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(3);get param:index
    push rax
			mov rax, PVAR(0);get param:container-1
    push rax
    push qword 2
    mov rax, PVAR(2);get param:container-ref-fun
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*39];get fvar:equal?
		IS_UNDEF sym39
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif49
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, const_tbl + 101
    push rax
			mov rax, PVAR(3);get param:index
    push rax
    push qword 2
    GET_BOUND rax,2,17;get bound:-
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, PVAR(2);get param:container-ref-fun
    push rax
			mov rax, PVAR(1);get param:container-2
    push rax
			mov rax, PVAR(0);get param:container-1
    push rax
    
    push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 4
    REST_APPLICTP
    jmp doneif49
    dif49:
    mov rax, const_tbl + 2
    doneif49:
    doneif48:
    leave
    ret
		doneclousure89:
    push rax
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,1;get bound:container-2
    push rax
    push qword 1
    GET_BOUND rax,0,3;get bound:container-size-fun
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:container-1
    push rax
    push qword 1
    GET_BOUND rax,0,3;get bound:container-size-fun
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 1
    GET_BOUND rax,1,2;get bound:not
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif50
    mov rax, const_tbl + 2
    jmp doneif50
    dif50:
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, const_tbl + 101
    push rax
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:container-1
    push rax
    push qword 1
    GET_BOUND rax,0,3;get bound:container-size-fun
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,17;get bound:-
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			GET_BOUND rax,0,2;get bound:container-ref-fun
    push rax
			GET_BOUND rax,0,1;get bound:container-2
    push rax
			GET_BOUND rax,0,0;get bound:container-1
    push rax
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:loop
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 4
    REST_APPLICTP
    doneif50:;seq ret;seq ret
    leave
    ret
		doneclousure88:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure87:
    push rax
    
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody85)
		jmp doneclousure85
		lambody85:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 1
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody86)
		jmp doneclousure86
		lambody86:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,7;get bound:integer?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif35
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,7;get bound:integer?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif36
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    jmp doneif36
    dif36:
    mov rax, const_tbl + 2
    doneif36:
    jmp doneif35
    dif35:
    mov rax, const_tbl + 2
    doneif35:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,8;get bound:float?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif37
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,8;get bound:float?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif38
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    jmp doneif38
    dif38:
    mov rax, const_tbl + 2
    doneif38:
    jmp doneif37
    dif37:
    mov rax, const_tbl + 2
    doneif37:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,9;get bound:pair?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif39
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,9;get bound:pair?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif40
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,14;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,14;get bound:car
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*39];get fvar:equal?
		IS_UNDEF sym39
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif41
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,15;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,15;get bound:cdr
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*39];get fvar:equal?
		IS_UNDEF sym39
    violation_check rax, T_CLOSURE
      REST_APPLIC
    jmp doneif41
    dif41:
    mov rax, const_tbl + 2
    doneif41:
    jmp doneif40
    dif40:
    mov rax, const_tbl + 2
    doneif40:
    jmp doneif39
    dif39:
    mov rax, const_tbl + 2
    doneif39:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,10;get bound:char?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif42
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,10;get bound:char?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif43
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,16;get bound:char->integer
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,16;get bound:char->integer
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    push qword 2
    GET_BOUND rax,1,1;get bound:=
    violation_check rax, T_CLOSURE
      REST_APPLIC
    jmp doneif43
    dif43:
    mov rax, const_tbl + 2
    doneif43:
    jmp doneif42
    dif42:
    mov rax, const_tbl + 2
    doneif42:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,11;get bound:string?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif44
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,11;get bound:string?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif45
    push SOB_NIL_ADDRESS
			GET_BOUND rax,1,3;get bound:string-length
    push rax
			GET_BOUND rax,1,4;get bound:string-ref
    push rax
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    push qword 4
    GET_BOUND rax,0,0;get bound:compare-composite
    violation_check rax, T_CLOSURE
      REST_APPLIC
    jmp doneif45
    dif45:
    mov rax, const_tbl + 2
    doneif45:
    jmp doneif44
    dif44:
    mov rax, const_tbl + 2
    doneif44:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x
    push rax
    push qword 1
    GET_BOUND rax,1,12;get bound:vector?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif46
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
    push qword 1
    GET_BOUND rax,1,12;get bound:vector?
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif47
    push SOB_NIL_ADDRESS
			GET_BOUND rax,1,6;get bound:vector-length
    push rax
			GET_BOUND rax,1,5;get bound:vector-ref
    push rax
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    push qword 4
    GET_BOUND rax,0,0;get bound:compare-composite
    violation_check rax, T_CLOSURE
      REST_APPLIC
    jmp doneif47
    dif47:
    mov rax, const_tbl + 2
    doneif47:
    jmp doneif46
    dif46:
    mov rax, const_tbl + 2
    doneif46:
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:y
    push rax
			mov rax, PVAR(0);get param:x
    push rax
    
    GET_BOUND rax,1,13;get bound:eq?
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5
		mov rax, const_tbl + 2
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor5    
    doneor5:
    leave
    ret
		doneclousure86:
    leave
    ret
		doneclousure85:
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 1
    REST_APPLICTP
    leave
    ret
		doneclousure84:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*39], rax;setting fvar:equal?
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :lst

    mov rax, const_tbl + 360
    mov qword [fvar_tbl + WORD_SIZE*37], rax;setting fvar:lst
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :kill-tp

    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody90)
		jmp doneclousure90
		lambody90:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 2
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:cur
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*11];get fvar:null?
		IS_UNDEF sym11
    violation_check rax, T_CLOSURE
      REST_APPLIC
    cmp rax, SOB_FALSE_ADDRESS
    je dif51
    mov rax, const_tbl + 4
    jmp doneif51
    dif51:
    push SOB_NIL_ADDRESS
    push qword 0
    mov rax, PVAR(1);get param:f
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:f
    push rax
			push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:cur
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*3];get fvar:cdr
		IS_UNDEF sym3
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP;seq ret
    doneif51:
    leave
    ret
		doneclousure90:
    mov qword [fvar_tbl + WORD_SIZE*36], rax;setting fvar:kill-tp
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :fin

    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody91)
		jmp doneclousure91
		lambody91:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    mov rax, const_tbl + 4
    leave
    ret
		doneclousure91:
    mov qword [fvar_tbl + WORD_SIZE*38], rax;setting fvar:fin
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		;;Define of :explode

    push SOB_NIL_ADDRESS
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
			mov rax, const_tbl + 23
    push rax
    push qword 14
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody92)
		jmp doneclousure92
		lambody92:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 14
    
    push SOB_NIL_ADDRESS
			mov rax, PVAR(0);get param:x1
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(0), rax;setting param:x1
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(1);get param:x2
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(1), rax;setting param:x2
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(2);get param:x3
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(2), rax;setting param:x3
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(3);get param:x4
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(3), rax;setting param:x4
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(4);get param:x5
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(4), rax;setting param:x5
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(5);get param:x6
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(5), rax;setting param:x6
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(6);get param:x7
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(6), rax;setting param:x7
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(7);get param:x8
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(7), rax;setting param:x8
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(8);get param:x9
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(8), rax;setting param:x9
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(9);get param:x10
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(9), rax;setting param:x10
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(10);get param:x11
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(10), rax;setting param:x11
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(11);get param:x12
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(11), rax;setting param:x12
    mov rax, SOB_VOID_ADDRESS
		
    push SOB_NIL_ADDRESS
			mov rax, PVAR(12);get param:x13
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*46];get fvar:box
		IS_UNDEF sym46
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov PVAR(12), rax;setting param:x13
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody93)
		jmp doneclousure93
		lambody93:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			mov rax, qword [fvar_tbl + WORD_SIZE*38];get fvar:fin
		IS_UNDEF sym38
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure93:
    push rax
			mov rax, PVAR(0);get param:x1
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody94)
		jmp doneclousure94
		lambody94:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,0;get bound:x1
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure94:
    push rax
			mov rax, PVAR(1);get param:x2
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody95)
		jmp doneclousure95
		lambody95:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,1;get bound:x2
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure95:
    push rax
			mov rax, PVAR(2);get param:x3
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody96)
		jmp doneclousure96
		lambody96:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,2;get bound:x3
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure96:
    push rax
			mov rax, PVAR(3);get param:x4
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody97)
		jmp doneclousure97
		lambody97:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,3;get bound:x4
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure97:
    push rax
			mov rax, PVAR(4);get param:x5
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody98)
		jmp doneclousure98
		lambody98:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,4;get bound:x5
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure98:
    push rax
			mov rax, PVAR(5);get param:x6
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody99)
		jmp doneclousure99
		lambody99:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,5;get bound:x6
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure99:
    push rax
			mov rax, PVAR(6);get param:x7
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody100)
		jmp doneclousure100
		lambody100:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,6;get bound:x7
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure100:
    push rax
			mov rax, PVAR(7);get param:x8
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody101)
		jmp doneclousure101
		lambody101:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,7;get bound:x8
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure101:
    push rax
			mov rax, PVAR(8);get param:x9
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody102)
		jmp doneclousure102
		lambody102:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,8;get bound:x9
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure102:
    push rax
			mov rax, PVAR(9);get param:x10
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody103)
		jmp doneclousure103
		lambody103:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,9;get bound:x10
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure103:
    push rax
			mov rax, PVAR(10);get param:x11
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody104)
		jmp doneclousure104
		lambody104:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,10;get bound:x11
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure104:
    push rax
			mov rax, PVAR(11);get param:x12
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		push SOB_NIL_ADDRESS
			EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody105)
		jmp doneclousure105
		lambody105:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,11;get bound:x12
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure105:
    push rax
			mov rax, PVAR(12);get param:x13
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*44];get fvar:set-box!
		IS_UNDEF sym44
    violation_check rax, T_CLOSURE
      REST_APPLIC
		
    EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx
		mov rbx, rax
		MAKE_CLOSURE(rax, rbx, lambody106)
		jmp doneclousure106
		lambody106:
		push rbp
    mov rbp, rsp
    LAMBDA_ARG_CHECK 0
    push SOB_NIL_ADDRESS
			push SOB_NIL_ADDRESS
			GET_BOUND rax,0,12;get bound:x13
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC
    push rax
			mov rax, qword [fvar_tbl + WORD_SIZE*37];get fvar:lst
		IS_UNDEF sym37
    push rax
    
    mov rax, qword [fvar_tbl + WORD_SIZE*36];get fvar:kill-tp
		IS_UNDEF sym36
    violation_check rax, T_CLOSURE
    TP_SHIFT_FRAME 2
    REST_APPLICTP
    leave
    ret
		doneclousure106:
    mov PVAR(13), rax;setting param:x14
    mov rax, SOB_VOID_ADDRESS
		push SOB_NIL_ADDRESS
			mov rax, PVAR(9);get param:x10
    push rax
    push qword 1
    mov rax, qword [fvar_tbl + WORD_SIZE*45];get fvar:unbox
		IS_UNDEF sym45
    violation_check rax, T_CLOSURE
      REST_APPLIC;seq ret;seq ret
    leave
    ret
		doneclousure92:
    violation_check rax, T_CLOSURE
      REST_APPLIC
    mov qword [fvar_tbl + WORD_SIZE*35], rax;setting fvar:explode
    mov rax, SOB_VOID_ADDRESS
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, const_tbl + 196
    push rax
			mov rax, const_tbl + 178
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*32];get fvar:/
		IS_UNDEF sym32
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void

		push SOB_NIL_ADDRESS
			mov rax, const_tbl + 178
    push rax
			mov rax, const_tbl + 196
    push rax
    push qword 2
    mov rax, qword [fvar_tbl + WORD_SIZE*32];get fvar:/
		IS_UNDEF sym32
    violation_check rax, T_CLOSURE
      REST_APPLIC
		call write_sob_if_not_void
	ret