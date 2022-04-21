#lang planet dyoo/simply-scheme:2


((lambda (a b)
   ((lambda (square)
      (+ (square a) (square b)))
    (lambda (x) (* x x))))
 3 4)


(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

;You use a Y-Combinator to construct a recursive function when you can't call it
;I honestly don't understand how this works.

(((lambda (f) (lambda (n) (f f n)))
  (lambda (fun x)
    (if (= x 0)
        1
        (* x (fun fun (- x 1)))))) 5)
   
 