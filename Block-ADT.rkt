;Maze-Block-adt

(define (make-adt-block horizontal vertical)
  (let* ((block-position (make-adt-position horizontal vertical)))
 
    (define (dispatch-block msg)
      (cond ((eq? msg 'position) block-position)
            (else (display "ERROR:BLOCK"))))
    dispatch-block))
