(define x (cons 1 2))
(car x)
(cdr x)
(set-car! x 3)
x
(set-cdr! x 4)
x
"pair"
(pair? x)
(pair? #t)
"boolean"
(boolean? #t)
(boolean? #f)
(boolean? 1)
"float"
(float? 1.0)
(float? #f)
(float? 1)
"null"
(null? '())
(null? x)
"char?"
(char? #\c)
(char? '())
(char->integer #\c)
(char->integer #\d)
(integer->char 95)
(integer->char 96)

(symbol->string 'tanzania)
"eq?";same address
(eq? 1 1)
(eq? #\a #\a)
(eq? 1 1.0)
(eq? 1 2)
;(eq? 1 (+ 1 0))
(eq? #\a (integer->char 97));not same address
"equal?"
;(equal? 1 (+ 1 0))
(equal? #\a #\a);equal will test the value-not just address
(equal? #\a (integer->char 97))
(equal? 1 1)
(equal? 1 1.0)
(equal? 1 2) 
"=";bin_equ
(= 1.1 1.1) 
(= 1 1) 
(= 1 1.1) 
(= 1 2) 
(= 1 0)
"<"
(< 1 2.0) 
(< 1 2) 
(< 1 1) 
(< 1 0) 
">"
(> 1 2) 
(> 1 1.1) 
(> 1 1) 
(> 1 0)