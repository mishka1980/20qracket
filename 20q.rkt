#lang sicp

#|

every node of the tree is of the form
Question Yes No.

                 Is it black?
                  /        \
                (Yes)     (No) 
                /           \
             Pigeon?         | 
             /   \           \
            I win I loose   Is it red?
                            /         \
                        Cardinal?     mockingbird?
                        /  \           /    \
                    I win  I loose  I win   I loose

|#

(define examplenodes (list "Is it black?"
                           (list "Is it a Pigeon?" "I win!" "I loose!")
                           (list "Is it red?"
                                 (list "Is it a Cardinal?" "I win!" "I loose!")
                                 (list "Is it a mockingbird?" "I win!" "I loose!"))))
;Example tree for 20q

;----------------
;Every node is of the form (QUESTION YES-BRANCH NO-BRANCH)
;YES-BRANCH and NO-BRANCH can themselves be nodes
;QUESTION is a string

(define (question node) (car node))
(define (yes-answer node) (cadr node))
(define (no-answer node) (caddr node))
;-------------

(define (win-function in)
  (display "I win! \nGood Game."))

(define (loose-function input)
  (begin
       (display "What was your animal? \n")
       (define inmind (read))
       (display "What was a question I could've asked to guess? \nPlease remember quotation marks \n")
       (define potentialq (read))
       (display "Thank you!")
  )

)

(define (final-message node)
  (cond
    [(eq? node "I win!") (win-function "hi")]
    [(eq? node "I loose!") (loose-function "hi")]
  ))
;final message for tree (I win or loose)

(define (ask-for-question node)
  (begin (display (string-append (question node) "\n"))
         (define ans (read))
         (if (or (eq? ans 'yes)
                 (eq? ans 'y)
                 (eq? ans 'Yes))
             (ask (yes-answer node)))
         (if (or (eq? ans 'no)
                 (eq? ans 'n)
                 (eq? ans 'No))
             (ask (no-answer node)))
         ))
;Asks if a question,
;Gets Yes or No input, and continues down the tree

(define (ask node)
  (if (list? node)
      (ask-for-question node)
      (final-message node)))
;final ask question

(ask examplenodes)

;NEXT MAJOR PROBLEM- MAKE IT LEARN
;YOU HAVE AN INPUT
