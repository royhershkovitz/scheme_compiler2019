(define x (lambda (x y z) 
    (+ x y)))
(x 1 2 3)
(x 1 2 3)

(define x (lambda (x y z) 
    ((lambda () x))))
(x 2 1 3)
(x 2 1 3)

(define x (lambda (x y z) 
    ((lambda (x) x) 3)))
(x 2 2 3)
(x 2 2 3)

(define x (lambda (x y z) 
    ((lambda (y) x) 0)))
(x 4 2 3)
(x 4 2 3)

(define x (lambda (x y z) 
    ((lambda (x y z) z) 5 5 5)))
(x 4 2 3)
(x 4 2 3)

(define x (lambda (x y z) 
    ((lambda (x y z w) z) 6 6 6 6)))
(x 4 2 6)
(x 4 2 6)

(define x (lambda (x y z) 
    ((lambda (x y z w o p l m) z) 7 7 7 7 7 7 7 7 7)))
(x 4 2 6)
(x 4 2 6)

(define x (lambda (x y z w) 
    (+ 0 x)))
(x 8 3 2 1)
(define x (lambda (x y z w) 
    (+ 0 y)))
(x 4 9 2 1)
(define x (lambda (x y z w) 
    (+ 0 z)))
(x 4 3 10 1)
(define x (lambda (x y z w) 
    (+ 0 w)))
(x 4 3 2 11)
;3
;3
;2
;2
;3
;3
;4
;4
;5
;5
;6
;6
;7
;7
;8
;9
;10
;11
