(define x (lambda (x y) (+ x y)))
(x 2 3)
((lambda (x y) (- x y)) 2 3)
((lambda (x y) (set! x (- 10 x)) (- x y)) 12 -3)