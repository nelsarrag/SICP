#lang planet dyoo/simply-scheme:2
;Exercise 1.36

(define tolerance 0.000001)
(define (print-line value)
  (display value)
  (newline))

;I was lazy and added a counter but you could just copy paste in notepad or
;Eclipse and count # of lines
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess counter)
    (print-line guess)
    (display counter)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ counter 1) ))))
  (try first-guess 0))

(define (x^x y)
  (fixed-point (lambda (x) (/ (log y) (log x))) 10.0))

(define (damped-x^x y)
  (fixed-point (lambda (x) (/ (+ x (/ (log y) (log x))) 2)) 10.0))

(x^x 1000)
;38 steps without average damping (convergence acceleration)

;(damped-x^x 1000)
;10 steps with average damping - that's actually a differential