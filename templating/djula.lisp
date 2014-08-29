(ql:quickload :djula)

(djula:add-template-directory
 #p"templating/templates/")

(defparameter +template+ (djula:compile-template* "djula.html"))

(benchmark "djula"
  (djula:render-template* +template+ :list +list+))
