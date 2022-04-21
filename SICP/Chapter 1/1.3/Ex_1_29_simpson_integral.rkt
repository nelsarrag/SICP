#lang planet dyoo/simply-scheme:2
;Ex 1.29
(define (inc x) (+ x 1))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
        (sum term (next a) next b))))
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term k)
    (define y (f (+ a (* k h))))
    (* (cond ((or (= k 0) (= k n)) 1)
             ((odd? k) 4)
             (else 2))
       y))
    (* (/ h 3.0) (sum simpson-term 0 inc n)))
  
(define (cube x) (* x x x))

(define (integral f a b dx) ;Book code - comparison point
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))