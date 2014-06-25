(declaim (optimize (speed 3) (debug 0)))

(ql:quickload :cl-markup)

(defparameter +table+
  (loop for i from 0 to 999 collecting
        (loop for i from 0 to 9 collecting i)))

(defparameter +vector-table+
  (loop with array = (make-array 1000 :fill-pointer 0)
        for i from 0 to 999 do
          (vector-push
           (loop with array = (make-array 10 :fill-pointer 0)
                 for i from 0 to 9 do
                   (vector-push i array)
                 finally (return array))
           array)
        finally (return array)))

(setf markup:*output-stream* (make-string-output-stream))

(defun list-template ()
  (markup:markup
   (:table
    (loop for row in +table+ do
      (markup:markup
       (:tr
        (loop for cell in row do
          (markup:markup (:td cell)))))))))

(defun vector-template ()
  (markup:markup
   (:table
    (loop for row across +vector-table+ do
      (markup:markup
       (:tr
        (loop for cell across row do
          (markup:markup (:td cell)))))))))

(compile 'list-template)
(compile 'vector-template)

(let ((start (get-internal-real-time)))
  (list-template)
  (format t "cl-markup: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))

(let ((start (get-internal-real-time)))
  (vector-template)
  (format t "cl-markup: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
