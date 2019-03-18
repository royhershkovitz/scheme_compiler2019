(((lambda (x.y) (lambda () x)) 1 2 3))
(((lambda (x.y) (lambda () y)) 1 2 3))
((((lambda (x.y) (lambda () (lambda () x))) 1 2 3)))
((((lambda (x.y) (lambda () (lambda () y))) 1 2 3)))

(((lambda (x.y) (lambda () x)) 1))
(((lambda (x.y) (lambda () y)) 1))
((((lambda (x.y) (lambda () (lambda () x))) 1)))
((((lambda (x.y) (lambda () (lambda () y))) 1)))
