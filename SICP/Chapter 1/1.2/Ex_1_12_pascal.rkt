#lang planet dyoo/simply-scheme:2
;Exercise 1.12
(define (pascal row col)
  (cond ;((and (= row 0) (not (= col 0)) 0))
        ((> col row) 0)
        ((or (= col 0) (= col row)) 1)
        (else(+ (pascal (- row 1) col)
               (pascal (- row 1) (- col 1))))))