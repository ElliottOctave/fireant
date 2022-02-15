;MAZE-ADT

;
;
;(define (make-maze-adt)
; (let* ())
;
;(define maze
;  (vector
;   (vector 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0)
;   (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0)
;   (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0)
;   (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 2)
;   (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 2)
;   (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 2)
;   (vector 0 1 1 0 1 1 1 1 0 0 1 1 0 0 0 0 0 0 0 0)
;   (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0)
;   (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0)
;   (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 0 1 1 0 0 0 0 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 0)
;   (vector 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)
;   (vector 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;   )
;  )
;  
;  (define (matrix-to-blocks matrix i j)
;    (let ((result '()))
;      (cond ((< i (vector-length matrix))
;             (cond ((< j (vector-length (vector-ref matrix i)))
;                    (loop-maze matrix i (+ j 1))
;                    (cond ((= 0 (vector-ref (vector-ref matrix i) j))
;                           (set! result (append result (list (make-adt-block (* j 45) (* i 45) )))))))
;                   (else (loop-maze matrix (+ i 1) 0)))))
;      result))
;)
;

;maak vierkant, hitbox vierkant, image.

;(define MAP-LIST
;  (let ((i 0)
;        (j 0)
;        (lst '())
;        (bd matrix))
;    (begin 
;      (let loop-i()
;        (when (< i 14)
;          (begin
;            (set! bd (vector-ref matrix i))
;            (let loop-j()
;              (when (< j 13)
;                (begin
;                  (if (= 1 (vector-ref bd j))
;                      (set! lst (append lst (list (make-pos j i)) ))
;                      void)
;                  (set! j (+ 1 j))
;                  (loop-j))))
;            (set! i (+ 1 i))
;            (set! j 0)
;            (loop-i))))
;      lst)))


;        (define (loop-maze maze i j)
;  (cond ((< i (vector-length maze))
;         (cond ((< j (vector-length (vector-ref maze i)))
;                (loop-maze maze i (+ j 1))
;                (cond ((= 0 (vector-ref (vector-ref maze i) j))
;                       (display (vector-ref (vector-ref maze i) j)))))                      
;                      (else (loop-maze maze (+ i 1) 0))))))


(define (loop-maze maze i j)
  (cond ((< i (vector-length maze))
         (cond ((< j (vector-length (vector-ref maze i)))
                (loop-maze maze i (+ j 1))
                (cond ((= 0 (vector-ref (vector-ref maze i) j))
                        ((make-adt-block (* j 45) (* i 45)) 'hitbox-block?) (ant-adt 'position))))
                      (else (loop-maze maze i (+ j 1)))))
                      (else (loop-maze maze (+ i 1) 0))))