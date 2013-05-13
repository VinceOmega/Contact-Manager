<!---
<cfparam name="#form.address#" default="">
<cfparam name="#form.city#" default="">
<cfparam name="#form.state#" default="">
<cfparam name="#form.zip#" default="">
<cfparam name="#form.country#" default="">
<cfparam name="#form.email#" default="">
<cfparam name="#form.phone_number#" default="">
--->


<cfdump var="#form#">

<cftransaction>
<cfquery name="insert_person" datasource="ContactData">
	
INSERT INTO people
(first_name,
last_name
)
VALUES (
LTrim(RTrim(<cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar" maxlength="200">)),
LTrim(RTrim(<cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar" maxlength="200">))
);

</cfquery>
</cftransaction>

<cftransaction>
<cfquery name="people_table" datasource="ContactData">

SELECT MAX(people_id) as pid
FROM people;

</cfquery>
</cftransaction>

<cfoutput>
<cfset pid = "#people_table.pid#">
</cfoutput>

<cfdump var = "#pid#">

<cftransaction>
<cfquery name="insert_person_lookup_data" datasource="ContactData">
	
INSERT INTO address_lkp
(address, people_id)
VALUES ( LTrim(RTrim(<cfqueryparam value="#form.address#" cfsqltype="cf_sql_varchar" maxlength="150">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int"> );

INSERT INTO city_lkp
(city, people_id)
VALUES (LTRIM(RTRIM(<cfqueryparam value="#form.city#" cfsqltype="cf_sql_varchar" maxlength="200">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int">)
;


INSERT INTO zip_lkp
(zip, people_id)
VALUES (LTRIM(RTRIM(<cfqueryparam value="#form.zip#" cfsqltype="cf_sql_varchar" maxlength="15">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int">)
;


INSERT INTO country_lkp
(country, people_id)
VALUES (LTRIM(RTRIM(<cfqueryparam value="#form.country#" cfsqltype="cf_sql_varchar" maxlength="200">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int">)
;



INSERT INTO state_lkp
(state, people_id)
VALUES (LTRIM(RTRIM(<cfqueryparam value="#form.state#" cfsqltype="cf_sql_varchar" maxlength="200">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int">)
;



INSERT INTO email_lkp
(email, people_id)
VALUES (LTRIM(RTRIM(<cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="200">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int">)
;


INSERT INTO number_lkp
(phone_number, people_id)
VALUES (LTRIM(RTRIM(<cfqueryparam value="#form.phone_number#" cfsqltype="cf_sql_varchar" maxlength="15">)), <cfqueryparam value="#pid#" cfsqltype="cf_sql_int">)
;


</cfquery>
</cftransaction>

<cflocation url="new_person.cfm?status=1">




