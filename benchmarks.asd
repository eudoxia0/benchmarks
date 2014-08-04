(asdf:defsystem benchmarks
  :version "0.1"
  :author "Fernando Borretti"
  :license "MIT"
  :depends-on (:cl-emb
               :cl-markup
               :cl-who)
  :serial t
  :components ((:file "package")
               (:module "templating"
                :serial t
                :components
                ((:file "common")
                 (:file "cl-emb")
                 (:file "cl-who")
                 (:file "cl-closure-template")
                 (:file "djula"))))
  :description "Common Lisp vs. the World")
