(#%require (only racket random))
(#%require "Graphics.rkt")

;GAME


(load "Position ADT.rkt")
(load "Ant-ADT.rkt")
(load "Scorpion-ADT.rkt")
(load "Maze-Adt.rkt")
(load "Level-ADT.rkt")
(load "Draw ADT.rkt")
(load "Game-ADT.rkt")
(load "Egg-ADT.rkt")
(load "Block-ADT.rkt")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Launch Game                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define game (make-adt-game))
((game 'start))

;hitbox van blok moet nog fixen

