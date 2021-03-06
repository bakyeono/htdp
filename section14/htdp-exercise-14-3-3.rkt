;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-14-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; WP(web-page) is either:
;; 1. empty
;; 2. (cons s wp) / s : symbol / wp : WP
;; 3. (cons ewp wp) / esp, wp : WP


;; examples
(define wp1
  '(The TeachScheme! Project aims to improve the
        problem-solving and organization skills of high
        school students. It provides software and lecture
        notes as well as exercises and solutions for teachers.))

(define wp2
  '(The TeachScheme Web Page
        Here you can find: 
        (LectureNotes for Teachers)
        (Guidance for (DrScheme: a Scheme programming environment))
        (Exercise Sets)
        (Solutions for Exercises)
        For further information: write to scheme@cs))

#|
;; template
(define (fun-for-wp a-wp)
  (cond ((empty? a-wp) ...)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp)) ... (first a-wp) ... (fun-for-wp (rest a-wp)) ...)
               ((cons? (first a-wp)) ... (fun-for-wp (first a-wp)) ... (fun-for-wp (rest a-wp)) ...)
               (else (error 'fun-for-wp "invalid WP"))))
        (else (error 'fun-for-wp "invalid WP"))))
|#

;; size : WP -> number
;; a-wp에 들어 있는 기호의 수를 센다.
(define (size a-wp)
  (cond ((empty? a-wp) 0)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp)) (+ 1 (size (rest a-wp))))
               ((cons? (first a-wp)) (+ (size (first a-wp)) (size (rest a-wp))))
               (else (error 'fun-for-wp "invalid WP"))))
        (else (error 'size "invalid WP"))))

;; occurs1
(define (occurs1 a-wp s)
  (cond ((empty? a-wp) 0)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp))
                (cond ((symbol=? (first a-wp) s) (+ 1 (occurs1 (rest a-wp) s)))
                      (else (occurs1 (rest a-wp) s))))
               ((cons? (first a-wp)) (occurs1 (rest a-wp) s))
               (else (error 'occurs1 "invalid WP"))))
        (else (error 'occurs1 "invalid WP"))))

;; occurs2
(define (occurs2 a-wp s)
  (cond ((empty? a-wp) 0)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp))
                (cond ((symbol=? (first a-wp) s) (+ 1 (occurs2 (rest a-wp) s)))
                      (else (occurs2 (rest a-wp) s))))
               ((cons? (first a-wp)) (+ (occurs2 (first a-wp) s) (occurs2 (rest a-wp) s)))
               (else (error 'occurs2 "invalid WP"))))
        (else (error 'occurs2 "invalid WP"))))

;; replace
(define (replace new old a-wp)
  (cond ((empty? a-wp) empty)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp))
                (cond ((symbol=? (first a-wp) old) (cons new (replace new old(rest a-wp))))
                      (else (cons (first a-wp) (replace new old (rest a-wp))))))
               ((cons? (first a-wp)) (cons (replace new old (first a-wp)) (replace new old (rest a-wp))))
               (else (error 'replace "invalid WP"))))
        (else (error 'replace "invalid WP"))))

;; examples
(replace 'z 'a empty)
(replace 'z 'a (list 'a 'b 'c 'd 'a 'b 'c))
(replace 'z 'a (list (list 'a 'b 'c 'd)))
(replace 'z 'a (list 'a 'b (list 'a 'b 'c 'd) 'c 'd))
(replace 'z 'a (list (list (list 'a) 'b (list 'a 'b) 'c 'd)))
