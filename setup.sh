#!/bin/bash

sudo apt-get update
sudo apt-get -y install sbcl python python-pip curl

sudo pip install Jinja2

curl -O http://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install)'  --quit
rm quicklisp.lisp

read -d '' LISP_INIT <<"EOF"
(setf *print-case* :downcase)

#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
EOF

echo $LISP_INIT > ~/.sbclrc
