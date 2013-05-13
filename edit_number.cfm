<cfparam name="#Val(form.people_id)#" default="">
<cfparam name="#Val(form.phone_number_id)#" default="">

<!---<cfdump var="#form#">
<cfabort>
--->
<cftransaction>
<cfquery name="update_number" datasource="ContactData">
UPDATE number_lkp
SET number_lkp.phone_number = LTrim(Rtrim(<cfqueryparam value="#form.phone_number#" cfsqltype="cf_sql_varchar" maxlength="15">))
WHERE number_lkp.phone_number_id = LTrim(RTrim(<cfqueryparam value="#form.phone_number_id#" cfsqltype="cf_sql_int" maxlength="200">))
AND number_lkp.people_id = LTrim(Rtrim(<cfqueryparam value="#form.people_id#" cfsqltype="cf_sql_int" maxlength="200">))
</cfquery>
</cftransaction>
<cflocation url="person_number.cfm?people_id=#form.people_id#">