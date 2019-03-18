(define sexpr->ocaml-pattern
    (lambda (e)
    (cond
        ((boolean? e)
        (if e "Bool true" "Bool false"))
        ((null? e) "Nil")
        ((char? e) (format "Char '~a'" e))
        ((symbol? e) 
          ((lambda(str)
              ;;(display str)              (display "\n")
              (if(equal? (string-ref str 0) #\_) ;; (if(equal? (string-ref str 0) #\_) 
              (substring str 1) (format "Symbol \"~a\"" str) ))(format "~a" e)))
        ((string? e) (format "String \"~a\"" e))
        ((integer? e) (format "Number (Int ~a)" e))
        ((rational? e) (format "Number (Float ~a)" e))
        ((pair? e)
        (format "Pair(~a, ~a)"
        (sexpr->ocaml-pattern (car e))
        (sexpr->ocaml-pattern (cdr e))))
        ((vector? e)
        (format "Vector [~a]"
        (foldr (lambda (v lst) `(,v ";" ,@lst)) '()
        (map sexpr->ocaml-pattern (vector->list e)))))
        (else (error 'sexpr->ocaml-pattern
        (format "Unsupported type: ~a" e))))))


(display (sexpr->ocaml-pattern '(let (rib . ribs) body)))
(display "\n")
(display (sexpr->ocaml-pattern '(let (_rib . _ribs) _body)))
;; input (display (sexpr->ocaml-pattern '(let (rib . ribs) body)))
;; Pair(Symbol "let", Pair(Pair(Symbol "rib", Symbol "ribs"), Pair(Symbol "body", Nil)))
;; (display (sexpr->ocaml-pattern '(let (_rib . _ribs) _body)))
;; Pair(Symbol "let", Pair(Pair(rib, ribs), Pair(body, Nil)))