#lang planet dyoo/simply-scheme:2
;EXERCISE 1.3
(define (sumLargerSquares a b c)
  (cond ((= a (findSmallest a b c)) (sumSquares b c))
        ((= b (findSmallest a b c)) (sumSquares a c))
        ((= c (findSmallest a b c)) (sumSquares a b))))
         
(define (findSmallest a b c)
  (cond ((and
          (<= a b)
          (<= a c)) a)
        ((and
          (<= b a)
          (<= b c)) b)
        (else c)))

(define (sumSquares a b)
  (+ (square a) (square b)))

(define (square a) (* a a))