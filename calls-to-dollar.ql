import javascript

from CallExpr dollarCall
where dollarCall.getCalleeName().matches("$")
select dollarCall