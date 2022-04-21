#lang planet dyoo/simply-scheme:2
;Exercise 1.33
(define (filtered-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a)
                    (term a)
                    null-value)
                (filtered-accumulate combiner null-value filter term (next a) next b))))

(define (sum-square-primes a b) ;gg works
  (filtered-accumulate + 0 prime? square a inc b))

(define (product-rel-primes a b)
  (define (filter x)
    (relatively-prime? x b))
  (filtered-accumulate * 1 filter identity 1 inc b))

(define (relatively-prime? a b)
  (if(= (gcd a b) 1)
     #t
     #f))

(define (product term a next b)
  (filtered-accumulate * 1 true? term a next b))

(define (true? a)
  (= a a))
  
(define (inc x) (+ x 1))
(define (cube x) (* x x x))
(define (square x) (* x x))
(define (identity x) x)

(define (smallest-divisor n)
  (define (iter a)
    (cond ((> (square a) n) n)
          ((= (remainder n a) 0) a)
          (else (iter (+ a 1)))))
  (iter 2))


(define (prime? n)
  (cond ((= n 1) #f)
        ((= (smallest-divisor n) n) #t)
        (else #f)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(sum-square-primes 1 20) ;1027
(product-rel-primes 1 20);8729721
