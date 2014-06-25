(ql:quickload :cl-emb)

(declaim (optimize (speed 3) (debug 0)))

(defparameter +table+
  (loop for i from 0 to 999 collecting
        (list :row (loop for i from 0 to 9 collecting (list :cell i)))))

(defparameter +template+ "
<table>
  <% @loop table %>
    <tr>
      <% @loop row %>
        <td><% @var cell %></td>
      <% @endloop %>
    </tr>
  <% @endloop %>
</table>")

(cl-emb:register-emb "main" +template+)

(let ((start (get-internal-real-time)))
  (cl-emb:execute-emb "main" :env (list :table +table+))
  (format t "cl-emb: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
