(define x (lambda (x y z) 
    (lambda (x y z w) x)))

((x 3 2 3) 1 1 1 1)
((x 3 2 3) 1 1 1 1)

(define x (lambda (x y z) 
    (lambda (m y z w) x)))

((x 2 2 3) 1 1 1 1)
((x 2 2 3) 1 1 1 1)

((lambda x (car x)) 1)