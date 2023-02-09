(define (selectiveMerge f L1 L2)
  
  (define (helper L1 L2 last)
    (define (chose a b)
      
      (cond ( (< (f a b) (min a b)) 0)
            ( (> (f a b) (max a b)) 1)
            (else 2)) )
    
    (if (pair? L1)
        (cond ((= 0 (chose (car L1) (car L2)))
                 (cons (car L1) (helper (cdr L1) (cdr L2) 0)) )
              ((= 1 (chose (car L1) (car L2)))
                 (cons (f (car L1) (car L2)) (helper (cdr L1) (cdr L2) 1)))
              ((= 2 (chose (car L1) (car L2)))
                 (if (= last 0)
                     (cons (car L1) (helper (cdr L1) (cdr L2) 0))
                     (cons (f (car L1) (car L2)) (helper (cdr L1) (cdr L2) 1)) )) )
        '()) )
  
  (cons (car L1) (helper (cdr L1) (cdr L2) 0)) )