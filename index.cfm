<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">
<cfinclude template="search_people.cfm">
<div class="row-fluid">
<div class="span12 table container container-hold">
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
	<cfoutput query="general_search"  maxRows="10">
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
	
	</table>
</div>
</div>
<cfinclude template="footer_include.cfm">