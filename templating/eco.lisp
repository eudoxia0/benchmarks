(ql:quickload :eco)

(defparameter +template+ "<% deftemplate test (list) %>
List:
<ol>
  <% loop for item in list do %>
    <li><%= (write-to-string item) %></li>
  <% end %>
</ol>
<% end %>")

(eco:compile-string +template+)

(benchmark "eco"
  (eco-template::test +list+))
