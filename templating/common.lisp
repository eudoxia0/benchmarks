(in-package :benchmarks)

(declaim (optimize (speed 3) (debug 0)))

(defparameter +list+ (loop for i from 0 to 10000 collecting i))
(defparameter +dict+ (let ((table (make-hash-table)))
                       (loop for item in +list+ do
                         (setf (gethash item table) item))
                       table))

(defmacro benchmark (name &rest body0)
  `(let ((start (get-internal-real-time)))
     ,@body
     (format t "~A: ~6$~&" ,name
             (/ (- (get-internal-real-time) start)
                internal-time-units-per-second))))
