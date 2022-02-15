(#%require "Graphics.rkt")

;Position adt

(define (make-adt-position x y)
  
  (define (x! new-x)
    (set! x new-x))
  (define (y! new-y)
    (set! y new-y))

  (define (same-pos? position)
    (and (= x (position 'x))
         (= y (position 'y))))
  ;HITBOXES
  (define (hitbox-scorpion? position)
    (and (<=(abs(- x (-(position 'x)60)))50)
         (<=(abs(- y (-(position 'y)50)))35)))

  ;(- x 60) and (- y 50) are here because the image of scorpion-adt is dislocatad with actual position
  
  (define (hitbox-egg? position)
    (and (<=(abs(- x (position 'x)))45)
         (<=(abs(- y (position 'y)))20)))

  (define (hitbox-block? position);51 boven ;70 links ;27 rechts ;20 onder
   (and (<=(abs(- x (+(position 'x)23)))45)
         (<=(abs(- y (+(position 'y)13)))32)))


  (define (move direction)
    (cond ((eq? direction 'up) (make-adt-position x (- y 1)))
          ((eq? direction 'down) (make-adt-position x (+ y 1)))
          ((eq? direction 'left) (make-adt-position (- x 1) y))
          ((eq? direction 'right) (make-adt-position (+ x 1) y))))

  (define (dispatch-position msg)
    (cond ((eq? msg 'x) x)
          ((eq? msg 'y) y)
          ((eq? msg 'x!) x!)
          ((eq? msg 'y!) y!)
          ((eq? msg 'move) move)
          ((eq? msg 'hitbox-scorpion?) hitbox-scorpion?)
          ((eq? msg 'hitbox-egg?) hitbox-egg?)
          ((eq? msg 'hitbox-block?) hitbox-block?)
          ((eq? msg 'same-pos?) same-pos?)
          (else (display "ERROR:Position"))))    
  dispatch-position)

   

    