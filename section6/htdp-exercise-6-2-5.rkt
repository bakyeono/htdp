;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-2-5) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; dimensions of traffic light
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;; the positions of the bulbs 
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

;; drawing functions
(define (bulb-posn color)
  (cond ((symbol=? color 'red) (make-posn X-BULBS Y-RED))
        ((symbol=? color 'yellow) (make-posn X-BULBS Y-YELLOW))
        ((symbol=? color 'green) (make-posn X-BULBS Y-GREEN))))

(define (clear-bulb color)
  (and (draw-solid-disk (bulb-posn color) BULB-RADIUS 'white)
       (draw-circle (bulb-posn color) BULB-RADIUS color)))

(define (draw-bulb color)
  (draw-solid-disk (bulb-posn color) BULB-RADIUS color))

(define (switch off-color on-color)
  (and (clear-bulb off-color)
       (draw-bulb on-color)))

;; next : symbol  ->  symbol
;; to switch a traffic light's current color and to return the next one 
(define (next current-color)
  (cond
    [(and (symbol=? current-color 'red) (switch 'red 'green))
     'green]
    [(and (symbol=? current-color 'yellow) (switch 'yellow 'red))
     'red]
    [(and (symbol=? current-color 'green) (switch 'green 'yellow))
     'yellow]))

;; draw
(start WIDTH HEIGHT)
(draw-bulb 'red)
(next (next (next (next 'red))))
