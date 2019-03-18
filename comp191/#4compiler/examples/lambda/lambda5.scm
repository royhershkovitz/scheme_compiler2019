(define count (lambda (init) (lambda () (set! init (+ init 1)) init)))
(define counter (count 0))
count
counter
(counter)
(counter)
(counter)
(counter)