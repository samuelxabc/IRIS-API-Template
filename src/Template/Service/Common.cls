Class Template.Service.Common Extends Ens.BusinessService
{

Method SendRequest(pTargetDispatchName As %String, pRequest As Template.MSG.Request, Output pResponse As Ens.StringResponse) As %Status
{
  Try{
		Set status=..SendRequestSync(pTargetDispatchName,pRequest,.Output)
		Set pResponse=##class(Ens.StringResponse).%New()
		Set pResponse=Output
  }Catch e{
  		Set status=e.DisplayString()
  
  }

	Quit status
}

}

