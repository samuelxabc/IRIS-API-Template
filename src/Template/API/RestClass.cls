Class Template.API.RestClass Extends %CSP.REST
{

Parameter HandleCorsRequest = "true";

ClassMethod GetStatus(ser As %String) As %Status
{
     Quit $$$OK
}

ClassMethod Template(URL As %String, Method As %String) As %Status
{
	Do %response.SetHeader("Content-Type", "application/json;charset=UTF-8")
	Set Service =##class(Template.Service.Common).%New()
	Set template =##class(Template.Util.ResponseTemplate).%New()
	Set Request=##class(Template.MSG.Request).%New()
	Try{
		Set content="",message=""
	    Set tSC=##class(Ens.Director).CreateBusinessService("Template.Service.Common",.Service)
		Set Request.url=URL
		Set Request.method=Method
		Set:$L(%request.Content)'=0 content=$zcvt(%request.Content.Read(),"I","UTF8")
	 	Set tSC=Request.parm.Insert(content) 
	   	Set status=Service.SendRequest("Template.Processes.Common",Request,.out)
	   	set message=out.StringValue
		

	   	
	}Catch(e){
			Set message=template.Fail(e.DisplayString())
	}
    w $zcvt(message,"O","UTF8")
    Quit $$$OK
}

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
 <Route Url="/*" Method="OPTIONS" Call="Status"/>
  <Route Url="/Template/:URL/:Method" Method="POST" Call="Template"/>
</Routes>
}

}

