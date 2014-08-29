(ql:quickload :clip)

(defparameter +template+ "
List:
<ol iterate='list'>
  <li></li>
</ol>")

(benchmark "clip"
  (clip:process +template+ :list +list+))
