# Lisp
SBCL = sbcl --noinform --quit
TMPL_COMMON = --load templating/common.lisp
TEMPLATING = $(SBCL) $(TMPL_COMMON) --load

REDIRECT = > /dev/null 2>&1

default: all
.PHONY: templating

templating:
	$(TEMPLATING) templating/cl-emb.lisp $(REDIRECT)
	$(TEMPLATING) templating/cl-markup.lisp $(REDIRECT)
	$(TEMPLATING) templating/cl-who.lisp $(REDIRECT)
	$(TEMPLATING) templating/closure-template.lisp $(REDIRECT)
	#$(TEMPLATING) templating/djula.lisp $(REDIRECT)
	$(TEMPLATING) templating/cl-template.lisp $(REDIRECT)
	$(TEMPLATING) templating/clip.lisp $(REDIRECT)
	python templating/jinja2-template.py $(REDIRECT)

all: templating
	cat results.txt
	rm results.txt
