#lang planet dyoo/simply-scheme:2
;Exercise 1.31
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
  
(define (pi-approx n) ;this uses a different formula, next time dont cheat! :^)
  (define (pi-term a)
    (/ (* 4 (square a)) (- (* 4 (square a)) 1)))
  (* 2.0 (product-iter pi-term 1 inc n)))

;This makes note of each numerator being n-1 and n+1 of each pair of denominator
;So you multiply these, then skip by 2 because you already took care of the 2nd
;part of the pair of the denominator
(define (pi accuracy)
  (define (pi-term n)
    (* (/ (- n 1.0) n) (/ (+ n 1.0) n)))
  (define (pi-next n)
    (+ n 2.0))
  (* 4.0 (product-iter pi-term 3.0 pi-next accuracy)))
    

(define (identity x) x)

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (factorial x)
  (product-iter identity 1 inc x))

(define (factorial-recursive x)
  (product identity 1 inc x))

