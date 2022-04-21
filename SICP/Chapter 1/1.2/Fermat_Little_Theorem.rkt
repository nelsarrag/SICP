#lang planet dyoo/simply-scheme:2
;m is a prime number
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (random n)))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
  ((fermat-test n) (fast-prime? n (- times 1)))
  (else #f)))