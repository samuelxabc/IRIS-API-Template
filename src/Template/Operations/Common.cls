Class Template.Operations.Common Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method Send(pRequest As Template.MSG.Request, Output pResponse As Ens.StringResponse) As %Status
{
	Set method =pRequest.method
	if method="POST"{
		Set tSC=..POST(pRequest,.pResponse)
	}else{
		Set tSC=..ERROR(pRequest,.pResponse)
	}
	Quit $$$OK
}

Method POST(pRequest As Template.MSG.Request, Output pResponse As Ens.StringResponse) As %Status
{
	Set pResponse=##class(Ens.StringResponse).%New()
	Set Template = ##class(Template.Util.ResponseTemplate).%New()
	Try{
		#Dim json As %DynamicObject =##class(%DynamicObject).%FromJSON(pRequest.parm.GetAt(1))
		Set str=Template.Success(json,"This is a POST request ")
		
	}Catch(e){
		Set str=Template.Fail($SYSTEM.Status.GetErrorText(e.DisplayString()))
	}
	Set pResponse.StringValue=$REPLACE(str,"\u0000","")
	Quit $$$OK
}

Method ERROR(pRequest As Template.MSG.Request, Output pResponse As Ens.StringResponse) As %Status
{
	Set pResponse = ##class(Ens.StringResponse).%New()
	Set Template = ##class(Template.Util.ResponseTemplate).%New()
	Set jsonObject = ##class(%DynamicObject).%New()

	#Dim json As %DynamicObject =##class(%DynamicObject).%FromJSON(pRequest.parm.GetAt(1))

	Set jsonObject.url = pRequest.url
	Set jsonObject.method = pRequest.method
	Set jsonObject.params = json
	Set str=Template.Custom("404",jsonObject,0,"Method does not exist")
	Set pResponse.StringValue = $REPLACE(str,"\u0000","")
	Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Template.MSG.Request"> 
		<Method>Send</Method>
	</MapItem>
</MapItems>
}

}

