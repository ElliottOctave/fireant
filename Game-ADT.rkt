;GAME-ADT



;Make-adt-game

(define (make-adt-game)
  (let ((level-adt (make-level-adt))
        (draw-adt (make-adt-draw))
        (scorpion-adt (make-adt-scorpion 750 55)))
    
;key-procedure
    
    (define (key-procedure status key)
      (if (eq? status 'pressed)
          (begin
            ((draw-adt 'animation) 'set-next!)  
          ((level-adt 'type) key))))
    
;game-loop-procedure
    
    (define (game-loop-procedure delta-time)
      ((draw-adt 'draw-level!) level-adt))
      ;((scorpion-adt 'move!)))
    
      

;start-game
    
    (define (start)
      ((draw-adt 'set-game-loop-function!) game-loop-procedure)
      ((draw-adt 'set-key-function!) key-procedure))
    
    ;Dispatch
    (define (dispatch-game msg)
      (cond ((eq? msg 'start) start)
            ((eq? msg 'level) level-adt)
            (else (display "ERROR:Game-ADT"))))    
    dispatch-game))