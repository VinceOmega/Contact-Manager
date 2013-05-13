
<cfparam name="#Val(url.people_id)#" default="">

<cfquery name="search_person_number" datasource="ContactData">
Select
  number_lkp.phone_number_id,
  number_lkp.phone_number
From
  people Inner Join
  number_lkp On number_lkp.people_id = people.people_id
Where number_lkp.people_id = LTrim(RTrim(<cfqueryparam value="#Val(url.people_id)#" cfsqltype="cf_sql_int" maxlength="15">))
</cfquery>
