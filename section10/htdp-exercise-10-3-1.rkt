;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-3-1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define-struct circle (center radius color))
;; A circle is a structure:
;; (make-circle (center radius))
;; where center is a posn, radius a number, color a symbol.

(define-struct rectangle (nw width height color))
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
  (cond ((circle? a-shape) (draw-a-circle a-shape))
        ((rectangle? a-shape) (draw-a-rectangle a-shape))))

(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (draw-a-rectangle a-rectangle)
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
  (cond ((circle? a-shape) (clear-a-circle a-shape))
        ((rectangle? a-shape) (clear-a-rectangle a-shape))))

(define (clear-a-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               'white))

(define (clear-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-nw a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   'white))

;; draw-and-clear-shape
(define (draw-and-clear-shape a-shape)
  (cond ((circle? a-shape) (draw-and-clear-a-circle a-shape))
        ((rectangle? a-shape) (draw-and-clear-a-rectangle a-shape))))

(define (draw-and-clear-a-circle a-circle)
  (and (draw-a-circle a-circle)
       (sleep-for-a-while 1)
       (clear-a-circle a-circle)))

(define (draw-and-clear-a-rectangle a-rectangle)
  (and (draw-a-rectangle a-rectangle)
       (sleep-for-a-while 1)
       (clear-a-rectangle a-rectangle)))

;; move-shape
(define (move-shape delta a-shape)
  (cond ((circle? a-shape) (move-circle delta a-shape))
        ((rectangle? a-shape) (move-rectangle delta a-shape))))

;; move-circle : number circle  ->  circle
;; to draw and clear a circle, translate it by delta pixels
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-a-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

;; move-rectangle : number rectangle  ->  rectangle
;; to draw and clear a rectangle, translate it by delta pixels
(define (move-rectangle delta a-rectangle)
  (cond
    [(draw-and-clear-a-rectangle a-rectangle) 
     (translate-rectangle a-rectangle delta)]
    [else a-rectangle]))

;; FACE : 얼굴 형태를 나타내는, shape의 리스트
(define FACE
  (cons
   (make-circle (make-posn 50 50)
                40
                'red)
   (cons
    (make-rectangle (make-posn 30 20)
                    5
                    5
                    'blue)
    (cons
     (make-rectangle (make-posn 65 20)
                     5
                     5
                     'blue)
     (cons
      (make-rectangle (make-posn 40 75)
                      20
                      10
                      'red)
      (cons
       (make-rectangle (make-posn 45 35)
                       10
                       30
                       'blue)
       empty))))))

;; fun-for-losh : list-of-shape -> ...
;; template for list of shape
(define (fun-for-losh lst)
  (cond ((empty? lst) ...)
        (else ...
         (first lst) ...
         (rest lst) ...)))



;; draw
(start 300 100)
