<div class="row-fluid">
<div class="navbar  navbar-fixed-top">

	<div class="navbar-inner">
		<div class="container">
		
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-th-list"></span>
			</a>
			
			<a href="index.cfm" class="brand">Contact Manager</a>
			
			<div class="nav-collapse collapse">
				<ul class="nav pull-right ">
					<li class="active"><a href="new_person.cfm">Enter New Person</a></li>
					<li><a href="search_for.cfm">Targeted Search</a></li>
					<cfif isDefined('url.people_id')>
					<!---<cfset people_id = ListGetAt(CGI.QUERY_STRING, 1, "&")> --->
					<cfoutput>
					<li><a href="person_email.cfm?people_id=#url.people_id#" id="li-email">Email List</a></li>
					<li><a href="person_number.cfm?people_id=#url.people_id#" id="li-number">Number List</a></li>
					</cfoutput>
					</cfif>
				</ul>
			</div>		
			
			</div>
		</div>
</div>
</div>