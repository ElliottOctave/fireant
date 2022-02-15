(load "Position ADT.rkt")
(load "Helpprocedures-ADT.rkt")

(define (make-adt-ant horizontal vertical)
  (let* ((ant-position (make-adt-position horizontal vertical)))

    ;  (begin
    ;           ((draw-adt 'animation) 'set-next!) 

    (define (move-ant! key)
      (cond
        ((eq? key 'right!)(Move-x! + 10))
        ((eq? key 'left!)(Move-x! - 10))
        ((eq? key 'down!)(Move-y! + 10))
        ((eq? key 'up!)(Move-y! - 10))))

    (define (Move-y! direction value)
    ((ant-position 'y!) (direction  (ant-position 'y) value)))
  (define (Move-x! direction value)
    ((ant-position 'x!) (direction  (ant-position 'x) value)))

  ;test move-ant! with link in maze
  ;     (define (move-ant! key)
  ;      (let*((position-ant-x (ant-position 'x)); x-position of ant
  ;           (position-ant-y (ant-position 'y)); y-position of ant
  ;           (position-ant-maze-x (vector-ref (vector-ref make-maze-adt position-ant-y) position-ant-x)); x-position of ant in maze
  ;           (position-ant-maze-y (vector-ref make-maze-adt position-ant-y))); y-position of ant in maze
  ;        (cond
  ;          ((and(eq? key 'right!) (= position-ant-maze-x 1))  (Move-right!))
  ;          
  ;          ((and(eq? key 'left!) (= position-ant-maze-x 1))   (Move-left!))
  ;          
  ;          ((and(eq? key 'down!) (= position-ant-maze-y 1))  (Move-down!))
  ;
  ;          ((and(eq? key 'up!) (= position-ant-maze-y 1)) (Move-up!)))))

  (define (equal-pos-ant? position)
    (and (eq? (ant-position 'x) (position 'x))
         (eq? (ant-position 'y) (position 'y))))



    
  ;this procedure will see if the ant is colliding or not with the maze

    
  ;     (define (ant-same-pos-maze? ant)
  ;      (let((position-ant-x ((ant 'position) 'x)); x-position of ant
  ;          (position-ant-y ((ant 'position) 'y)); y-position of ant
  ;         (position-ant-maze-x (vector-ref (vector-ref maze position-ant-y) position-ant-x)); x-position of ant in maze
  ;        (position-ant-maze-y (vector-ref maze position-ant-y))); y-position of ant in maze
  ;    (cond ((eq? position-ant-maze-x 0)(previous-pos)); Here the ant touches a wall
  ;         ((eq? position-ant-maze-x 1)); Here nothing happens because ant is on the path
  ;        ((eq? position-ant-maze-x 2)(display "Level-completed"))
  ;       (else (display "Error: Maze-ant-same-pos?")))))
    
                     


    
  (define (dispatch-ant msg)
    (cond ((eq? msg 'move-ant!) move-ant!)
          ((eq? msg 'equal-pos-ant) equal-pos-ant)
          ((eq? msg 'position) ant-position)
          (else (display "ERROR:Ant-ADT"))))
  dispatch-ant))

