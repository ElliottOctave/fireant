(#%require "Graphics.rkt")

;DRAW-ADT


(define (make-adt-draw)
  (let ((venster (make-window 1000 1000 "Fire-Ant")))

    
  
    ;Background color
    
    ((venster 'set-background!) "blue")


    ;Ant-Draw

    ;    (define ant-layer (venster 'make-layer))
    
    (define draw-ant (venster 'make-layer))
    (define ant-tile
      (make-tile 75 75 "Images/Ant.png" "Images/Ant-mask.png"))
    ;(define ant-tile2
    ; (make-tile 500 500 "Images/Ant2.png" "Images/Ant-mask2.png"))
    ;((draw-ant 'add-drawable) ant-tile2)
    ((draw-ant 'add-drawable) ant-tile)


    ;    (define draw-test-laag (venster 'make-layer))
    ;   (define test-tile (make-tile 45 45 "Images/Block.png" "Images/Block-mask.png"))
    ;  ((test-tile 'draw-rectangle) 45 45 100 100 "red")
    ; ((draw-test-laag 'add-drawable) test-tile)


    ;Animatie-Ant
    
    (define animation
      (make-tile-sequence '(ant-tile ant-tile2)))
    

    ;Ant-object

    (define (draw-ant! ant-adt)
      (if ant-adt
          (draw-object! ant-adt ant-tile)))

    ;Egg-Draw
    (define layer-static (venster 'make-layer))
    
    (define egg-tile
      (make-tile 200 200 "Images/Egg.png" "Images/Egg-mask.png"))
    ((layer-static 'add-drawable) egg-tile)

    ; Blok-draw
    
   
    
    (define (loop-pos-list list)
      (cond ((not (null? list))
             (display (car list))
             ((layer-static 'add-drawable (make-tile ((car list)  'x) ((car list) 'y) "Images/Block.png" "Images/Block-mask.png")))
             (loop-pos-list (cdr list)))))
    
    



      (define (loop-maze maze i j)
        (let ((result '()))
          (cond ((< i (vector-length maze))
                 (cond ((< j (vector-length (vector-ref maze i)))
                        (loop-maze maze i (+ j 1))
                        (cond ((= 0 (vector-ref (vector-ref maze i) j))
                               (set! result (append (result (list (make-adt-block (* j 45) (* i 45)))))))))
                       (else (loop-maze maze (+ i 1) 0)))))))


           
    

         
      ;Egg-object

      (define (draw-egg! egg-adt)
        (if egg-adt
            (draw-object! egg-adt egg-tile)))

    
      ;Scorpion-draw
  
      (define draw-scorpion (venster 'make-layer))
      (define scorpion-tile
        (make-tile 200 200 "Images/Scorpion.png" "Images/Scorpion-mask.png"))
      ((draw-scorpion 'add-drawable) scorpion-tile)

      ;Scorpion-object

      (define (draw-scorpion! scorpion-adt)
        (if scorpion-adt
            (draw-object! scorpion-adt scorpion-tile)))

          ;Maze-draw

    (define maze-layer (venster 'make-layer))
    (define maze-tile
      (make-tile 1000 1000))
    

 (define (draw-matrix maze i j)
  (if (< i 20)
      (cond ((< j 20)
             (draw-matrix maze i (+ j 1))
             (cond ((= 0 (vector-ref (vector-ref maze i) j))
                    ((maze-tile 'draw-rectangle) (* j 45) (* i 45)  45 45 "sienna"))))                       
            (else (draw-matrix maze (+ i 1) 0)))))

((maze-layer 'add-drawable) maze-tile)
    
    (define (draw-maze)
        (draw-matrix matrix 0 0))
    ;Maze-object
    
    (define (draw-maze! maze-adt)
      (if maze-adt
          (draw-object! maze-adt maze-tile)))
    


   
    
      ;; Level
    
    
      ;; draw-level!
    
      (define (draw-level! level-adt)
        (draw-ant! (level-adt 'ant))
        (draw-scorpion! (level-adt 'scorpion))
        (draw-egg! (level-adt 'egg))
        (draw-maze))
      ;(draw-block! (level-adt 'block)))

      ;; draw-object!
    
      (define (draw-object! obj tile)
        (let* ((obj-x ((obj 'position) 'x))
               (obj-y ((obj 'position) 'y))
               (cell-breadth-px 1)
               (cell-height-px 1)
               (screen-x (* cell-breadth-px obj-x))
               (screen-y (* cell-height-px obj-y)))
          ((tile 'set-x!) screen-x)
          ((tile 'set-y!) screen-y)))


      ;; Callbacks

      ;; set-game-loop-function!
      (define (set-game-loop-function! fun)
        ((venster 'set-update-callback!) fun))
    
      ;; set-key-function!
  
      (define (set-key-function! fun)
        ((venster 'set-key-callback!) fun))
    
      ;; Dispatch
   
  
      (define (dispatch-draw-adt msg)
        (cond ((eq? msg 'set-key-function!) set-key-function!)
              ((eq? msg 'set-game-loop-function!) set-game-loop-function!)
              ((eq? msg 'draw-level!) draw-level!)
              ((eq? msg 'animation) animation)
              ((eq? msg 'draw-maze!) (draw-maze!))
              (else (display "ERROR:DRAW-ADT"))))
      dispatch-draw-adt))




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
  
  (define (loop-maze-ii maze i j)
    (let ((result '()))
      (cond ((< i (vector-length maze))
             (cond ((< j (vector-length (vector-ref maze i)))
                    (loop-maze-ii maze i (+ j 1))
                    (cond ((= 0 (vector-ref (vector-ref maze i) j))
                           (set! result (append (result (list (make-adt-block (* j 45) (* i 45)))))))))
                   (else (loop-maze-ii maze (+ i 1) 0)))))))
       
  