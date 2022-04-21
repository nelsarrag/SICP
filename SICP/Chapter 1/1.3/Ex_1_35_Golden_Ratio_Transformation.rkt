#lang planet dyoo/simply-scheme:2
;Exercise 1.35
;The golden ratio is a fixed point of x -> 1 + (1/x), can be shown by
;finding the roots of the quadratic equation x^2 - x - 1 = 0
;phi = (1 + sqrt(5)) / 2

(define tolerance 0.0000001)
(define (close-enough? x y)
  (< (abs (- x y)) 0.00001))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 10.0)