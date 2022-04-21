#lang planet dyoo/simply-scheme:2
(define (ordered? nums)
  (if (= (count nums) 1)
      #t
      (if (> (first nums) (first (butfirst nums)))
          #f
          (ordered? (butfirst nums)))))
      
      
       