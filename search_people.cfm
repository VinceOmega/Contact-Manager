<cfquery name="general_search" datasource="ContactData">
Select
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
group by people.people_id desc;
</cfquery>

