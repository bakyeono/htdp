;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-14-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (ssn name left right))

;; BT:
;; 1. false
;; 2. (make-node soc pn lft rgt)
;;    -> soc: 주민등록번호 (number)
;;    -> pn: 이름 (symbol)
;;    -> lft: 왼쪽 트리 BT
;;    -> rgt: 오른쪽 트리 BT

#|
(make-node 15 'd false (make-node 24 'i false false))
           <15, 'd>
                 \
               <24, 'i>


(make-node 15 'd (make-node 87 'h false false) false)
            <15, 'd>
              /
         <87, 'h>

|#

(define (contains-bt n bt)
  (cond ((false? bt) false)
        (else
         (or (= n (node-ssn bt))
             (contains-bt n (node-left bt))
             (contains-bt n (node-right bt))))))