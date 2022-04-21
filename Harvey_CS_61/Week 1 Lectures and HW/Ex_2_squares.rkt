#lang planet dyoo/simply-scheme:2
(define (squares sent)
  (if (empty? sent)
      '()
      (se (square (first sent))
          (squares (butfirst sent)) )))

(define (square x) (* x x))