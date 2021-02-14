import javascript

from CallExpr dollar_call
where dollar_call.getCalleeName().matches("$")
select dollar_call