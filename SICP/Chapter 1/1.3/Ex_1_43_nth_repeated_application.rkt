#lang planet dyoo/simply-scheme:2
;Exercise 1.43


(define (compose f g)
  (lambda (x) (f ( g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (repeat f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeat f (- n 1)))))

;Logarithmic solution I was alluding to but didn't realize I reached:

(define (repeated-log f n)
  (cond ((= n 0) identity) ;seems irrelevant what you make this part, unsure exact
        ((even? n) (repeated (compose f f) (/ n 2)))
        (else (compose f (repeated f (- n 1))))))

(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (identity x) x)
((repeated inc 1) 2)

((repeated square 8) 2) ;returns 625


(define result (lambda (x) (compose square square)))

(define composition (lambda (x) (compose result square)))
