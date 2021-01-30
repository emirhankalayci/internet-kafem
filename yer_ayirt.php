<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();
$sehirler = $auth->getall("city");
?>
<html>
	<head>
		<meta charset="UTF-8">
		<title>İnternet Kafem</title>
		<link href="css/yer_ayirt.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<h1>Yer Ayırt</h1>
		    </div>
			<div id="menu">
				<ul>
				<?
				for($i=0;$i<count($sehirler);$i++){
					echo '<li><a href="sehirler.php?id='.$sehirler[$i]["city_id"].'">'.$sehirler[$i]["city_name"].'</a></li>';
				}
				?>
				</ul>
			</div>
			<div id="inside">
				<p>Yukarıdan bulunduğunuz şehri seçiniz.</p>
				<img src="harita.png" width="720" height="345">
			</div>
	</body>
</html>