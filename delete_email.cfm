<cfif isDefined('url.people_id')>
	<cfparam name="url.people_id" default="">
</cfif>

<cfif isDefined('url.email_id')>
	<cfparam name="url.email_id" default="">
</cfif>

<cftransaction>
<cfquery name="delete_mail" datasource="ContactData">
Delete from email_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">
AND email_id = <cfqueryparam value="#Val(url.email_id)#" cfsqltype="cf_sql_int">
;
</cfquery>
</cftransaction>

<cflocation url="index.cfm?status=2">