#lang planet dyoo/simply-scheme:2
;Exercise 2
(define (every f sent)
  (if (empty? sent)
      '()
      (se (f (first sent)) (every f (bf sent)))))


(every first '(nowhere man))


