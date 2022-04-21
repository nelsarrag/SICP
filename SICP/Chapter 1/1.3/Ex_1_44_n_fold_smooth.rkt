#lang planet dyoo/simply-scheme:2
;Exercise 1.44

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))


(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

((smooth square) 10)

(define (n-fold-smoothed f n)
  (repeated smooth n) f)

((n-fold-smoothed square 4) 3)