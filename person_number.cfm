<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">
<cfinclude template="qry_number.cfm">

<div class="row-fluid">
	<div class="span12 container container-hold table">
	<cfform action="edit_number.cfm" method="POST">
		<table>
			<tr><th>Phone Number</th></tr>
			<cfoutput query="search_person_number">
			<tr><td><cfinput type="text" name="phone_number" value="#phone_number#" validate="telephone" mask="999-999-9999">
			<cfinput type="hidden" name="people_id" value="#Val(url.people_id)#">
			<cfinput type="hidden" name="phone_number_id" value="#Val(phone_number_id)#">
			<cfinput type="submit" name="submit" value="Edit" class="btn btn-primary">
			<a href="add_number.cfm?people_id=#Val(url.people_id)#"><button type="button" name="add_number" value="Add" class="btn btn-primary">Add</button></a>
			<a href="delete_number.cfm?people_id=#Val(url.people_id)#&phone_number_id=#Val(phone_number_id)#"><button type="button" name="delete_number" value="Delete" class="btn btn-danger">Delete</button></a>
			</td></tr>
			</cfoutput>
		</table>
	</cfform>
	<div>
</div>
<cfinclude template="footer_include.cfm">