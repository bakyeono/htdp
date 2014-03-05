;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-4-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-structure circle (center radius color))
;; A circle is a structure:
;; (make-circle (center radius))
;; where center is a posn, radius a number, color a symbol.

(define-structure rectangle (nw width height color))
;; A rectangle is a structure:
;; (make-rectangle (nw width height)
;; where nw is a posn, width a number, height a number, color a symbol.

;; A shape is either
;; 1. circle, or
;; 2. rectangle.

;; template for shape
;; shape -> ???
(define (fun-for-shape a-shape)
  (cond ((circle? a-shape) ...)
        ((rectangle? a-shape) ...)))

;; draw-shape
(define (draw-shape a-shape)
  (cond ((circle? a-shape) (draw-circle a-shape))
        ((rectangle? a-shape) (draw-rectangle a-shape))))

(define (draw-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (draw-rectangle a-rectangle)
  (draw-solid-rect (rectangle-nw a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   (rectangle-color a-rectangle)))

;; translate-shape
(define (translate-shape a-shape delta)
  (cond ((circle? a-shape) (translate-circle a-shape delta))
        ((rectangle? a-shape) (translate-rectangle a-shape delta))))

(define (translate-circle a-circle delta)
  (make-circle (make-posn (+ (posn-x (circle-center a-circle)) delta)
                          (posn-y (circle-center a-circle)))
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (translate-rectangle a-rectangle delta)
  (make-rectangle (make-posn (+ (posn-x (rectangle-nw a-rectangle)) delta)
                             (posn-y (rectangle-nw a-rectangle)))
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; clear-shape
(define (clear-shape a-shape)
  (cond ((circle? a-shape) (clear-circle a-shape))
        ((rectangle? a-shape) (clear-rectangle a-shape))))

(define (clear-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               'white))

(define (clear-rectangle a-rectangle)
  (draw-solid-rect (rectangle-nw a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   'white))

;; draw-and-clear-shape
(define (draw-and-clear-shape a-shape)
  (cond ((circle? a-shape) (draw-and-clear-circle a-shape))
        ((rectangle? a-shape) (draw-and-clear-rectangle a-shape))))

(define (draw-and-clear-circle a-circle)
  (and (draw-circle a-circle)
       (sleep-for-a-while 1)
       (clear-circle a-circle)))

(define (draw-and-clear-rectangle a-rectangle)
  (and (draw-rectangle a-rectangle)
       (sleep-for-a-while 1)
       (clear-rectangle a-rectangle)))