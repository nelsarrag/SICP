#lang planet dyoo/simply-scheme:2
;Exercise 1.26
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))

;Rather than calling square, he calls the method recursively twice, and multiplies
;the result. This transforms it from logn to n because this becomes a tree
;recursive problem. The complexity of tree recursion grows exponentially with
;the depth of the tree (remember Fibonacci inefficiencies).
;Since the depth of the tree is log(n), then they "cancel" and it becomes
;linear with N? Better expanation below I think:
;Alternatively, assuming each *expmod n expmod n takes a steps, then doubling
;input gives us *expmod 2n *expmod 2n =
;(* expmod n * expmod n) (expmod n * expmod n)
;which is 2a steps, so doubling the val doubled the # of steps = O(n) growth