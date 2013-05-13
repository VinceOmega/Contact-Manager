<cfparam name="#form.people_id#" default="">

<cftransaction>
<cfquery name="insert_people_number" datasource="ContactData">
Insert into number_lkp
(
phone_number,
people_id
)
values
(
Ltrim(Rtrim(<cfqueryparam value="#form.phone_number#" cfsqltype="cf_sql_varchar" maxlength="15">)),
Ltrim(Rtrim(<cfqueryparam value="#form.people_id#" cfsqltype="cf_sql_int">))
);
</cfquery>

<cfquery name="getID_number" datasource="ContactData">
SELECT MAX(phone_number_id) as nid
FROM number_lkp
</cfquery>

<!---
<cfoutput query="getID_number">
<cfset nID="#nid#">
</cfoutput>
--->


</cftransaction>
<cflocation url="person_number.cfm?people_id=#form.people_id#">