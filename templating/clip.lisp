(ql:quickload :clip)

(defparameter +template+ "<ol iterate=\":list\">
 <li lquery=\"(text (write-to-string *))\"></li>
</ol>")

(benchmark "clip"
  (clip:process +template+ :list +list+))
