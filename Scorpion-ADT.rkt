
;SCORPION ADT

(define (make-adt-scorpion horizontal vertical)
  (let* ((scorpion-position (make-adt-position horizontal vertical)))
  


  ;Direction of scorpion
  
  (define (set-direction! d)
    (set! direction d))

;MOVE SCORPION
    ; (define (move!)
     ; (((scorpion-position 'x!) (-  (scorpion-position 'x) 10))))


    ;position

  
  (define (positie! nieuwe-positie)
    (set! positie nieuwe-positie))

   (define (dispatch-scorpion msg)
    (cond ((eq? msg 'set-direction!) set-direction!)
          ((eq? msg 'position) scorpion-position)
          ((eq? msg 'move!) move!)
          (else (display "ERROR:Scorpion-ADT"))))
  dispatch-scorpion))

