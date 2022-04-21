#lang planet dyoo/simply-scheme:2
;Exercise 1.4
(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))
;If b is positive, then just add a and b for a + |b|. Else, b is negative,
;so subtracting -b is the same as adding |b|.

;Exercise 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
;Very interesting! With a applicative order evaluation, the interpreter is
;trying to resolve the arguments 0 and (p) before executing the method.
;However, (p) simply calls itself, and never resolves, therefore this program
;never finishes. Alternatively, a normal order evaluation would not evaluate (p)
;until the very end, but since the method finishes before (p) is ever evaluated,
;it works fine!