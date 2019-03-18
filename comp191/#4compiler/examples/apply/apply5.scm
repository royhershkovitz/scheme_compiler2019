(apply (lambda (x) x) 1 2 3 '(4))
(apply (lambda (list) (apply (lambda (x) x) 5 list)) 1 2 '(3 4))