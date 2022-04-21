#lang planet dyoo/simply-scheme:2
(define (ends-e sent)
  (cond ((empty? sent) '())
        ((equal? (last (first sent)) 'e)
         (se (first sent)
         (ends-e(butfirst sent))))
        (else (ends-e (butfirst sent)))))
