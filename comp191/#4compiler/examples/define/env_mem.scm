(define x 2)
(define z ((lambda (y) (lambda() (+ x y))) x))
(z)
(define x 3)
(z)