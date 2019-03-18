#use "reader.ml";;
#use "tag-parser.ml";;
#use "semantic-analyser.ml";;
open Reader;;
open Tag_Parser;;
open Semantics;; 

Printf.printf "\n\n(* ANNOTATE SECTION *)\n";;
run_semantics (tag_parse_expression (read_sexpr "(lambda (b) a b)"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda b . (a b))"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda (a . b) a b)"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda (a . b) (lambda (a . b) a b))"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda (a . b) (lambda (c) a b))"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda (a . b) (lambda (c) (lambda (c) a b)))"));;

Printf.printf "\n\n(* TP SECTION *)\n";;
run_semantics (tag_parse_expression (read_sexpr "(lambda (x)(f (lambda(y)(g x y))))"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda (x y z w)(if(foo? x)(goo y)(boo a (doo z))))"));;

Printf.printf "\n\n(* AUTO BOX SECTION *)\n";;
run_semantics (tag_parse_expression (read_sexpr "(define (func .  x)
                (list (lambda () x)
                      (lambda (z) (set! x z))
                (lambda (z) 
                  (set! x z))))"));;

run_semantics (tag_parse_expression (read_sexpr "
                  (define func (lambda (x y z w)
                           (list (lambda () x)
                                 (lambda () y)
                                 (lambda () z)
                                 (lambda () w)
                                 (lambda () (set! x 0))
                                 (lambda () (set! y 1))
                                 (lambda () (set! z 2))
                                 (lambda () (set! w 3)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo1
    (lambda (x)
    (list (lambda () x)
    (lambda (y) (set! x y)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo3
    (lambda (x y)
    (lambda () x)
    (lambda () y)
    (lambda () (set! x y))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo4
    (lambda (x y)
    (if x
    (lambda () (set! y x))
    (lambda (z) (set! x z)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo6
    (lambda (x)
    (cond
        ((eq? op 'read) (lambda () x))
        ((eq? op 'write) (lambda (val) (set! x val)))
        (else 'unknown-msg))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo7
    (lambda (x)
    `(,(lambda () x) ,(set! x y))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo8
    (lambda (x y)
    (cons x
    (lambda ()
    (set! x y)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo9
        (lambda (x y z)
            (list (lambda ()
                    (list (lambda (x)
                        (set! x z))
                        (lambda ()
                        (set! x z))
                        x))
                (lambda (y)
                (set! x y)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (if (lambda () (f 1))
        5 6)"));;   

Printf.printf "\n\n(* AUTO BOX SECTION SHOULD NOT BOX *)\n";;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo5
    (lambda (x y)
    (list (lambda () (set! x (+ x 1)))
    (lambda () y))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo6
    (lambda (x)
    (lambda (op)
    (cond
        ((eq? op 'read) (lambda () x))
        ((eq? op 'write) (lambda (val) (set! x val)))
        (else 'unknown-msg)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo7
    (lambda (x)
    (let ((y 1))
    `(,(lambda () x) ,(set! x y)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo9
        (lambda (x y z)
            (list (lambda ()
                    (list (lambda (x)
                        (set! x z))
                        (lambda ()
                        (set! x z))
                        x))
                )))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo2
    (lambda (x y)
    (set! x (* x y))))"));;

run_semantics (tag_parse_expression (read_sexpr "
(define func (lambda (x y z w)
(list (lambda () x)
      (lambda () y)
      (lambda () z)
      (lambda () w)
      (lambda () (set! x 0))
      (lambda () (set! y 1))
      (lambda () (set! z 2))
      (lambda () (set! w 3)))))"));;

run_semantics (tag_parse_expression (read_sexpr "
    (define foo3 (lambda (x y) 
    (lambda () x) 
    (lambda () y)
    (lambda () (set! x y))))"));;      

run_semantics (tag_parse_expression (read_sexpr "
    (define func (lambda (x)
    (list (lambda () (set! x 1))
        (lambda () (set! x (+ x 1)))      )))"));;
