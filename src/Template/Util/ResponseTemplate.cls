Class Template.Util.ResponseTemplate Extends %RegisteredObject
{

Method Success(data As %RegisteredObject, msg As %String = "") As %String
{

	Set jsonObject = {}
	Set jsonObject.code="1"
	Set jsonObject.data=data
	Set jsonObject=jsonObject.%Set("status",1,"boolean")
	Set jsonObject.msg="Successful Response"
	Set:$L(msg)'=0 jsonObject.msg=msg
	Quit jsonObject.%ToJSON()
}

Method Fail(msg As %String = "") As %String
{
	Set jsonObject = {}
	Set jsonObject.code="-1"
	Set jsonObject=jsonObject.%Set("status",0,"boolean")
	Set jsonObject.msg="Fail Response"
	Set:$L(msg)'=0 jsonObject.msg=msg
	Quit jsonObject.%ToJSON()
}

Method Custom(code As %String, data As %RegisteredObject, status As %String, msg As %String = "") As %String
{
	Set jsonObject = {}
	Set jsonObject.code=code
	Set:data.%Size()'=0 jsonObject.data=data
	Set jsonObject=jsonObject.%Set("status",status,"boolean")
	Set jsonObject.msg="Response message"
	Set:$L(msg)'=0 jsonObject.msg=msg
	Quit jsonObject.%ToJSON()
}

}

