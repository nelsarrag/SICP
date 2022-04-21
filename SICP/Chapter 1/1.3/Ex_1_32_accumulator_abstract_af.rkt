#lang planet dyoo/simply-scheme:2
;Exercise 1.32
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value)) ; its just so clean lol so well abstracted

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b) ; pretty fire actually
  (accumulate * 1 term a next b))

(define (square x) (* x x))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (identity x) x)