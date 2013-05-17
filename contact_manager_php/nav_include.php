<?php
$html =<<<HTM
<div class="row-fluid">
<div class="navbar  navbar-fixed-top">

<div class="navbar-inner">
<div class="container">

<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
<span class="icon-th-list"></span>
</a>
	
<a href="index.php" class="brand">Contact Manager</a>
	
<div class="nav-collapse collapse">
<ul class="nav pull-right ">
<li class="active"><a href="new_person.php">Enter New Person</a></li>
<li><a href="search_for.php">Targeted Search</a></li>
HTM;

if(isset($_GET['people_id'])){
$html .=<<<HTM
<li><a href="person_email.php?people_id="
HTM;

$html .= $_GET['people_id']; 

$html .= <<<HTM
id="li-email">Email List</a></li>
<li><a href="person_number.php?people_id="
HTM;

$html .= $_GET['people_id']; 

$html .=<<<HTM
id="li-number">Number List</a></li>
HTM;

}

$html .=<<<HTM
</ul>
</div>
	
</div>
</div>
</div>
</div>
HTM;

echo $html;
?>