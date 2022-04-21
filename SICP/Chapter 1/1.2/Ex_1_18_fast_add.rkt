#lang planet dyoo/simply-scheme:2
;Exercise 1.18 - iterative procedure
(define (*-iter a b sum)
  (cond ((= b 0) sum)
        ((even? b) (*-iter (+ a a) (/ b 2) sum))
        (else (*-iter a (- b 1) (+ sum a)))))
(define (*-func a b) (*-iter a b 0))
  