<cfparam name="#form.people_id#" default="">

<cftransaction>
<cfquery name="insert_people_email" datasource="ContactData">
Insert into email_lkp
(
email,
people_id
)
values
(
Ltrim(Rtrim(<cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="200">)),
Ltrim(Rtrim(<cfqueryparam value="#form.people_id#" cfsqltype="cf_sql_int">))
);
</cfquery>

<cfquery name="getID_email" datasource="ContactData">
SELECT MAX(email_id) as eid
FROM email_lkp
</cfquery>

<!---
<cfoutput query="getID_email">
<cfset eID ="#eid#">
</cfoutput>
--->


</cftransaction>
<cflocation url="person_email.cfm?people_id=#form.people_id#">