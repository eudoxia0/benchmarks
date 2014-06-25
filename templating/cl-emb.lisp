(declaim (optimize (speed 3) (debug 0)))

(defparameter +list+ (loop for i from 0 to 10000 collecting i))
(defparameter +dict+ (let ((table (make-hash-table)))
                       (loop for item in +list+ do
                         (setf (gethash item table) item))
                       table))

(ql:quickload :cl-emb)

(defparameter +template+ "
List:
<ol>
  <% @loop list %>
    <li><% @var item %></li>
  <% @endloop %>
</ol>")

(cl-emb:register-emb "main" +template+)

(setf +list+ (loop for item in +list+ collecting
                   (list :item item)))

(let ((start (get-internal-real-time)))
  (cl-emb:execute-emb "main" :env (list :list +list+ :dict +dict+))
  (format t "cl-emb: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
