<cfparam name="#Val(form.people_id)#" default="">
<cfparam name="#Val(form.email_id)#" default="">

<cftransaction>
<cfquery name="update_email" datasource="ContactData">
Update email_lkp
SET email = LTrim(Rtrim(<cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="200">))
WHERE email_id = LTrim(RTrim(<cfqueryparam value="#form.email_id#" cfsqltype="cf_sql_int" maxlength="200">)) 
AND people_id = LTrim(Rtrim(<cfqueryparam value="#form.people_id#" cfsqltype="cf_sql_int" maxlength="200">));
</cfquery>
</cftransaction>
<cflocation url="person_email.cfm?people_id=#form.people_id#">