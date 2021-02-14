import javascript

from CallExpr dollar_call, Expr arg
where dollar_call.getCalleeName().matches("$") and
      arg = dollar_call.getArgument(0)
select arg
