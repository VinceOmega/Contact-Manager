<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">

<div class="row-fluid">
	<div class="span12 container container-input container-hold">
		<cfform action="insert_number.cfm" method="POST">
			<cfinput type="text" name="phone_number" validate="telephone" mask="999-999-9999" maxlength="15">
			<cfinput type="hidden" name="people_id" value="#Val(url.people_id)#">
			<cfinput type="submit" name="submit" value="Save" class="btn btn-primary">
		</cfform>
	</div>
</div>

<cfinclude template="footer_include.cfm">