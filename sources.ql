/*
 * You will transform the previous query you wrote to identify the places in the program which receive jQuery plugin options, into a predicate called isSource, by using the exists quantifier.
 *
 * Edit the file sources.ql and fill in the TODOs in the template below.
 *
 * The from ... where ... select query here is just there to test your isSource predicate,
 * and should give you the same results as your previous query.
 *
 * You notice that below the source is of type DataFlow::Node whereas in your previous query you used
 * DataFlow::ParameterNode. This is ok as a ParameterNode is a Node.
 *
 * Submit your query.
 */

// from DataFlow::FunctionNode plugin_func, DataFlow::ParameterNode last_param
// where
//   plugin_func = jquery().getAPropertyRead("fn").getAPropertySource() and
//   last_param = plugin_func.getLastParameter()
// select plugin_func, last_param
import javascript

predicate isSource(DataFlow::Node source) {
  exists(DataFlow::FunctionNode plugin_func |
    plugin_func = jquery().getAPropertyRead("fn").getAPropertySource() and
    source = plugin_func.getLastParameter()
  )
}

from DataFlow::Node node
where isSource(node)
select node
