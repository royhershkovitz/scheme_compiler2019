"vectors"
'#() '#(5) '#(5 4) '#(4 5 6) '#(5 6 7 8 9)

"quasi"
`(1 2 'k)
`'(1 2 'k)
(append '(1 2 3) '(4) '(5 6 7))

"vector"
(define vec (make-vector 3 1))
vec
(vector-ref vec 1)
(vector-set! vec 1 #\b)
(vector-ref vec 1)
vec

"string"
(define st (make-string 3 #\a))
st
(string-ref st 1)
(string-set! st 1 #\b)
(string-ref st 1)
st

"reset primitives"   
(+ 2 4.5)
(* 2 4.5)   
 
(define cons 'cons)
(define null? 'null?)
(define pair? 'pair?)
(append '(a b) 'c)
"for"
(define foo (lambda (n) 
    (if (= n 0)
        'finish
        (foo (- n 1))
    )
  )
  )

(foo 100000)