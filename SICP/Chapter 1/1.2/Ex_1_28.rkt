#lang planet dyoo/simply-scheme:2
;Exercise 1.28
;This was hard AF and I barely understand how this works. It'd take me a while
;to implement programs like this effectively.
(define (m-r-expmod base exp n)
  (cond((= exp 0) 1)
       ((even? exp) (remainder-square-checked (m-r-expmod base (/ exp 2) n) n))
       (else (remainder (* base (m-r-expmod base (- exp 1) n)) n))))

(define (m-r-test num)
  (define (try-it a)
    (= (m-r-expmod a (- num 1) num) 1))
  (try-it (+ 1 (random (- num 1)))))

(define (remainder-square-checked x m)
  (if (and (= (remainder (square x) m) 1)
           (not (or (= x 1)
                    (= x (- m 1)))))
      0
      (remainder (* x x) m)))
(define (m-r-prime? n times)
  (cond ((= times 0) #t)
        ((m-r-test n)
         (m-r-prime? n (- times 1)))
        (else #f)))


(define (square x) (* x x))

                    
  