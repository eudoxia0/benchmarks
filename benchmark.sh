#!/bin/bash

python templating/jinja2-template.py
#sbcl --noinform --load templating/common.lisp \
#     --load templating/closure-template.lisp --quit
sbcl --noinform --load templating/common.lisp \
     --load templating/cl-emb.lisp --quit
sbcl --noinform --load templating/common.lisp \
     --load templating/cl-markup.lisp --quit
