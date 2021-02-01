(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  'replace-this-line)


;; Problem 15
;; Returns a list of two-element lists
; BEGIN PROBLEM 15


(define (enumerate s)
  
    (define (helper first s)
        (if (null? s) nil (cons (list first (car s)) (helper (+ 1 first) (cdr s)))
        )
    )
     (helper 0 s)
     )
 
 
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond 
        ((and (null? list1) (null? list2)) nil)
        ((null? list1) list2)
        ((null? list2) list1)
        (else 
             (cond
                 ((comp (car list1) (car list2)) (cons (car list1) (merge comp (cdr list1) list2)))
                 (else (cons (car list2) (merge comp (cdr list2) list1)))
             )
        )
  )
)
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s) 
    ; BEGIN PROBLEM 17
    (if
        (null? (cdr s))
            (list s)
            
        (begin 
              (define rest (nondecreaselist (cdr s)))
              (if
                (> (car s) (car (car rest))) 
                    (cons (list (car s))  rest)        
                (cons (cons (car s) (car rest)) (cdr rest))
                )
        )
        
    )
)
             
    
    ; END PROBLEM 17

Broad outline:
1. Call nondecreasing on the cdr of the list, call this the "rest"
2. Check if the current car is greater than the car of the rest
3. If it is, then add it as a new list. If it isn't, then put it into the first sequence.


;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
            (cons form (cons params body))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (cons (cons 'lambda (cons (car (zip values))) body) (cadr (zip values))
           ; END PROBLEM EC
           )))))
        ;(else
         ; BEGIN PROBLEM EC
         ;replace-this-line
         ; END PROBLEM EC
         ;)))
;
