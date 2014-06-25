(ql:quickload :closure-template)

(declaim (optimize (speed 3) (debug 0)))

(defparameter +table+
  (loop for i from 0 to 999 collecting
        (loop for i from 0 to 9 collecting i)))

(defparameter +template+ "
{namespace template}
{template main}
  <table>
    {foreach $row in $table}
      <tr>
        {foreach $cell in $row}
          <td>{$cell}</td>
        {/foreach}
      </tr>
    {/foreach}
  </table>
{/template}
")

(closure-template:compile-template :common-lisp-backend +template+)

(let ((start (get-internal-real-time)))
  (template:main (list :table +table+))
  (format t "cl-closure-template: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
