#lang planet dyoo/simply-scheme:2
;Exercise 1.7: Redesigning the sqrt algo, and block-structured
;Makes use of lexical scoping

(define (sqrt x)
  (define (sqrt-iter guess)
    (if (better-guess? guess)
        guess
        (sqrt-iter (improve guess))))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (better-guess? guess)
    ; (< (abs (/ (- (improve guess x) guess) guess)) 0.001)
    ; Solution below goes to limit of machine precision
    (= (improve guess) guess))
  (sqrt-iter 1.0))
  
(define (square x) (* x x))

(define (average x y) ; Not a part of sqrt - so should be separate
    (/ (+ x y) 2))