from datetime import datetime
from jinja2 import Template

TEMPLATE = '''
List:
<ol>
  {% for item in list %}
    <li>{{item}}</li>
  {% endfor %}
</ol>
Dictionary:
<dl>
  {% for key, value in dict.iteritems() %}
    <dt>{{key}}</dt>
    <dd>{{value}}</dd>
  {% endfor %}
</dl>
'''

LIST = [i for i in xrange(1,10000)]
DICT = {i:i*2 for i in LIST}

if __name__ == '__main__':
    template = Template(TEMPLATE)
    start = datetime.now()
    out = template.render(list=LIST, dict=DICT)
    end = datetime.now()
    print "Jinja2:", (end-start).microseconds/1e6

