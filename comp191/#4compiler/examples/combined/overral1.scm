(define x (box 1))
(unbox x)
(set-box! x 2)
(unbox x)

(append)
(append '())
(append '(1 2) '() '(3))
(append '(1 2) '(3) '(4))

(zero? 0)
(zero? 1)

(list)
(list '(2) "s" 3) 
(list 1 2.0 3 4 5)
(list? '())
(list? '(1 2 3))
(list? (list 1 2.0 3 4 5))
(list? 1)

(length '())
(length '(1 2 3))
(length (list 1 2.0 3 4 5))
(length 1)

