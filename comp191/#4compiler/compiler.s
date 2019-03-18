%define T_UNDEFINED 0
%define T_VOID 1
%define T_NIL 2
%define T_INTEGER 3
%define T_FLOAT 4
%define T_BOOL 5
%define T_CHAR 6
%define T_STRING 7
%define T_SYMBOL 8
%define T_CLOSURE 9
%define T_PAIR 10
%define T_VECTOR 11
	
%define CHAR_NUL 0
%define CHAR_TAB 9
%define CHAR_NEWLINE 10
%define CHAR_PAGE 12
%define CHAR_RETURN 13
%define CHAR_SPACE 32
%define CHAR_DOUBLEQUOTE 34
%define CHAR_BACKSLASH 92
	
%define TYPE_SIZE 1
%define WORD_SIZE 8
	
%define KB(n) n*1024
%define MB(n) 1024*KB(n)
%define GB(n) 1024*MB(n)


%macro SKIP_TYPE_TAG 2
	mov %1, qword [%2+TYPE_SIZE]
%endmacro	

%define INT_VAL SKIP_TYPE_TAG

%macro CHAR_VAL 2
    movzx %1, byte [%2+TYPE_SIZE]
;should move byte with rest are zeros, be careful with it
%endmacro

%macro EXIT_APPLIC 0
  add rsp , 8*1 ; pop env
  pop rbx ; pop arg count
  lea rsp , [rsp + WORD_SIZE + WORD_SIZE*rbx]; pop args
%endmacro

%macro REST_APPLIC 0
  PUSH_CLOSURE_ENV  rax
  CLOSURE_CODE rax, rax
  call rax
  EXIT_APPLIC
%endmacro 

%macro REST_APPLICTP 0
  ;ret is at rbp
  mov rdx, qword [rax+TYPE_SIZE];closure env
  mov qword [rsp + WORD_SIZE], rdx;put env above ret
  CLOSURE_CODE rax, rax
  jmp rax
  ;EXIT_APPLIC WILL NEVER BE CALLED SINCE THE RET ADDRES IS TO THE OLD FRAME
%endmacro 

;%1 arg cound
;will move the frame according to the new vlue
%macro TP_SHIFT_FRAME 1
	mov rcx, 1+%1
	lea r9, [rbp-WORD_SIZE];this frame begining
	GET_ARG_COUNT rbx
	lea rsp, [rsp + rbx*WORD_SIZE + 5*WORD_SIZE];revreting all last frame
	lea rbx, [rsp + %1*WORD_SIZE];this last frame
	mov r15, qword [rbp + WORD_SIZE];ret address
	mov rbp, qword [rbp];we will push it again in executed func
	cmp rcx, 0
%%cpy_loop:
	jz %%cpy_loop_end
	mov rdx, qword [r9]
	mov qword [rbx], rdx
	sub r9, WORD_SIZE
	sub rbx, WORD_SIZE
	dec rcx
	jmp %%cpy_loop
%%cpy_loop_end:
	push qword %1
	push r15;env
	push r15
%endmacro

%macro IS_UNDEF 1
    cmp rax, T_UNDEFINED
    jne %%def_var
	mov rsi, %1
    mov rax, 0
	mov rdi, contract_violation.var_not_defined
	call printf
    mov rax, 60       
    mov rdi, -3     ;EXIT_Failure types
    syscall
	%%def_var:
%endmacro

%define FLOAT_VAL SKIP_TYPE_TAG

%define STRING_LENGTH SKIP_TYPE_TAG

%define VECTOR_LENGTH SKIP_TYPE_TAG

%define SYMBOL_VAL SKIP_TYPE_TAG

%macro STRING_ELEMENTS 2
	lea %1, [%2+TYPE_SIZE+WORD_SIZE]
%endmacro

%define VECTOR_ELEMENTS STRING_ELEMENTS

%define CAR SKIP_TYPE_TAG

%macro CDR 2
	mov %1, qword [%2+TYPE_SIZE+WORD_SIZE]
%endmacro

%macro PUSH_CLOSURE_ENV 1
		push qword [%1+TYPE_SIZE]
%endmacro

%define CLOSURE_ENV CAR

%define CLOSURE_CODE CDR

%define PVAR(n) qword [rbp+(4+n)*WORD_SIZE]
	
%define SOB_UNDEFINED T_UNDEFINED
%define SOB_NIL  byte T_NIL
%define SOB_VOID T_VOID
%define SOB_FALSE word T_BOOL
%define SOB_TRUE word (1 << TYPE_SIZE | T_BOOL)

; returns %2 allocated bytes in register %1
; Supports using with %1 = %2
%macro MALLOC 2
	add qword [malloc_pointer], %2
	push %2
	;check if out of ram
	mov r14, qword[malloc_end]
	cmp %1, r14
	jg out_of_ram
	mov %1, qword [malloc_pointer]
	sub %1, [rsp]
	add rsp, 8
%endmacro
	
; Creates a short SOB with the
; value %3
; tag 	%2
; Returns the result in register %1
%macro MAKE_TAG_BYTE 3
	MALLOC %1, 1+TYPE_SIZE
	mov byte [%1], %2
	mov byte [%1+TYPE_SIZE], %3
%endmacro

; Creates a long SOB with the
; value %2 and type %3.
; Returns the result in register %1
%macro MAKE_LONG_VALUE 3
	MALLOC %1, TYPE_SIZE+WORD_SIZE
	mov byte [%1], %3
	mov qword [%1+TYPE_SIZE], %2
%endmacro

%macro MAKE_TAG 2
	MALLOC %1, TYPE_SIZE
	mov byte [%1], %2
%endmacro

%define MAKE_VOID(r) MAKE_TAG r, T_VOID

%define MAKE_NIL(r) MAKE_TAG r, T_NIL
%define MAKE_INT(r,val) MAKE_LONG_VALUE r, val, T_INTEGER
%define MAKE_FLOAT(r,val) MAKE_LONG_VALUE r, val, T_FLOAT
%define MAKE_CHAR(r,val) MAKE_TAG_BYTE r, T_CHAR, val
%define MAKE_BOOL(r,val) MAKE_TAG_BYTE r, T_BOOL, val
%define MAKE_SYMBOL(r, val) MAKE_LONG_VALUE r, val, T_SYMBOL

%macro MAKE_BYTE_LIT 1
	db %1
%endmacro
%macro MAKE_TWO_BYTES_LIT 2
	db %1
	db %2
%endmacro
%macro MAKE_TAG_WORD_LIT 2
	db %1
	dq %2
%endmacro
%macro MAKE_WORDS_LIT 3
	db %1
	dq %2
	dq %3
%endmacro
%define MAKE_LITERAL_INT(val) MAKE_TAG_WORD_LIT T_INTEGER, val
%define MAKE_LITERAL_FLOAT(val) MAKE_TAG_WORD_LIT T_FLOAT, val
%define MAKE_LITERAL_CHAR(val) MAKE_TWO_BYTES_LIT T_CHAR, val
%define MAKE_LITERAL_BOOL(val) MAKE_TWO_BYTES_LIT T_BOOL, val
%define MAKE_LITERAL_PAIR(car, cdr) MAKE_WORDS_LIT T_PAIR, car, cdr
%define MAKE_LITERAL_SYMBOL(val) MAKE_TAG_WORD_LIT T_SYMBOL, val
%define MAKE_LITERAL_STRING(val) MAKE_TAG_WORD_LIT T_STRING, val
%define MAKE_LITERAL_VECTOR(val) MAKE_TAG_WORD_LIT T_VECTOR, val

; Create a string of length %2
; from char %3.
; Stores result in register %1
%macro MAKE_STRING 3
	lea %1, [%2+WORD_SIZE+TYPE_SIZE]
	MALLOC %1, %1
	mov byte [%1], T_STRING
	mov qword [%1+TYPE_SIZE], %2
	push rcx
	add %1,WORD_SIZE+TYPE_SIZE
	mov rcx, %2
	cmp rcx, 0
%%str_loop:
	jz %%str_loop_end
	dec rcx
	mov byte [%1+rcx], %3
	jmp %%str_loop
%%str_loop_end:
	pop rcx
	sub %1, WORD_SIZE+TYPE_SIZE
%endmacro

%macro GET_FROM_STACK 2
	mov %1, qword [rbp + %2]
%endmacro
%macro GET_ENV 1
	GET_FROM_STACK %1, 2*WORD_SIZE
%endmacro
%macro GET_ARG_COUNT 1
	GET_FROM_STACK %1, 3*WORD_SIZE
%endmacro

;Store pointer in %1
; major %2
; minor %3
%macro GET_BOUND 3
	GET_ENV %1
	VECTOR_ELEMENTS %1, %1
    mov %1, qword [%1 + WORD_SIZE*%2]
	VECTOR_ELEMENTS %1, %1
    mov %1, qword [%1 + WORD_SIZE*%3]
%endmacro

;use %1 as pointer
; set to pointer in %2
; major %3
; minor %4
%macro SET_BOUND 4
	GET_ENV %1
	VECTOR_ELEMENTS %1, %1
    mov %1, qword [%1 + WORD_SIZE*%3]
	VECTOR_ELEMENTS %1, %1
    mov qword [%1 + WORD_SIZE*%4], %2
%endmacro

;%1 number of needed elements
%macro LAMBDA_ARG_CHECK 1
	GET_ARG_COUNT rdx
	mov rsi, %1
	cmp rdx, rsi
	jl bad_arguments_count
%endmacro

;%1 free register
;%2 number of needed elements
%macro OPT_MAKE_LIST_IF_NEEDED 1
	LAMBDA_ARG_CHECK %1
	jle %%skip_makelist
	mov rsi, SOB_NIL_ADDRESS;proper list ending
	lea rcx, [rdx - %1];diff
	push rcx
%%make_list:
	mov rdx, PVAR(rcx + %1 - 1)
	MAKE_PAIR (rdi, rdx, rsi)
	mov rsi, rdi
	dec rcx
	jnz %%make_list
%%finish_makelist:
	pop rdx;diff
	mov PVAR(rdx + %1), rsi;put list in majic cell
	mov qword [rbp + 3*WORD_SIZE], %1;update arg num
	SHIFT_FRAME %1
%%skip_makelist:
%endmacro

; diff in rdx
; in 1% numebr of args
%macro SHIFT_FRAME 1
	push rdx
	mov rcx, %1
	cmp rcx, 0
%%transfer_args:
	cmp rcx,-4
	je %%finish_transfer_args
	dec rcx
	lea rdi, [rdx+rcx]
	mov rsi, PVAR(rcx)
	mov PVAR(rdi), rsi
	jmp %%transfer_args
%%finish_transfer_args:
	pop rcx;diff
	lea rsp, [rsp+WORD_SIZE*rcx];update rsp and rbp
    mov rbp, rsp
%endmacro

; overwrite rcx, rdi
; vec in %1 (stores new in %1)
; %2 is used to get env
; add to rax the zero count
%macro EXTEND_VEC 2
	GET_ENV %2
	VECTOR_LENGTH rcx, %2
	add rcx, 1;bigger in one element then last env
	VECTOR_INI %1, rcx
	add %1,WORD_SIZE*2+TYPE_SIZE;skip zero
	add %2,WORD_SIZE+TYPE_SIZE
	sub rcx, 1;virtualize clonig vec
	cmp rcx, 0
%%ext_vec_loop:
	jz %%ext_vec_loop_end
	dec rcx
	mov rdi, qword [%2+rcx*WORD_SIZE]
	mov qword [%1+rcx*WORD_SIZE], rdi
	jmp %%ext_vec_loop
%%ext_vec_loop_end:
	sub %1, 2*WORD_SIZE+TYPE_SIZE
%endmacro

; overwrite rdi, rcx
; vec in %1 (stores in %1)
%macro COPY_PARAM 1
	GET_ARG_COUNT rcx
	add rcx, 1;we need to copy also the majic in case it will be used later
	VECTOR_INI %1, rcx
	add %1,WORD_SIZE+TYPE_SIZE
	cmp rcx, 0
%%copy_param_loop:
	jz %%copy_param_loop_end
	dec rcx
	mov rdi, qword [rbp+4*WORD_SIZE+rcx*WORD_SIZE]
	mov qword [%1+rcx*WORD_SIZE], rdi
	jmp %%copy_param_loop
%%copy_param_loop_end:
	lea rdi, [%1 -WORD_SIZE-TYPE_SIZE]
	pop %1
    mov qword [%1 + WORD_SIZE+TYPE_SIZE], rdi
%endmacro

; Create a vector of length %2
; from SOB at %3.
; Stores result in register %1
%macro MAKE_VECTOR 3
	lea %1, [%2*WORD_SIZE+WORD_SIZE+TYPE_SIZE] 
	MALLOC %1, %1
	mov byte [%1], T_VECTOR
	mov qword [%1+TYPE_SIZE], %2
	push rcx
	add %1, WORD_SIZE+TYPE_SIZE
	mov rcx, %2
	cmp rcx, 0
%%vec_loop:
	jz %%vec_loop_end
	dec rcx
	mov qword [%1+rcx*WORD_SIZE], %3
	jmp %%vec_loop
%%vec_loop_end:
	sub %1, WORD_SIZE+TYPE_SIZE
	pop rcx
%endmacro

; Stores result in register %1	
; Create a vector of length %2
%macro VECTOR_INI 2
	lea %1, [%2*WORD_SIZE+WORD_SIZE+TYPE_SIZE] 
	MALLOC %1, %1
	mov byte [%1], T_VECTOR
	mov qword [%1+TYPE_SIZE], %2
%endmacro

;pay attention rsi, rbx, rdi are rewritten in procedure
; Stores result in register %1	
; Create a vector of length %2
%macro VECTOR_PREP 2
	mov rsi, %2
	VECTOR_INI %1, rsi
	mov rsi, %1
    VECTOR_ELEMENTS rsi, rsi
%endmacro

; index %1
; to SOB index at table %32
%macro VECTOR_SET 2
    lea rdi, [rsi + WORD_SIZE*%1]	
	mov rbx, [%2] 
    mov qword [rdi], rbx
%endmacro

;pay attention rsi, rbx, rdi are rewritten
; Stores result in register %1
; Create a string of length %2
%macro STRING_PREP 2
	lea %1, [%2+WORD_SIZE+TYPE_SIZE]
	MALLOC %1, %1
	mov byte [%1], T_STRING
	mov qword [%1+TYPE_SIZE], %2
	mov rsi, %1
    STRING_ELEMENTS rsi, rsi
%endmacro

; index %1
; to SOB index at table %2
%macro STRING_SET 2
    lea rdi, [rsi + %1]	
    mov byte [rdi], %2
%endmacro

;;; Creates a SOB with tag %2 
;;; from two pointers %3 and %4
;;; Stores result in register %1
%macro MAKE_TWO_WORDS 4 
        MALLOC %1, TYPE_SIZE+WORD_SIZE*2
        mov byte [%1], %2
        mov qword [%1+TYPE_SIZE], %3
        mov qword [%1+TYPE_SIZE+WORD_SIZE], %4
%endmacro


%define MAKE_PAIR(r, car, cdr) \
        MAKE_TWO_WORDS r, T_PAIR, car, cdr

%define MAKE_CLOSURE(r, env, body) \
        MAKE_TWO_WORDS r, T_CLOSURE, env, body
	
extern exit, printf, malloc
global write_sob, write_sob_if_not_void
write_sob_undefined:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rdi, .undefined
	call printf

	leave
	ret

section .data
.undefined:
	db "#<undefined>", 0

write_sob_integer:
	push rbp
	mov rbp, rsp

	INT_VAL rsi, rsi
	mov rdi, .int_format_string
	mov rax, 0
	call printf

	leave
	ret

section .data
.int_format_string:
	db "%ld", 0

write_sob_float:
	push rbp
	mov rbp, rsp

	FLOAT_VAL rsi, rsi
	movq xmm0, rsi
	mov rdi, .float_format_string
	mov rax, 1

	mov rsi, rsp
	and rsp, -16
	call printf
	mov rsp, rsi

	leave
	ret
	
section .data
.float_format_string:
	db "%f", 0		

write_sob_char:
	push rbp
	mov rbp, rsp

	CHAR_VAL rsi, rsi

	cmp rsi, CHAR_NUL
	je .Lnul

	cmp rsi, CHAR_TAB
	je .Ltab

	cmp rsi, CHAR_NEWLINE
	je .Lnewline

	cmp rsi, CHAR_PAGE
	je .Lpage

	cmp rsi, CHAR_RETURN
	je .Lreturn

	cmp rsi, CHAR_SPACE
	je .Lspace
	jg .Lregular

	mov rdi, .special
	jmp .done	

.Lnul:
	mov rdi, .nul
	jmp .done

.Ltab:
	mov rdi, .tab
	jmp .done

.Lnewline:
	mov rdi, .newline
	jmp .done

.Lpage:
	mov rdi, .page
	jmp .done

.Lreturn:
	mov rdi, .return
	jmp .done

.Lspace:
	mov rdi, .space
	jmp .done

.Lregular:
	mov rdi, .regular
	jmp .done

.done:
	mov rax, 0
	call printf

	leave
	ret

section .data
.space:
	db "#\space", 0
.newline:
	db "#\newline", 0
.return:
	db "#\return", 0
.tab:
	db "#\tab", 0
.page:
	db "#\page", 0
.nul:
	db "#\nul", 0
.special:
	db "#\x%02x", 0
.regular:
	db "#\%c", 0

write_sob_void:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rdi, .void
	call printf

	leave
	ret

section .data
.void:
	db "#<void>", 0
	
write_sob_bool:
	push rbp
	mov rbp, rsp

	cmp word [rsi], SOB_FALSE
	je .sobFalse
	
	mov rdi, .true
	jmp .continue

.sobFalse:
	mov rdi, .false

.continue:
	mov rax, 0
	call printf	

	leave
	ret

section .data			
.false:
	db "#f", 0
.true:
	db "#t", 0

write_sob_nil:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rdi, .nil
	call printf

	leave
	ret

section .data
.nil:
	db "()", 0

write_sob_string:
	push rbp
	mov rbp, rsp

	push rsi

	mov rax, 0
	mov rdi, .double_quote
	call printf
	
	pop rsi

	STRING_LENGTH rcx, rsi
	STRING_ELEMENTS rax, rsi

.loop:
	cmp rcx, 0
	je .done
	mov bl, byte [rax]
	and rbx, 0xff

	cmp rbx, CHAR_TAB
	je .ch_tab
	cmp rbx, CHAR_NEWLINE
	je .ch_newline
	cmp rbx, CHAR_PAGE
	je .ch_page
	cmp rbx, CHAR_RETURN
	je .ch_return
	cmp rbx, CHAR_DOUBLEQUOTE
	je .ch_doublequote
	cmp rbx, CHAR_BACKSLASH
	je .ch_backslash
	cmp rbx, CHAR_SPACE
	jl .ch_hex
	
	mov rdi, .fs_simple_char
	mov rsi, rbx
	jmp .printf
	
.ch_hex:
	mov rdi, .fs_hex_char
	mov rsi, rbx
	jmp .printf
	
.ch_tab:
	mov rdi, .fs_tab
	mov rsi, rbx
	jmp .printf
	
.ch_page:
	mov rdi, .fs_page
	mov rsi, rbx
	jmp .printf
	
.ch_return:
	mov rdi, .fs_return
	mov rsi, rbx
	jmp .printf

.ch_newline:
	mov rdi, .fs_newline
	mov rsi, rbx
	jmp .printf

.ch_doublequote:
	mov rdi, .fs_doublequote
	mov rsi, rbx
	jmp .printf

.ch_backslash:
	mov rdi, .fs_backslash
	mov rsi, rbx

.printf:
	push rax
	push rcx
	mov rax, 0
	call printf
	pop rcx
	pop rax

	dec rcx
	inc rax
	jmp .loop

.done:
	mov rax, 0
	mov rdi, .double_quote
	call printf

	leave
	ret
section .data
.double_quote:
	db CHAR_DOUBLEQUOTE, 0
.fs_simple_char:
	db "%c", 0
.fs_hex_char:
	db "\x%02x;", 0	
.fs_tab:
	db 9, 0
.fs_page:
	db "\f", 0
.fs_return:
	db "\r", 0
.fs_newline:
	db 10, 0
.fs_doublequote:
	db CHAR_BACKSLASH, CHAR_DOUBLEQUOTE, 0
.fs_backslash:
	db CHAR_BACKSLASH, CHAR_BACKSLASH, 0

write_sob_pair:
	push rbp
	mov rbp, rsp

	push rsi
	
	mov rax, 0
	mov rdi, .open_paren
	call printf

	mov rsi, [rsp]

	CAR rsi, rsi
	call write_sob

	mov rsi, [rsp]
	CDR rsi, rsi
	call write_sob_pair_on_cdr
	
	add rsp, 1*8
	
	mov rdi, .close_paren
	mov rax, 0
	call printf

	leave
	ret

section .data
.open_paren:
	db "(", 0
.close_paren:
	db ")", 0

write_sob_pair_on_cdr:
	push rbp
	mov rbp, rsp

	mov bl, byte [rsi]
	cmp bl, T_NIL
	je .done
	
	cmp bl, T_PAIR
	je .cdrIsPair
	
	push rsi
	
	mov rax, 0
	mov rdi, .dot
	call printf
	
	pop rsi

	call write_sob
	jmp .done

.cdrIsPair:
	CDR rbx, rsi
	push rbx
	CAR rsi, rsi
	push rsi
	
	mov rax, 0
	mov rdi, .space
	call printf
	
	pop rsi
	call write_sob

	pop rsi
	call write_sob_pair_on_cdr

	add rsp, 1*8

.done:
	leave
	ret

section .data
.space:
	db " ", 0
.dot:
	db " . ", 0

write_sob_vector:
	push rbp
	mov rbp, rsp

	push rsi
	
	mov rax, 0
	mov rdi, .fs_open_vector
	call printf

	pop rsi

	VECTOR_LENGTH rcx, rsi
	cmp rcx, 0
	je .done
	VECTOR_ELEMENTS rax, rsi

	push rcx
	push rax
	mov rsi, qword [rax]
	call write_sob
	pop rax
	pop rcx
	dec rcx
	add rax, 8

.loop:
	cmp rcx, 0
	je .done

	push rcx
	push rax
	mov rax, 0
	mov rdi, .fs_space
	call printf
	
	pop rax
	push rax
	mov rsi, qword [rax]
	call write_sob
	pop rax
	pop rcx
	dec rcx
	add rax, 8
	jmp .loop

.done:
	mov rax, 0
	mov rdi, .fs_close_vector
	call printf

	leave
	ret

section	.data
.fs_open_vector:
	db "#(", 0
.fs_close_vector:
	db ")", 0
.fs_space:
	db " ", 0

write_sob_symbol:
	push rbp
	mov rbp, rsp

	SYMBOL_VAL rsi, rsi
	
	STRING_LENGTH rcx, rsi
	STRING_ELEMENTS rax, rsi

	mov rdx, rcx

.loop:
	cmp rcx, 0
	je .done
	mov bl, byte [rax]
	and rbx, 0xff

	cmp rcx, rdx
	jne .ch_simple
	cmp rbx, '+'
	je .ch_hex
	cmp rbx, '-'
	je .ch_hex
	cmp rbx, 'A'
	jl .ch_hex

.ch_simple:
	mov rdi, .fs_simple_char
	mov rsi, rbx
	jmp .printf
	
.ch_hex:
	mov rdi, .fs_hex_char
	mov rsi, rbx

.printf:
	push rax
	push rcx
	mov rax, 0
	call printf
	pop rcx
	pop rax

	dec rcx
	inc rax
	jmp .loop

.done:
	leave
	ret
	
section .data
.fs_simple_char:
	db "%c", 0
.fs_hex_char:
	db "\x%02x;", 0	

write_sob_closure:
	push rbp
	mov rbp, rsp

	CLOSURE_CODE rdx, rsi
	CLOSURE_ENV rsi, rsi

	mov rdi, .closure
	mov rax, 0
	call printf

	leave
	ret
section .data
.closure:
	db "#<closure [env:%p, code:%p]>", 0

section .text
write_sob:
	mov rbx, 0
	mov bl, byte [rsi]	
	jmp qword [.jmp_table + rbx * 8]

section .data
.jmp_table:
	dq write_sob_undefined, write_sob_void, write_sob_nil
	dq write_sob_integer, write_sob_float, write_sob_bool
	dq write_sob_char, write_sob_string, write_sob_symbol
	dq write_sob_closure, write_sob_pair, write_sob_vector

section .text
write_sob_if_not_void:
	mov rsi, rax
	mov bl, byte [rsi]
	cmp bl, SOB_VOID
	je .continue

	call write_sob
	
	mov rax, 0
	mov rdi, .newline
	call printf
	
.continue:
	ret
section .data
.newline:
	db CHAR_NEWLINE, 0
