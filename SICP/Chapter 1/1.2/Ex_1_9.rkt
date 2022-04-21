#lang planet dyoo/simply-scheme:2
;Exercise 1.9
(define (+ a b)
(if (= a 0) b (inc (+ (dec a) b))))
;This is a linear recursive process because recursion is not the final instruction.
;The computer must keep track of the original function calls because we then call
;multiple increments on the final output.

(define (+ a b)
(if (= a 0) b (+ (dec a) (inc b))))
;This is a tail recursive funciton because recursion is the final instruction.
;After we call + (i.e., the function itself), it does not need the original caller
;for the final computation. 