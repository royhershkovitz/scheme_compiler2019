(define x (box 0))
(unbox (begin (set-box! x 1) x))
(begin (set-box! x 2) (unbox x))