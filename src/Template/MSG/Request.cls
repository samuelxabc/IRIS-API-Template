Class Template.MSG.Request Extends Ens.Request
{

Parameter XMLNAME = "REQUEST";

Property url As %String(XMLNAME = "URL");

Property method As %String(XMLNAME = "METHOD");

Property parm As list Of %String(MAXLEN = "", XMLNAME = "PARM", XMLPROJECTION = "element");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>url</Value>
</Value>
<Value name="2">
<Value>method</Value>
</Value>
<Value name="3">
<Value>parm</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

