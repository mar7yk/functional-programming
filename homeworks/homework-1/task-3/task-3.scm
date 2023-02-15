(define (accumulate-i op nv a b term next)
    (if (> a b) nv
        (accumulate-i op (op nv (term a)) (next a) b term next)))

(define (accumulate op nv a b term next)
  (if (> a b) nv
      (op (term a)
          (accumulate op nv (next a) b term next))))

(define (1+ a) (+ a 1))

(define (n-rooks board n)

  (define (correct? x)
    (and
     (= 1 (accumulate-i + 0 0 (- n 1) (lambda (y) (if (board x y n) 1 0)) 1+))
     (= 1 (accumulate-i + 0 0 (- n 1) (lambda (y) (if (board y x n) 1 0)) 1+)) ) )
  
  (accumulate (lambda (a b) (and a b)) #t 0 (- n 1) correct? 1+) )
