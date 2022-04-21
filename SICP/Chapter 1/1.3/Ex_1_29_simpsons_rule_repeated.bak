#lang planet dyoo/simply-scheme:2
;Exercise 1.29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))
(define (inc a) (+ a 1))

(define (cube x) (* x x x))
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simp-term k)
    (define y (f (+ a (* k h))))
    (* (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          (else 2))
       y))
  (* (/ h 3.0) (sum simp-term 0 inc n)))