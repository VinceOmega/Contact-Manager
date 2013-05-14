<cfif isDefined('url.people_id')>
	<cfparam name="url.people_id" default="">
</cfif>

<cfif isDefined('url.phone_number_id')>
	<cfparam name="url.phone_number_id" default="">
</cfif>

<cftransaction>
<cfquery name="delete_number" datasource="ContactData">

Delete from number_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">
And phone_number_id = <cfqueryparam value="#Val(url.phone_number_id)#" cfsqltype="cf_sql_int">
;
</cfquery>
</cftransaction>

<cflocation url="index.cfm?status=2">