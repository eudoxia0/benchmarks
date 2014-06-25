(ql:quickload :closure-template)

(declaim (optimize (speed 3) (debug 0)))

(defparameter +template+ "
{namespace template}
{template main}
  <ol>
    {foreach $item in $list}
      {$item}
    {/foreach}
  </ol>
{/template}
")

(closure-template:compile-template :common-lisp-backend +template+)

(let ((start (get-internal-real-time)))
  (template:main (list :list +list+))
  (format t "cl-closure-template: ~6$~&"
          (/ (- (get-internal-real-time) start)
             internal-time-units-per-second)))
