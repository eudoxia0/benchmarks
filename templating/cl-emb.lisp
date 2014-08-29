(ql:quickload :cl-emb)

(defparameter +template+ "
List:
<ol>
  <% @loop list %>
    <li><% @var item %></li>
  <% @endloop %>
</ol>")

(cl-emb:register-emb "main" +template+)

(setf +list+ (loop for item in +list+ collecting
                   (list :item item)))

(benchmark "cl-emb"
  (cl-emb:execute-emb "main" :env (list :list +list+ :dict +dict+)))
