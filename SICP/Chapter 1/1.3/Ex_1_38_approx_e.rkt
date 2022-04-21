#lang planet dyoo/simply-scheme:2
;Exercise 1.38

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 0))

(define (e k)
  (define (d i)
    (if (= (remainder i 3) 2)
        (/ (+ i 1) 1.5)
        1))
  (+ 2 (cont-frac (lambda (i) 1.0) d 100)))

(define (e-old k)
  (define (d i)
    (if (= (remainder i 3) 0)
        (+ (* 2 (/ i 3)) 2)
        1))
  (+ 2 (/ 1
          (+ 1 (/ 1
                  (+ 2 (cont-frac (lambda (i) 1.0) d 100)))))))

(e 100)
(e-old 100)

;Instead of ignoring the first 2 terms and starting the pattern as 1,1,4,1,1,6...
