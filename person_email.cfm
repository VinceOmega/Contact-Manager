<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">
<cfinclude template="qry_mail.cfm">

<div class="row-fluid">
	<div class="span12 container container-hold table">
	<cfform action="edit_email.cfm" method="POST">
		<table>
			<tr><th>Email Address</th></tr>
			<cfoutput query="search_person_mail">
			<tr><td><cfinput type="text" name="email" value="#email#" validate="email">
			<cfinput type="hidden" name="people_id" value="#Val(url.people_id)#">
			<cfinput type="hidden" name="email_id" value="#Val(email_id)#">
			<cfinput type="submit" name="submit" value="Edit" class="btn btn-primary">
			<a href="add_email.cfm?people_id=#Val(url.people_id)#"><button type="button" name="add_email" value="Add" class="btn btn-primary">Add</button></a>
			<a href="delete_email.cfm?people_id=#Val(url.people_id)#&email_id=#Val(email_id)#"><button type="button" name="delete_email" value="Delete" class="btn btn-danger">Delete</button></a>
			</td></tr>
			</cfoutput>
		</table>
	</cfform>
		</div>
	</div>
<cfinclude template="footer_include.cfm">