(declaim (optimize (speed 3) (debug 0)))

(ql:quickload :cl-who)

(defparameter +list+ (loop for i from 0 to 10000 collecting i))
(defparameter +dict+ (let ((table (make-hash-table)))
                       (loop for item in +list+ do
                         (setf (gethash item table) item))
                       table))

(defparameter *stream* (make-string-output-stream))

(defun template ()
  (who:with-html-output (*stream*)
    (:ol
     (loop for item in +list+ do
       (who:htm (:li (who:str item)))))
    (:dl
     (loop for key being the hash-keys of +dict+
           for value being the hash-values of +dict+
           do
              (who:htm (:dt (who:str key))
                       (:dd (who:str value)))))))

(compile 'template)

(let ((start (get-internal-real-time)))
  (template)
  (format t "cl-markup: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
