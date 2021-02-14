/*
You have already seen how to find references to the jQuery $ function. Now find all places in the code that read the property $.fn. These results of your query will be of type DataFlow::Node.

Notice that jquery() returns a value of type DataFlow::SourceNode, from which the flow of data may be tracked. Use the auto-completion feature after jquery(). to browse the predicates of this DataFlow::SourceNode type, and their documentation. Look for a predicate that gets you all reads of a property named fn.

Write your query in the file property-read.ql and submit it.
*/

import javascript

from DataFlow::Node dollar_fn
where dollar_fn = jquery().getAPropertyRead("fn")
select dollar_fn