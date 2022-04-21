#lang planet dyoo/simply-scheme:2
;Exercise 1.11
(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3)))))))

(define (f-iterator n)
  (define (f-iter a b c count)
    (cond ((< n 3) n)
          ((= count 0) a)
          (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (f-iter 2 1 0 (- n 2)))