(define (split-at lst n)
  (cond
    ((= 0 n) (cons nil lst))
    ((null? lst) (cons nil nil))
    (else (cons(cons (car lst) (car (split-at (cdr lst) (- n 1)))) (cdr (split-at (cdr lst) (- n 1)))
))))


(define (compose-all funcs)
  (lambda (x)
    (if (null? funcs) x
      ((compose-all (cdr funcs)) ((car funcs) x)))))
