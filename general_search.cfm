<cfif isDefined('form.search_bar') is false>
	<cfparam name= 'form.search_bar' default="">
</cfif>





<cfquery name="search_all" datasource="ContactData">
Select distinct
  people.first_name,
  people.last_name,
  state_lkp.state,
  zip_lkp.zip,
  number_lkp.phone_number,
  email_lkp.email,
  country_lkp.country,
  address_lkp.address,
  city_lkp.city,
count(distinct email_lkp.email_id) as mail_count,
count(distinct number_lkp.phone_number_id) as number_count,
people.people_id
From
  people 
Left Join state_lkp On state_lkp.people_id = people.people_id 
Left Join zip_lkp On zip_lkp.people_id = people.people_id
Left Join number_lkp On number_lkp.people_id = people.people_id 
Left Join email_lkp On email_lkp.people_id = people.people_id 
Left Join country_lkp On country_lkp.people_id = people.people_id 
Left Join city_lkp On city_lkp.people_id = people.people_id 
Left Join address_lkp On address_lkp.people_id = people.people_id
<cfif not IsNull('form.search_bar')>
WHERE 
LCASE(people.last_name) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(people.first_name) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(address_lkp.address) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(country_lkp.country) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(city_lkp.city) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(state_lkp.state) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(zip_lkp.zip) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(email_lkp.email) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(number_lkp.phone_number) = LTrim(RTrim(<cfqueryparam value="#form.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
</cfif>
group by people.people_id;

</cfquery>
<!---
<cfdump var="#form#">
<cfabort> 
--->

<cfoutput>
<pre>
<cfdump var="#search_all#">
</pre>
</cfoutput>

<cfif isDefined('form.flag') is true>
	<cfif "#form.flag#" eq 1>
	<cflocation url="search_for.cfm?start=1&search_bar=#form.search_bar#">
	</cfif>
</cfif>
