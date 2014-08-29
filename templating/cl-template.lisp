(ql:quickload :cl-template)

(defparameter +template+ "
List:
<ol>
  <% loop for item in (@ list) do %>
    <li><%= (write-to-string item) %></li>
  <% end %>
</ol>")

(defparameter *fn* (cl-template:compile-template +template+))

(benchmark "cl-template"
  (funcall *fn* (list :list +list+)))
