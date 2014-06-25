from datetime import datetime
from jinja2 import Template

TEMPLATE = '''
<table>
  {% for row in table %}
    <tr>
     {% for cell in row %}
       <td>{{cell}}</td>
     {% endfor %}
   </tr>
  {% endfor %}
</table>
'''

TABLE = [[i for i in range(10)]
         for x in range(1000)]

if __name__ == '__main__':
    template = Template(TEMPLATE)
    start = datetime.now()
    out = template.render(table=TABLE)
    end = datetime.now()
    print "Jinja2:", (end-start).microseconds/1e6
