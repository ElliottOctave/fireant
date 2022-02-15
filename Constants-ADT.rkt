;CONSTANTS-ADT

; Level-1
;matrix

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

; Move-procedures

 (define (Move-y! direction value)
    ((ant-position 'y!) (direction  (ant-position 'y) value)))
  (define (Move-x! direction value)
    ((ant-position 'x!) (direction  (ant-position 'x) value)))
