<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">
<cfif isDefined('url.start') eq true>		
<cfinclude template="general_search.cfm">
</cfif>

<cfset perPage = "5">
<cfparam name="url.start" default="1">
<cfparam name="perPage" default="5">
<cfset i = 0>

<div class="row-fluid">
	<div class="span12 container container-search">
	<cfform action="general_search.cfm" method="POST">
		<cfinput type="text" size="500" name="search_bar">
		<cfinput type="hidden" name="flag" value="1">
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
<cfif isDefined('url.start') eq true>		
	<cfoutput query="search_all" startrow="#url.start#" maxRows="#perPage#">

<cfset totalRecords = search_all.RecordCount>
<cfset startRow = ((i - 1) * perPage) + 1>
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
	</tr>
	</cfoutput>
	<cfif search_all.recordcount gte 5>
	

<cfset prev = startRow - perPage>
<cfset next = startRow + perPage>
<cfif prev lt 0>
	<cfset prev = 1>
</cfif>

<cfoutput>
	<a href="search_for.cfm?start=#prev#"><button type="button" name="prev">Prev</button></a>
	<a href="search_for.cfm?start=#next#"><button type="button" name="next">Next</button></a>
</cfoutput>	
</cfif>
</cfif>
	</table>
	</div>
	
</div>
<cfinclude template="footer_include.cfm">
<cfdump var="#startRow#">
	<cfdump var="#endRow#">