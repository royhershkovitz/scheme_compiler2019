((((((lambda (x y) (set! x (+ x 1)) (set! y (+ y 1))
    (lambda () (set! x (+ x 1)) (set! y (+ y 1)) 
        (lambda () (set! x (+ x 1)) (set! y (+ y 1)) 
            (lambda () (set! x (+ x 1)) (set! y (+ y 1)) 
                (lambda () (+ x y)))))) 3 3...