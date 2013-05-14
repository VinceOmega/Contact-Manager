<cfif isDefined('url.people_id')>
	<cfparam name="url.people_id" default="">
</cfif>

<cftransaction>
<cfquery name="delete_person" datasource="ContactData">
Delete from address_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from city_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from zip_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from country_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from state_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from email_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from number_lkp
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;

Delete from people
Where people_id = <cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int">;
</cfquery>
</cftransaction>

<cflocation url="index.cfm?status=2">