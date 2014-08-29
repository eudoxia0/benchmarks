(declaim (optimize (speed 3) (debug 0)))

(defparameter +list+ (loop for i from 0 to 10000 collecting i))
(defparameter +dict+ (let ((table (make-hash-table)))
                       (loop for item in +list+ do
                         (setf (gethash item table) item))
                       table))

(defmacro benchmark (name &rest body)
  `(with-open-file (stream "results.txt"
                           :direction :output
                           :if-exists :append
                           :if-does-not-exist :create)
     (let ((start (get-internal-real-time)))
       ,@body
       (format stream "~A: ~3$~&" ,name
               (/ (- (get-internal-real-time) start)
                  internal-time-units-per-second)))))
