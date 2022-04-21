#lang planet dyoo/simply-scheme:2
(define (sqrt-iter guess x)
   (new-if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
(cond (predicate then-clause)
(else else-clause)))

;If is a special-form that uses normal-order evaluation. It evaluates the
;predicate, then based on the truth value, evaluates the predicate OR consequent.
;New-if tries to evaluate all the operands before executing the body, since it is
;applicative order. This means that we infinitely call sqrt-iter, and never
;enter the base case. "re-defining a special form using generic arguments effectively
;"De-Special Forms" it"

 (define (iff <p> <c> <a>) (if <p> <c> <a>)) 
  
 (define (tryif a) (if (= a 0) 1 (/ 1 0))) 
  
 (define (tryiff a) (iff (= a 0) 1 (/ 1 0))) 