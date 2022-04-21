#lang planet dyoo/simply-scheme:2
;Exercise 1.24
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
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
  (fast-prime? n 100000))

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
  
  

(search-for-primes 1000000000 1000000021)       ; 1e9 
;(search-for-primes 10000000000 10000000061)     ; 1e10, so differs by sqrt(2)
;(search-for-primes 100000000000 100000000057)   ; 1e11 
(search-for-primes 1000000000000 1000000000063)  ; 1e12


;1e12 vs. 1e9 numbers should have a runtime ratio of 4:3, or roughly 33% slower
;One instance of data showed about a 45% slower, so within margins imo
;doesn't seem to work so well for low values of the # of times we check
;(times parameter)?
