#lang planet dyoo/simply-scheme:2
;Exercise 1.37

;The recursive solution starts from the outside (how the fraction is phrased
;in the text, and goes deeper, just like how you'd normally read it
(define (cont-frac n d k) ;recursive solution
  (define (helper i)
    (if (> i k) ; if = i k, then we go from 1 to k-1, we want 1 to k
        0
        (/ (n i)
           (+ (d i) (helper (+ i 1))))))
  (helper 1)) ;starts at 1 in the the book

;can use lambda functions to calculate  n(i) and d(i)


;For the iterative solution, we actually start from the innermost fraction and
;work outwards. This is why we go from k to 1 instead of 1 to k like above
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 0))

(/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12))
