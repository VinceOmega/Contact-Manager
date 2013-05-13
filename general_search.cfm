<cfif isDefined('form.search_bar') is false>
	<cfparam name='form.search_bar' default="">
</cfif>

<!--- 
<cfdump var="#form#">
<cfabort> --->

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
Right Join state_lkp On state_lkp.people_id = people.people_id 
Right Join zip_lkp On zip_lkp.people_id = people.people_id
Right Join number_lkp On number_lkp.people_id = people.people_id 
Right Join email_lkp On email_lkp.people_id = people.people_id 
Right Join country_lkp On country_lkp.people_id = people.people_id 
Right Join city_lkp On city_lkp.people_id = people.people_id 
Right Join address_lkp On address_lkp.people_id = people.people_id
WHERE LCASE(people.last_name) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(people.first_name) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(address_lkp.address) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(country_lkp.country) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(city_lkp.city) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(state_lkp.state) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(zip_lkp.zip) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(email_lkp.email) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(number_lkp.phone_number) LIKE LTrim(RTrim(<cfqueryparam value="%#LCase(form.search_bar)#%" cfsqltype="cf_sql_varchar" maxlength="500">))
group by people.people_id desc;

</cfquery>

<cfif isDefined('form.flag') is true>
	<cfif "#form.flag#" eq 1>
	<cflocation url="search_for.cfm?start=1">
	</cfif>
</cfif>
