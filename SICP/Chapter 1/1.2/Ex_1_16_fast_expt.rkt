#lang planet dyoo/simply-scheme:2
;Exercise 1.6
(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (square b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* b a)))))

(define (square a) (* a a))