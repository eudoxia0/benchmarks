(ql:quickload :cl-markup)

(setf markup:*output-stream* (make-string-output-stream))

(defun template ()
  (markup:markup
   (:ol
    (loop for item in +list+ do
      (markup:markup (:li item))))
   (:dl
    (loop for key being the hash-keys of +dict+
          for value being the hash-values of +dict+
          do
             (markup:markup (:dt key)
                            (:dd value))))))

(compile 'template)

(benchmark "cl-markup" (template))
