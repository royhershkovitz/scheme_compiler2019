#use "reader.ml";;
#use "tag-parser.ml";;
#use "semantic-analyser.ml";;
#use "code-gen.ml";;
open Reader;;
open Tag_Parser;;
open Semantics;; 
open Code_Gen;;

run_semantics (tag_parse_expression (read_sexpr "`#(1 ,x 3)"));;
run_semantics (tag_parse_expression (read_sexpr "(lambda (x) x)"));;
run_semantics (tag_parse_expression (read_sexpr "((((((lambda (x y) (set! x (+ x 1)) (set! y (+ y 1))
    (lambda () (set! x (+ x 1)) (set! y (+ y 1)) 
        (lambda () (set! x (+ x 1)) (set! y (+ y 1)) 
            (lambda () (set! x (+ x 1)) (set! y (+ y 1)) 
                (lambda () (+ x y)))))) 3 3..."));;

run_semantics (tag_parse_expression 
(read_sexpr 
"(lambda (pred dit dif) 
    (if (pred) ((lambda () (dit) (while pred dit dif))) (dif)))"));; 

    
run_semantics (tag_parse_expression 
(read_sexpr 
"`(1 2 'a)"));;