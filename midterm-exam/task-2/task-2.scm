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

(define (unitary? k n)
  
  (define (helper a b n)
    (if (> n a) #t
        
        (if (primeDivider? n a)
            (if (primeDivider? n b) #f
                (helper a k (+ n 1)))
            
            (helper a k (+ n 1)) ) ))
  (if (divider? k n)
      (helper (/ n k) k 2)
      #f
      ))

(define (commonUnitary a b)
  (define (op n a) (+ n a))
  (define (term n) (if (unitary? n a) (if (unitary? n b) 1 0) 0))
  (define (next a) (+ a 1))
  (accumulate-i op 0 1 a term next ) )