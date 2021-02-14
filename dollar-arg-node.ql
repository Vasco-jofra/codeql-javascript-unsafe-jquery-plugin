import javascript

from DataFlow::CallNode c, DataFlow::Node arg
where c = jquery().getACall() and
      arg = c.getArgument(0)
select c