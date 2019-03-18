(define i 0)
(define while (lambda (pred dit dif) 
    (if (pred) ((lambda () (dit) (while pred dit dif))) (dif))))

(while (lambda() #f) (lambda() #t) (lambda() #f))
(while (lambda() (< i 10)) (lambda() (set! i (+ i 1))) (lambda() i))
(while (lambda() (< i 10000)) (lambda() (set! i (+ i 1))) (lambda() i))

(define control 0)
(define for (lambda (init pred update dit dif) 
    (if (pred init) ((lambda() (dit) 
            (for (update init) pred update dit dif))) (dif))))

(for 0 (lambda(i) (< i 10)) (lambda(i) (+ i 1)) (lambda() (set! control (+ control 1))) (lambda() control))
(for 0 (lambda(i) (< i 100000)) (lambda(i) (+ i 1)) (lambda() (set! control (+ control 1))) (lambda() control))
