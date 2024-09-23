Class Template.Util.Web
{

/// d ##class(Template.Util.Web).Test()
ClassMethod Test()
{
	d ..Run("USER","Template.API.RestClass","/TemplateAPI")
}

ClassMethod Run(namespace, className, url) As %Status
{
	
	 zn "%sys"
	 Set property("AutheEnabled")=64,property("IsNameSpaceDefault")=0,property("MatchRoles")="%All:%All,:%All",property("GroupById")="%ISCMgtPortal",property("NameSpace")=namespace,property("DeepSeeEnabled")=1,property("DispatchClass")=className
	 Set tSC=##Class(Security.Applications).Create(url,.property)
	 quit $$$OK
}

}

