#!/bin/bash

sudo apt-get update
sudo apt-get -y install sbcl python python-pip curl git

sudo pip install Jinja2

curl -O http://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install)'  --quit
rm quicklisp.lisp

git clone https://github.com/mmontone/djula.git /home/vagrant/quicklisp/local-projects/djula

read -d '' LISP_INIT <<"EOF"
(setf *print-case* :downcase)

#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
EOF

read -d '' SOURCE_REGISTRY <<"EOF"
(:source-registry
  (:directory "/home/vagrant/benchmarks/")
  :inherit-configuration)
EOF

echo $LISP_INIT > /home/vagrant/.sbclrc
mkdir -p .config/common-lisp
echo $SOURCE_REGISTRY > /home/vagrant/.config/common-lisp/source-registry.conf
