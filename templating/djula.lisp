(in-package :benchmarks)

(djula:add-template-directory
 (asdf:system-relative-pathname :benchmarks #p"templating/templates/"))

(defparameter +template+ (djula:compile-template* "djula.html"))

(benchmark "djula"
  (djula:render-template* +template+ :list +list+))
