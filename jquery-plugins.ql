/*
Your query must find a function assigned to $.fn.<some-property>. To do so, you will use the predicate of DataFlow::SourceNode named getAPropertySource(), which finds a source node whose value is stored in a property of this node.
*/

import javascript

from DataFlow::SourceNode plugin_func
where plugin_func = jquery().getAPropertyRead("fn").getAPropertySource()
select plugin_func
