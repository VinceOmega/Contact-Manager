<?php
$header = <<<HAD
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/boilerplate/css/normalize.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.min.css">
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap2/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="../bootstrap2/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="../bootstrap2/js/bootstrap-affix.js"></script>
<script type="text/javascript" src="../bootstrap2/js/bootstrap-alert.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<title>Contact Manager.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<style type="text/css">

html{
	padding: 0px;
	margin: 0px;
	height: 100%;
	max-height: 100%;
	min-height: 100%;

}


body{
	background-color: #E3DAC9; /*Bone White*/
	color: black;
	height: 100%;
	max-height: 100%;
	min-height: 100%;
}

.row-full{
	width: 100%;
	min-width: 100%;
	max-width: 100%;
}

.hero-unit {
	padding: 80px 80px 80px 80px;
	margin: 0px 0px 30px 0px;
	font-size: 18px;
	font-weight: 200;
	line-height: 30px;
	color: black;
	background-color: #eeeeee;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	width: 100%;
	min-width: 100%;
	max-width: 100%;
	/*border-top: 2px solid black;
	 border-bottom: 2px solid black;*/
	border: inset;
}

.hero-shadow{
	-moz-box-shadow: 0 8px 6px -6px yellow;
	-webkit-box-shadow: 0 8px 6px -6px yellow;
	box-shadow: 0 8px 6px -6px yellow;
}

.table{
	margin: 3% 0px 0px 3%;

}

.container-search{
	margin: 3% 0px 0px 3%;
}

.container-input{
	margin: 3% 0px 0px 3%;
}

.container-hold{

}

/*
 .btn-large{
color: blue;
}


.btn-xlarge{
color: blue;
}
*/

.btn-xlarge{
	padding: 16px 25px;
	font-size: 20.5px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.btn-xlarge [class^="icon-"],
.btn-xlarge [class*=" icon-"] {
	margin-top: 6px;
}

.input-shadow{
	-moz-box-shadow: 0 8px 6px -6px yellow;
	-webkit-box-shadow: 0 8px 6px -6px yellow;
	box-shadow: 0 8px 6px -6px yellow;
}

.banner-image{
	width: 100%;
	max-width: 100%;
	min-width: 100%;
}


a{
	color: black !important;
}

.navbar-inner{
	color: black;
	background: #FEFEFA; /*Baby Powder*/
}

.brand:hover{
	color: #0000A0; /*Royal Blue */
}

.brand:active{
	color: #0000A0;  /*Royal Blue */
}


a:hover{
	color:  #FF91A4 !important; /*Salmon (Crayola)*/
}

.text-img{
	float: right;
}

.img-rounded{
	margin-bottom: 15px;

}

.img-shadow{
	-moz-box-shadow: 0 8px 6px -6px yellow;
	-webkit-box-shadow: 0 8px 6px -6px yellow;
	box-shadow: 0 8px 6px -6px yellow;
}

.container-popup{
	z-index: 10;
	padding: 50px;
	margin: 50px;
	width: 400px;
	height: 400px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	background: #575757; /*Dark Gray */
	position: absolute;
	top: 20%;
	left: 25%;
	color: black;
	border: 4px solid black;
	visibility: hidden;
}

.img-close{
	top: -20px;
	left: 480px;
	position:absolute;

}

.row-footer{
	border-top: 2px solid white;
	background: #575757; /*Dark Gray */
	color: white;
	width: 100%;
	min-width: 100%;
	max-width: 100%;
	clear: both;
}




</style>


<script type="text/javascript">

$('.navbar').affix();
$('.row-footer').affix();
$(".alert").alert()

</script>


</head>
<body>
HAD;

echo $header;
?>