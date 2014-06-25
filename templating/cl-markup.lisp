(declaim (optimize (speed 3) (debug 0)))

(ql:quickload :cl-markup)

(defparameter +list+ (loop for i from 0 to 10000 collecting i))
(defparameter +dict+ (let ((table (make-hash-table)))
                       (loop for item in +list+ do
                         (setf (gethash item table) item))
                       table))

(setf markup:*output-stream* (make-string-output-stream))

(defun template ()
  (markup:markup
   (:ol
    (loop for item in +list+ do
      (markup:markup (:li item))))
   (:dl
    (loop for key being the hash-keys of +dict+
          for value being the hash-values of +dict+
          do
             (markup:markup (:dt key)
                            (:dd value))))))

(compile 'template)

(let ((start (get-internal-real-time)))
  (template)
  (format t "cl-markup: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
