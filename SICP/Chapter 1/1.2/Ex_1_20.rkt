#lang planet dyoo/simply-scheme:2
;Exercise 1.20
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;Normal order eval of gcd(206 40):
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;12 remainder operations -> should be 18? I think I missed
;The point of this exercise - related to the k steps of fibonacci sequence
;Applicative order eval of gcd(206 40):
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)
;
;