#lang planet dyoo/simply-scheme:2
;Exercise 1.25
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (alt-expmod base exp m)
  (remainder (fast-expt base exp) m))

;Why is alt-expmod dog compared to expmod?
;alt-expmod is evaluating this massive exponent first, then calling mod.
;Expmod breaks up the problem into a number of smaller mod operations such that
;the random value is always smaller than the number being tested for primality
; keeps the numbers being squared less than the number tested for primality m.
;fast-expt however squares huge numbers of a^m size.

(define (fast-expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (square (fast-expt base (/ exp 2))))
        (else (* base (fast-expt base (- exp 1))))))

(define (fermat-test n)
  (define (try-it a)
    (= (alt-expmod a n n) a))
  (try-it (+ 1 (random ( - n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
        

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((= (remainder n test-divisor) 0) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (fast-prime? n 100))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2)))))
  (iter (if (odd? lower)
        lower
        (+ lower 1))))

(define (runtime)
  (current-milliseconds))
  
  

;(search-for-primes 1000000000 1000000021)       ; 1e9 
;(search-for-primes 10000000000 10000000061)     ; 1e10, so differs by sqrt(2)
;(search-for-primes 100000000000 100000000057)   ; 1e11 
;(search-for-primes 1000000000000 1000000000063)  ; 1e12