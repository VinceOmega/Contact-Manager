<?php
include('header_include.php');
include('nav_include.php');


if (isset($_POST['first_name']) && 
isset($_POST['last_name']) && 
isset($_POST['address']) && 
isset($_POST['city']) && 
isset($_POST['zip']) &&
isset($_POST['country']) &&
isset($_POST['state']) &&
isset($_POST['mail_count']) &&
isset($_POST['number_count']) ){
	
$name_field = array('first_name', 'last_name', 'address', 'city', 'zip', 'country', 'state', 'mail_count', 'number_count');	
foreach($name_field as $key){
	$_POST[$key] = " ";
	}	
}

$html .=<<<HTM
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
<tr>
<td>
HTM;
$count = 0;

if(isset($row_count) != null){
while($count < 10){
$html .=  $_POST['first_name']; 


$html .=<<<HTM
</td><td>
HTM;

$html .= $_POST['last_name'];
$html .=<<<HTM
</td>
<td>
HTM;
$html .= $_POST['address'];
$html .=<<<HTM
</td>
<td>
HTM;
$html .= $_POST['city'];
$html .=<<<HTM
</td>
<td>
HTM;
$html .=$_POST['zip'];
$html .=<<<HTM
</td>
<td>
HTM;
$html .=$_POST['country'];
$html .=<<<HTM
</td>
<td>
HTM;
$html .= $_POST['state'];
$html .=<<<HTM
</td>
<td>
<a href="person_email.php?people_id=
HTM;
$html .= $_POST['people_id'];
$html .=<<<HTM
">
HTM;
$html .= $_POST['mail_count'];
$html .= <<<HTM
</a></td>
<td><a href="person_number.php?people_id=
HTM;
$html .= $_POST['people_id'];
$html .=<<<HTM
">
HTM;
$html .= $_POST['number_count'];
$html .=<<<HTM
</a></td>
<td><a href="delete_person.php?people_id=
HTM;
$html .= $_POST['people_id'];
$html .=<<<HTM
">
<buttton type="button" name="delete_person" class="btn btn-danger">Delete</button></a></td>
</tr>
HTM;

$count++;

if($count == 10){
	
	break;
 		}
	}
}
$html .=<<<HTM
</table>
</div>
</div>
HTM;
echo $html;
include('footer_include.php');
?>