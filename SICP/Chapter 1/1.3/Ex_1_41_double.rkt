#lang planet dyoo/simply-scheme:2
;Exercise 1.41

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)

(((double (double double)) inc) 5)
;2 * 2 * 2 * 2 = 16 + 5 = 21