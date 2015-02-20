# Lisp
SBCL = sbcl --noinform
TMPL_COMMON = --load templating/common.lisp
TEMPLATING = $(SBCL) --quit $(TMPL_COMMON) --load

SERVER = $(SBCL) --load
BENCHMARK = wrk -t10 -c10 -d60s http://127.0.0.1:8000/ > results.txt

REDIRECT =

default: all
.PHONY: templating server

templating:
	$(TEMPLATING) templating/cl-emb.lisp $(REDIRECT)
	$(TEMPLATING) templating/cl-markup.lisp $(REDIRECT)
	$(TEMPLATING) templating/cl-who.lisp $(REDIRECT)
	$(TEMPLATING) templating/closure-template.lisp $(REDIRECT)
	#$(TEMPLATING) templating/djula.lisp $(REDIRECT)
	$(TEMPLATING) templating/cl-template.lisp $(REDIRECT)
	$(TEMPLATING) templating/clip.lisp $(REDIRECT)
	$(TEMPLATING) templating/eco.lisp $(REDIRECT)
	python templating/jinja2-template.py $(REDIRECT)

server:
	$(SBCL) server/raw-clack.lisp $(REDIRECT) &
	sleep 5
	#$(BENCHMARK)

all: templating server
	cat results.txt
	rm results.txt
