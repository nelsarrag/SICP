#lang planet dyoo/simply-scheme:2
( (lambda (x y z) (* x y z)) 5 6 7)
(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (fx x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
(define (square a) (* a a))


(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((> test-value 0)
                 (search f neg-point midpoint))
                ((< test-value 0)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (< a-value 0) (> b-value 0))
           (search f a b))
          ((and (< b-value 0) (> a-value 0))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))
           
         

(define (average x y) (/ (+ x y) 2))

(define (close-enough? x y)
  (< (abs (- x y)) 0.00001))

(define (cube x) (* x x x))

(half-interval-method sin 4.0 2.0)

(half-interval-method (lambda (x) (- (cube x) (* 2 x) 3)) 1.0 2.0)