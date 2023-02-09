(define (accumulate-i op nv a b term next)
  (if (> a b) nv
      (accumulate-i op (op nv (term a))
                    (next a) b term next)))

(define (divider? a n)
  (= 0 (remainder n a)))

(define (prime? a)
  (define (helper a n)
    (if (>= n a) #t
        (if (divider? n a) #f
            (helper a (+ n 1)) )))
  
  (helper a 2)
)

(define (primeDivider? a n)
    (if (divider? a n)
        (if (prime? a) #t #f) #f))

(define (trim N)
  (define (op n a) (/ n a))
  (define (term a) (if (primeDivider? a N) a 1))
  (define (next a) (+ a 1))
  (accumulate-i op N 1 N term next ) )