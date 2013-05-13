<cfinclude template="header_include.cfm">
<cfinclude template="navi_include.cfm">


<cfif isDefined('url.status') eq true>


<cfif Val('url.status') eq 1>
	<br>
	<br>
	<div class="row-fluid">
		<div class="span12  alert alert-top">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<p class="text-success"><strong>New record entered successfully!</strong></p>
		</div>
	</div>
</cfif>

</cfif>

<div class="row-fluid container container-hold">
<span class="span3">
<!--no data-->
</span>
<span class="span6">

<cfform action="make_person.cfm" method="POST">
	<br>
	<br>
	<br>
<p>Enter Information</p>
<span class="span12">
<span class="span4">
	First Name: <cfinput type="text" size="200" name="first_name"><br>
	Last Name: <cfinput type="text" size="200" name="last_name"><br>
	Address:  <cfinput type="text" size="150" name="address"><br>
</span>
<span class="span4">
	Country:  <cfinput type="text" size="200" name="country"><br>
	City:  <cfinput type="text" size="200" name="city"><br>
	State:  <cfinput type="text" size="200" name="state"><br>
</span>
<span class="span4">
	Zip:  <cfinput type="text" size="25" name="zip"><br>
	Email:  <cfinput type="text" size="200" name="email"><br>
	Phone Number:  <cfinput type="text" size="15" name="phone_number"><br>
</span>
	<span class="span12">
		<span class="span4">
			</span>
			<span class="span4">
	<cfinput class="btn btn-small btn-primary" type="submit" name="submit_person" value="save">
			</span>
			<span class="span4">
			</span>			
		</span>
	</span>
</cfform>
</span>
<span class="span3">
<!-- no data -->
</span>
</div>
<cfinclude template="footer_include.cfm">
