#lang planet dyoo/simply-scheme:2
;Exercise 1.17
(define (fast-add a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-add (+ a a) (/ b 2)))
        (else (+ a (fast-add a (- b 1))))))
              