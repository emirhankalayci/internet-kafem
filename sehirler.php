<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

if($_GET)
{
	$sehir=$_GET["id"];
	if($_GET["id"]==""){
		$sehir = 1;
	}
}
$thiscity = $auth->getTableByValues("city","city_id",$sehir);
$cafes = $auth->getTableByValues("city_cafe","city_id",$sehir);
?>
<html>
	<head>
		<title>İnternet Kafem</title>
		<link href="countries/countries_css/sehirler.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<h1><? echo $thiscity[0]["city_name"]; ?></h1>
		    </div>
			
			<div id="inside">
				<div id="menu">
				<ul>
				<?
				for($i=0;$i<count($cafes);$i++){
					$thiscafe = $auth->getTableByValues("cafe","cafe_id",$cafes[$i]["cafe_id"]);
					echo '<li><a href="kafeler.php?id='.$cafes[$i]["cafe_id"].'">'.$thiscafe[0]["cafe_name"].'</a></li>';
				}
				?>
				</ul>
			</div>
			</div>
		</div>
	</body>
</html>