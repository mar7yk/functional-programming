(define (accumulate-i op nv a b term next)
    (if (> a b) nv
        (accumulate-i op (op nv (term a)) (next a) b term next)))

(define (1+ a) (+ a 1))


(define (argmin f a b)
  
  (define (op x y)
    (if (< (cdr x) (cdr y)) x y))
  
  (car (accumulate-i op (cons a (f a)) (1+ a) b (lambda (a) (cons a (f a))) 1+)) )