
<cfparam name="#Val(url.people_id)#" default="">

<cfquery name="search_person_mail" datasource="ContactData">
Select
  email_lkp.email,
  email_lkp.email_id
From
  people Inner Join
  email_lkp On email_lkp.people_id = people.people_id
Where email_lkp.people_id = LTrim(RTrim(<cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int" maxlength="200">))
</cfquery>

<!---
<cfdump var="#url#">
--->