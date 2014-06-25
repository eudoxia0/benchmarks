(declaim (optimize (speed 3) (debug 0)))

(ql:quickload :cl-who)

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

(defparameter *stream* (make-string-output-stream))

(defun list-template ()
  (who:with-html-output (*stream*)
   (:table
    (loop for row in +table+ do
      (who:htm
       (:tr
        (loop for cell in row do
          (who:htm (:td (who:str cell))))))))))

(defun vector-template ()
  (who:with-html-output (*stream*)
   (:table
    (loop for row across +vector-table+ do
      (who:htm
       (:tr
        (loop for cell across row do
          (who:htm (:td (who:str cell))))))))))

(compile 'list-template)
(compile 'vector-template)

(let ((start (get-internal-real-time)))
  (list-template)
  (format t "cl-who: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))

(let ((start (get-internal-real-time)))
  (vector-template)
  (format t "cl-who: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
