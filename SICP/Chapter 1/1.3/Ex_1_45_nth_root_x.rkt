#lang planet dyoo/simply-scheme:2
;Exercise 1.45 - at long last. To figure out the average dampings:
;floor(log2(root)) -> pretty neat pattern
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

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

(define (average x y)
  (/ (+ x y) 2))
(define (square x) (* x x))

(define (pow b p)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (iter res a n)
    (if (= n 0)
        res
        (if (even? n)
            (iter res (square a) (/ n 2))
            (iter (* res a) a (- n 1)))))
  (iter 1 b p))

(define (log2 x)
  (/ (log x)
     (log 2)))
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))

(define (cbrt x)
  (fixed-point-of-transform (lambda (y) (/ x (square y))) average-damp 1.0))

;  (fixed-point-of-transform (lambda (y) (/ x y)) (repeated average-damp 1) 1.0))
(define (nth-root x root)
  (fixed-point-of-transform (lambda (y) (/ x (pow y (- root 1))))
                            (repeated average-damp (floor (log2 root))) 1.0))

   