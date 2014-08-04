(in-package :benchmarks)

(defparameter +template+ "
{namespace template}
{template main}
  <ol>
    {foreach $item in $list}
      {$item}
    {/foreach}
  </ol>
{/template}
")

(closure-template:compile-template :common-lisp-backend +template+)

(benchmark "cl-closure-template" (template:main (list :list +list+)))
