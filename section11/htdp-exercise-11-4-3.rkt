;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-4-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (product-from-minus-11 n)
  (cond ((= n -11) 1)
        (else (* n (product-from-minus-11 (sub1 n))))))

