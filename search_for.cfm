<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">

<!---
<cfinclude template="general_search.cfm">
--->






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
<cfif isDefined('url.search_bar')>
WHERE LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(people.last_name) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(people.first_name) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(address_lkp.address) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(country_lkp.country) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(city_lkp.city) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(state_lkp.state) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(zip_lkp.zip) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(email_lkp.email) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
OR LCASE(number_lkp.phone_number) = LTrim(RTrim(<cfqueryparam value="#url.search_bar#" cfsqltype="cf_sql_varchar" maxlength="500">))
</cfif>
group by people.people_id;

</cfquery>
<!---
<cfoutput>
<pre>
<cfdump var="#search_all#">
</pre>
</cfoutput>
--->

<cfset perPage = "5">
<cfparam name="url.start" default="1">
<cfparam name="perPage" default="5">
<cfset i = 0>

<div class="row-fluid">
	<div class="span12 container container-search">
	<cfform action="search_for.cfm" method="GET">
		<cfinput type="hidden" name="start" value="1">
		<cfinput type="text" size="500" name="search_bar">
		<cfinput type="submit" name="submit" value="Search" class="btn btn-primary">
	</cfform>
	</div>
</div>








<div class="row-fluid">
	<div class="span12 table contianer container-hold">
	<table>
		<tr>
		<td>First Name</td>
		<td>Last Name</td>
		<td>Address</td>
		<td>City</td>
		<td>Zip</td>
		<td>Country</td>
		<td>State</td>
		<td>Mail Count</td>
		<td>Number Count</td>
		</tr>

<cfset i = url.start>
	
<cfoutput query="search_all" startrow="#url.start#" maxRows="#perPage#">

<cfset totalRecords = search_all.RecordCount>
<cfset startRow = 1>
<cfset endRow = min(startRow + perPage-1, totalRecords)>
<cfif endRow gt totalRecords>
	<cfset endRow = totalRecords>
</cfif>



	<tr>
		<td>#first_name#</td>
		<td>#last_name#</td>
		<td>#address#</td>
		<td>#city#</td>
		<td>#zip#</td>
		<td>#country#</td>
		<td>#state#</td>
		<td><a href="person_email.cfm?people_id=#people_id#">#mail_count#</a></td>
		<td><a href="person_number.cfm?people_id=#people_id#">#number_count#</a></td>
		<td><a href="delete_person.cfm?people_id=#people_id#"><buttton type="button" name="delete_person" class="btn btn-danger">Delete</button></a></td>
	</tr>
	</cfoutput>
	<cfif search_all.recordcount gte 5>
	




<cfset prev = i - perPage>
<cfset next = i + perPage>


<cfif prev lte 0>
	<cfset prev = 1>
</cfif>
<cfif next gt endRow>
<cfset next = next - 1>
</cfif>
<cfif isDefined('url.search_bar')>
<cfoutput>
	<a href="search_for.cfm?start=#prev#&search_bar=#url.search_bar#"><button type="button" name="prev" class="btn btn-primary">Prev</button></a>
	<cfif next lt totalRecords>
	<a href="search_for.cfm?start=#next#&search_bar=#url.search_bar#"><button type="button" name="next" class="btn btn-primary">Next</button></a>
    </cfif>
</cfoutput>	
</cfif>
</cfif>

	</table>
	</div>
	
</div>
<cfinclude template="footer_include.cfm">
<!---<cfdump var="#startRow#">
	<cfdump var="#endRow#">--->