/*
 * Modify your from clause so that the variable that describes that jQuery plugin is of type DataFlow::FunctionNode. As the name suggests, this is a data flow node that refers to a function definition. By typing this variable with this type, your query will restrict the possible values for your plugin variable to this type only.
 * Use auto-completion on that variable to browse the predicates of DataFlow::FunctionNode and find the one that will get you the last parameter of that function.
 * Your return variable should be of type DataFlow::ParameterNode
 */

import javascript

from DataFlow::FunctionNode plugin_func, DataFlow::ParameterNode last_param
where
  plugin_func = jquery().getAPropertyRead("fn").getAPropertySource() and
  last_param = plugin_func.getLastParameter()
select plugin_func, last_param