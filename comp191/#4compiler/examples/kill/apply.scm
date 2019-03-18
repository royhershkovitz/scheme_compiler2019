;purpose-find error in apply
;the test is not based on the ram amount
(define lst '(1 2 3 4 5 6 7 8))
;we will use for in for n times to get to 8^n=2^3n
(define kill-TP
	(lambda (cur f)
		(if (null? cur) 
			#t 
			(begin (apply f '()) (kill-TP (cdr cur) f))
		)
	)
)
(define fin (lambda () #t))
(define explode (letrec (
	(x1  (lambda() 
			(kill-TP lst fin)))
	(x2	 (lambda()
			(kill-TP lst x1)))
	(x3	 (lambda()
			(kill-TP lst x2)))
	(x4	 (lambda()
			(kill-TP lst x3)))
	(x5	 (lambda()
			(kill-TP lst x4)))
	(x6	 (lambda()
			(kill-TP lst x5)))
	(x7	 (lambda()
			(kill-TP lst x6)))
	(x8	 (lambda()
			(kill-TP lst x7)))
    )
	x7
))
(explode)
