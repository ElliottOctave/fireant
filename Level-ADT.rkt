(#%require "Graphics.rkt")
;LEVEL-ADT

(define (make-level-adt)
  (let ((ant-adt (make-adt-ant 500 408))
        (scorpion-adt (make-adt-scorpion 750 55));750 55
        ;scorpion image is dislocated (by: x+60 y+50) from actual position.
        ;So if the position is 500 400 the image of scorpion will be at aproximately 440 350
        (egg-adt (make-adt-egg 290 440)));325 460
            
    

    ; Kijk of de ant botst met de egg.
    
    (define (update-mier)
      (if scorpion-adt
          (let ((scorpion-position (scorpion-adt 'position)))                                   
            (if ((scorpion-position 'hitbox-scorpion?) (ant-adt 'position))
                (begin (display "GAME-OVER"))
                (if egg-adt
                    (let ((egg-position (egg-adt 'position)))                                   
                      (if ((egg-position 'hitbox-egg?) (ant-adt 'position))
                          (begin (display "EGG")))))))))
    ;                   (if block-adt
    ;                      (let ((block-position (block-adt 'position)))                                   
    ;                       (if ((block-position 'hitbox-block?) (ant-adt 'position))
    ;                          (begin (display "BLOCK"))))))))))))
        

 
    (define (type toets)
      (cond ((eq? toets 'up) ((ant-adt 'move-ant!)'up!)(update-mier))
            ((eq? toets 'right) ((ant-adt 'move-ant!)'right!)(update-mier));((draw-adt 'animation) 'set-next!)) 
            ((eq? toets 'left) ((ant-adt 'move-ant!)'left!)(update-mier))
            ((eq? toets 'down) ((ant-adt 'move-ant!)'down!)(update-mier))))



    
    ;Dispatch

    (define (dispatch-level msg)
      (cond ((eq? msg 'scorpion) scorpion-adt)
            ((eq? msg 'ant) ant-adt)
            ((eq? msg 'egg) egg-adt)
            ((eq? msg 'maze) maze-adt)
            ((eq? msg 'block) block-adt)
            ((eq? msg 'type) type)
            (else (display "ERROR:Level-ADT"))))
    dispatch-level))



        (define (loop-maze-p maze i j)
  (cond ((< i (vector-length maze))
         (cond ((< j (vector-length (vector-ref maze i)))
                (loop-maze-p maze i (+ j 1))
                (cond ((= 0 (vector-ref (vector-ref maze i) j))
                       (display (vector-ref (vector-ref maze i) j)))))                      
                      (else (loop-maze-p maze (+ i 1) 0))))))




 

;(define (loop-maze-o maze)
;  (let ((res '())
;        (i 0)
;        (j 0))
;    (cond ((< i (vector-length maze))
;           (set! j (+ j 1))
;           (loop-maze-o maze))
;           (cond ((< j (vector-length (vector-ref maze i)))
;                  (set! j (+ j 1))
;                  (loop-maze maze i (+ j 1))
;                  (cond ((= 0 (vector-ref (vector-ref maze i) j))
;                         (display  (vector-ref (vector-ref maze i) j)))))
;                      (else (set! i (+ i 1))
;                            (set! j 0)
;                            (loop-maze-o maze))))))











(define (teken-matrix)
  (define (dummy) 
    (define (hulp kollom rij)
      (if (< kollom (* 35 i))
          (if (< rij (* 35 j))
              (if (= (vector-ref (vector-ref doolhof (/ rij 35)) (/ kollom 35)) 0)
                  (begin
                    ((doolhof-tile 'draw-rectangle) kollom rij 35 35 "black")
                    (hulp (+ kollom cel-breedte-px) rij))
                  (begin
                    ((doolhof-tile 'draw-rectangle) kollom rij 35 35 "brown")
                    (hulp (+ kollom cel-breedte-px) rij))))
          (hulp 0 (+ rij cel-hoogte-px))))
    (hulp 0 0))
  (dummy)
  
  ((doolhof-laag 'add-drawable) doolhof-tile))

(define my-maze-tile (make-tile 1000 1000))

(define (draw-matrix maze i j)
  (if (< i 20)
      (cond ((< j 20)
             (draw-matrix maze i (+ j 1))
             (cond ((= 0 (vector-ref (vector-ref maze i) j))
                    ((my-maze-tile 'draw-rectangle) (* j 45) (* i 45)  45 45 "sienna"))))                       
            (else (draw-matrix maze (+ i 1) 0)))))
      
      



;((mijn-tile 'draw-rectangle) 10 10 180 80 "red")

(define (loop-maze-o maze i j)
  (cond ((< i (vector-length maze))
         (cond ((< j (vector-length (vector-ref maze i)))
                (loop-maze-o maze i (+ j 1))
                (cond ((= 0 (vector-ref (vector-ref maze i) j))
                       (display (vector-ref (vector-ref maze i) j)))))                      
               (else (loop-maze-o maze (+ i 1) 0))))))


(define matrix (vector
                (vector 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0)
                (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0)
                (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0)
                (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 2)
                (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 2)
                (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 2)
                (vector 0 1 1 0 1 1 1 1 0 0 1 1 0 0 0 0 0 0 0 0)
                (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0)
                (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0)
                (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
                (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 0)
                (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)
                (vector 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)))
