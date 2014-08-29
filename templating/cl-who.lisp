(ql:quickload :cl-who)

(defparameter *stream* (make-string-output-stream))

(defun template ()
  (who:with-html-output (*stream*)
    (:ol
     (loop for item in +list+ do
       (who:htm (:li (who:str item)))))
    (:dl
     (loop for key being the hash-keys of +dict+
           for value being the hash-values of +dict+
           do
              (who:htm (:dt (who:str key))
                       (:dd (who:str value)))))))

(compile 'template)

(benchmark "cl-who" (template))
