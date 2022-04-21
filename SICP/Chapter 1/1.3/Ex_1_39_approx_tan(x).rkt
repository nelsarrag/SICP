#lang planet dyoo/simply-scheme:2

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 0))

(define (tan-cf x k)
  (let ((X (- (* x x))))
    (/ (- (cont-frac
           (lambda (i) X)
           (lambda (i)
             (+ i (- i 1))) ;or 2i - 1 loll
           k))
       x)))

(tan-cf (/ 3.141592653589 4) 100)