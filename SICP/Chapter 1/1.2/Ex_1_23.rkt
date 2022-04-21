#lang planet dyoo/simply-scheme:2
;Exercise 1.23
(define (square x) (* x x))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((= (remainder n test-divisor) 0) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n)
  (= n (smallest-divisor n)))

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
(search-for-primes 1000000000000 1000000000063)  ; 1e12

;While this method does halve the number of inputs, it uses an additional if statement.
;This method and Exercise 1.22 have a ratio of ~2:3, not 2:4.
