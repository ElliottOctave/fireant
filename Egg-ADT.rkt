; Egg-ADT
;
(define (make-adt-egg horizontal vertical)
  (let* ((egg-position (make-adt-position horizontal vertical)))
 
  (define (dispatch-egg msg)
    (cond ((eq? msg 'position) egg-position)
          (else (display "ERROR:EGG"))))
  dispatch-egg))

