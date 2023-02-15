(define (accumulate-i op nv a b term next)
    (if (> a b) nv
        (accumulate-i op (op nv (term a)) (next a) b term next)))

(define (1+ a) (+ a 1))

(define (divisors-count n)
  (accumulate-i + 0 2 (- n 1) (lambda (x) (if (= 0 (modulo n x)) 1 0)) 1+) )

(define (best-pair a b)

  (define (op x y)
    (if (> (cdr x) (cdr y)) x y))
  
  (define (term start)
    (accumulate-i op (cons '() -1) (1+ start) b (lambda (x) (cons (cons start x) (divisors-count (+ start x)))) 1+) )
  
  (car (accumulate-i op (cons '() -1) a (- b 1) term 1+)) )