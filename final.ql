/*
 * Great! you made it to the final step tada
 *
 * We have now identified:
 * (a) places in the program which receive jQuery plugin options, and which may be considered as sources of untrusted data, and
 * (b) places in the program which are passed to the jQuery $ function and may be interpreted as HTML, that we consider as sinks, in the sense that they will perform actions with the data they receive. We don't want these sinks to receive untrusted data.
 *
 * We now want to tie these two together to ask: does the untrusted data from a jQuery plugin option ever flow to the potentially unsafe $ call?
 *
 * This is also a data flow problem. However, it is larger in scope that the problems we have tackled so far, because the plugin options and the $ call may be in different functions. We call this a global data flow problem.
 */

/**
 * @name Cross-site scripting vulnerable plugin
 * @kind path-problem
 * @id js/xss-unsafe-plugin
 */

import javascript
import DataFlow::PathGraph

class Configuration extends TaintTracking::Configuration {
  Configuration() { this = "XssUnsafeJQueryPlugin" }

  override predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode plugin |
      plugin = jquery().getAPropertyRead("fn").getAPropertySource() and
      source = plugin.getLastParameter()
    )
  }

  override predicate isSink(DataFlow::Node sink) { sink = jquery().getACall().getArgument(0) }
}

from Configuration cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Potential XSS vulnerability in plugin."
