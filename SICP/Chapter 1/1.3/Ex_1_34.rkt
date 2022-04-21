#lang planet dyoo/simply-scheme:2
;Exercise 1.34
(define (square x) (* x x))

(define (f g) (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

;What happens if we ask the interpret to evaluate (f f)?
;This evaluates to (f  (f 2)) which becomes (f (2 2)), but 2 is not a procedure
;that can be applied to the argument 2, so it'll cause an error