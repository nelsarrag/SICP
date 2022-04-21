#lang planet dyoo/simply-scheme:2
;Exercise 1.46

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve-guess guess))))
  iter)

(define (average x y)
  (/ (+ x y) 2))
(define (square x) (* x x))

(define (sqrt x)
  ((iterative-improve (lambda (y) (<
                                   (abs (- (square y) x))
                                   0.00001))
                      (lambda (y) (average y (/ x y))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (y) (<
                                   (abs (- (f y) y))
                                   0.00001))
                      f)
  first-guess))


(fixed-point sin 1.0)
  