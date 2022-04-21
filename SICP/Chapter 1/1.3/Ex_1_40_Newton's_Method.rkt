#lang planet dyoo/simply-scheme:2
;Exercise 1.40

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

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


;Find roots of x^3 + 8x^2 + 4x + 2
(newtons-method (cubic 27 8 -2) 1) ;should return ~0.161 or -0.464 for -1 guess

       