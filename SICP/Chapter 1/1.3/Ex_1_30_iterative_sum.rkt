#lang planet dyoo/simply-scheme:2
;Exercise 1.30
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (cube x) (* x x x))

(define (inc a) (+ a 1))