(*#use "pc_tester.ml";;
pc_tester.tester();;*)
#use "reader.ml";;
#use "tag-parser.ml";;
open Reader;;
open Tag_Parser;;


Printf.printf "\n\n(* CONST SECTION *)\n";;
tag_parse_expression(read_sexpr("#t"));;
tag_parse_expression(read_sexpr(" #T"));;
tag_parse_expression(read_sexpr(" 123"));;
tag_parse_expression(read_sexpr("\"dasdsa\""));;
tag_parse_expression(read_sexpr("#\\a"));;

Printf.printf "\n\n(* VAR SECTION *)\n";;
tag_parse_expression(read_sexpr("quote"));;
tag_parse_expression(read_sexpr("abc"));;

Printf.printf "\n\n(* IF SECTION *)\n";;
tag_parse_expression(read_sexpr("(if #t x y)"));;
tag_parse_expression(read_sexpr("(if Z x y)"));;
tag_parse_expression(read_sexpr("(if #t x)"));;

Printf.printf "\n\n(* LAMBDA SECTION *)\n";;

(* _assert 8.1 "(lambda (a b c) (begin d))" (LambdaSimple (["a"; "b"; "c"], Var "d"));;
_assert 8.2 "(lambda (a b c) a b)" (LambdaSimple (["a"; "b"; "c"], Seq [Var "a"; Var "b"]));;
_assert 8.3 "(lambda (a b c) (begin a b))" (LambdaSimple (["a"; "b"; "c"], Seq [Var "a"; Var "b"]));;
_assert 8.4 "(lambda (a b c) (begin))" (LambdaSimple (["a"; "b"; "c"], Const Void));; *)
tag_parse_expression(read_sexpr("(lambda (a b c) (begin d))"));;
tag_parse_expression(read_sexpr("(lambda (a b c) (begin a b))"));;
tag_parse_expression(read_sexpr("(lambda (a b c) (begin))"));;

tag_parse_expression(read_sexpr("(lambda (x) y)"));;
tag_parse_expression(read_sexpr("(lambda () y)"));;
tag_parse_expression(read_sexpr("(LAMBDA (x) 1 2)"));;
tag_parse_expression(read_sexpr("(LAMBDA (x z) (+ 1 y) (+ 1 y))"));;
tag_parse_expression(read_sexpr("(lambda (x) y)"));;
tag_parse_expression(read_sexpr("(lambda (x) . (y))"));;
Printf.printf "\n(* LAMBDA OPT SECTION *)\n";;
tag_parse_expression(read_sexpr("(lambda (x . z) . (y))"));;
tag_parse_expression(read_sexpr("(lambda (x b . z) . (y))"));;
Printf.printf "\n(* LAMBDA VARIADIC SECTION *)\n";;
tag_parse_expression(read_sexpr("(lambda listx . (1 2))"));;
tag_parse_expression(read_sexpr("(LAMBDA x (+ 1 y))"));;

Printf.printf "\n\n(* SET SECTION *)\n";;
tag_parse_expression(read_sexpr("(set! a 5)"));;

Printf.printf "\n\n(* OR SECTION *)\n";;
tag_parse_expression(read_sexpr("(or)"));;
tag_parse_expression(read_sexpr("(OR A #F #T)"));;
tag_parse_expression(read_sexpr("(or #t #f #\\a)"));;

Printf.printf "\n\n(* AND SECTION *)\n";;
tag_parse_expression(read_sexpr("(and)"));;
tag_parse_expression(read_sexpr("(and a)"));;
tag_parse_expression(read_sexpr("(and (+ 1 2))"));;
tag_parse_expression(read_sexpr("(and A b c)"));;

Printf.printf "\n\n(* LET SECTION *)\n";;
tag_parse_expression(read_sexpr("(let () 1)"));;
tag_parse_expression(read_sexpr("(let ((x 1)) 1)"));;
tag_parse_expression(read_sexpr("(let ((x 1) (y 2)) 1 2)"));;
Printf.printf "\n\n(* LET* SECTION *)\n";;
tag_parse_expression(read_sexpr("(let* () 1)"));;
tag_parse_expression(read_sexpr("(let* () 1 2)"));;
tag_parse_expression(read_sexpr("(let* ((x 1)) 1)"));;
tag_parse_expression(read_sexpr("(let* ((x 1)) 1 2)"));;
tag_parse_expression(read_sexpr("(let* ((x 1) (y 2)) 1 2)"));;

tag_parse_expression(read_sexpr("(let* ((e1 v1)) body)"));;
tag_parse_expression(read_sexpr("(let* ((e1 v1)(e2 v2)(e3 v3)) body)"));;

Printf.printf "\n\n(* LETREC SECTION *)\n";;
tag_parse_expression(read_sexpr("(letrec () 1)"));;
tag_parse_expression(read_sexpr("(letrec ((x 1)) 1)"));;
tag_parse_expression(read_sexpr("(letrec ((x 1) (y 2)) 1 2)"));;

Printf.printf "\n\n(* SEQ SECTION *)\n";;
tag_parse_expression(read_sexpr("(begin )"));;
tag_parse_expression(read_sexpr("(begin a)"));;
tag_parse_expression(read_sexpr("(begin a b 1)"));;

Printf.printf "\n\n(* DEFINE SECTION *)\n";;
tag_parse_expression(read_sexpr("(define a b)"));;
tag_parse_expression(read_sexpr("(define (square x) . ( * x x))"));;
tag_parse_expression(read_sexpr("(define (multiply . (x y)) . ( * x y))"));;
tag_parse_expression(read_sexpr("(define (multiply . (x y)) ( * x y))"));;
tag_parse_expression(read_sexpr("(define (multiply . arglist) arglist)"));;
tag_parse_expression(read_sexpr("(define (var . arglst) . (body))"));;

tag_parse_expression(read_sexpr("(define 5 b)"));;
tag_parse_expression(read_sexpr("(define if 7)"));;

Printf.printf "\n\n(* QUOTE SECTION *)\n";;
tag_parse_expression(read_sexpr("'meka"));;
tag_parse_expression(read_sexpr("'()"));;
read_sexpr("'()");;
tag_parse_expression(Nil);;

Printf.printf "\n\n(* COND SECTION *)\n";;
tag_parse_expression(read_sexpr("(cond (5 1 2))"));;
tag_parse_expression(read_sexpr("(cond ((= x 5) 1 2))"));;
tag_parse_expression(read_sexpr("(cond (else 5))"));;
tag_parse_expression(read_sexpr("(cond ((= x 5) 1 2) (else 5) )"));;
tag_parse_expression(read_sexpr("(cond ((= x 5) 1 2) (else 5 6) )"));;
tag_parse_expression(read_sexpr("(cond (a => b)(c => d))"));;
tag_parse_expression(read_sexpr("(let ((value a)(f (lambda () b))) (if value ((f) value) (let ((value c) (f (lambda () d))) (if value ((f) value)))))"));;
tag_parse_expression(read_sexpr("(cond (else 5) (5 1 2))"));;
    

Printf.printf "\n\n(* QUASIQUOTE SECTION *)\n";;
tag_parse_expression(read_sexpr("`#(a ,b c ,d)"));;
tag_parse_expression(read_sexpr("`x"));;
tag_parse_expression(read_sexpr("`,x"));;
tag_parse_expression(read_sexpr("`'x"));;
tag_parse_expression(read_sexpr("`,@x"));;
tag_parse_expression(read_sexpr("`(,a b)"));;
tag_parse_expression(read_sexpr("`(,@a b)"));;
tag_parse_expression(read_sexpr("`(,@a . ,b)"));;
tag_parse_expression(read_sexpr("`#(a ,b c ,d)"));;
tag_parse_expression(read_sexpr("`(,a . ,@b)"));;
tag_parse_expression(read_sexpr("`(,a . ,@b)"));;
(*read_sexpr("'()");;*)

Printf.printf "\n\n(* running multiple parsing *)\n";;
tag_parse_expressions(read_sexprs("1 (cond (a => b)(c => d)) (cond (a => b)(c => d)) 2"));;
(*read_sexpr("(let ( (v list_mem) (rest (lambda () x))) (if v v (rest)))");;*)

read_sexprs("(- 3 (- 9.1 6.12)) ...");;

let input = ("(- 3 (- 9.1 6.12)) ...");; 
let output = (
[Pair (Symbol "-", 
 Pair (Number (Int (3)), 
 Pair (Pair (Symbol "-", 
 Pair (Number (Float (9.1)), 
 Pair (Number (Float (6.12)), Nil))), Nil)))]);; 
Printf.printf "%b" (List.for_all2 sexpr_eq (Reader.read_sexprs input) output);;