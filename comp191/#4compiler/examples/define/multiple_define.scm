(define x 2)
(define z (lambda (y) (+ x y)))
(z 2)
(define x 3)
(z 2)
(define w (lambda () (z 30)))
(w)