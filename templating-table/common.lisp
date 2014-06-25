(defparameter +list+ (loop for i from 0 to 10000 collecting i))
(defparameter +dict+ (let ((table (make-hash-table)))
                       (loop for item in +list+ do
                         (setf (gethash item table) item))
                       table))
