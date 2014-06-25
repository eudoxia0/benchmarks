(declaim (optimize (speed 3) (debug 0)))

(ql:quickload :cl-mustache)

(defparameter +table+
  (loop for i from 0 to 999 collecting
    (loop for i from 0 to 9 collecting
      (write-to-string i))))

(defparameter +template+ "
<table>
  {{#table}}
    <tr>
      {{#row}}
        {{.}}
      {{/row}}
    </tr>
  {{/table}}
</table>")

(mustache:defmustache view +template+)

(let ((start (get-internal-real-time)))
  (print (view `((:table . ,+table+))))
  (format t "cl-mustache: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
