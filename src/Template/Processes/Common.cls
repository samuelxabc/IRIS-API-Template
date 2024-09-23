/// 
Class Template.Processes.Common Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='700' >
<switch name='switch' xpos='200' ypos='350' xend='200' yend='600' >
<case condition='request.url="Method"' name='URL' languageOverride='objectscript' >
<call name='Template.Operations.Common' target='Template.Operations.Common' async='0' languageOverride="objectscript" xpos='335' ypos='500' >
<request type='Template.MSG.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.StringResponse' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</case>
<default name='default' />
</switch>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

