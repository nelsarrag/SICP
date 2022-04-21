#lang planet dyoo/simply-scheme:2
;Exercise 1.27 - check fermat test for every val from 1 to n-1
(define (expmod base exp n)
  (cond((= exp 0) 1)
       ((even? exp) (remainder
                     (square (expmod base (/ exp 2) n))
                     n))
       (else (remainder (* base (expmod base (- exp 1) n)) n))))

(define (fermat num trial) ;unused
  (= (expmod trial num num) trial))

(define (fast-prime? num)
  (define (prime-iter trials)
    (cond ((= num 1) #f)
          ((= trials num) #t)
          ((= (expmod trials num num) trials) (prime-iter (+ trials 1)))
          (else #f)))
  (prime-iter 1))

(define (square x) (* x x))

(fast-prime? 561)
(fast-prime? 1105)
(fast-prime? 1729)
(fast-prime? 2465)
(fast-prime? 2821)
;(fast-prime? 548225275481489)
(fast-prime? 10)
(fast-prime? 17)
(fast-prime? 1999)
(fast-prime? 1) ; not prime so should return false
(fast-prime? 29170450) 
                    
  