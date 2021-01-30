<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

$user_id = $_SESSION["user_id"];
if($user_id!=""){
	$isLoggedIn=true;
}

if($_GET)
{
	$cafe_id=$_GET["id"];
	if($_GET["id"]==""){
		$cafe_id = 1;
	}
}

$thisuser = $auth->getTableByValues("users","user_id",$user_id);
$thiscafe = $auth->getTableByValues("cafe","cafe_id",$cafe_id);
$comments = $auth->getTableByValues("comment","cafe_id",$cafe_id);

if (! empty($_POST["doreservation"])) {
	if($isLoggedIn) {
		$db_handle = new DBController();
		$hour = $_POST["hour"];
		$hostsql = "INSERT INTO reservation(hour, cafe_id, user_id) VALUES ('$hour','$cafe_id','$user_id')";
		$hostsql = mb_convert_encoding($hostsql, "UTF-8", "ISO-8859-9");
		if (mysqli_query($db_handle->connectDB(), $hostsql)) {
			header('Location: kafeler.php?id='.$cafe_id.'&msg=Yer Ayırtma işlemi başarıyla gerçekleşti.');
			//echo "<script>alert('Yer Ayırtma işlemi başarıyla gerçekleşti.');</script>";
		} else {
			  echo "Error: " . $hostsql . "<br>" . mysqli_error($db_handle->connectDB());
		}
	}else{
		echo "<script>alert('Kullanıcı Girişi Yapmalısınız!');</script>";
	}
}

if (! empty($_POST["docomment"])) {
	if($isLoggedIn) {
		$db_handle = new DBController();
		$comment = $_POST["comment"];
		$scoreid = $_POST["scoreid"];
		$hostsql = "INSERT INTO comment(comment_id, comment, user_id, cafe_id, score_id) VALUES ('','$comment','$user_id','$cafe_id','$scoreid')";
		$hostsql = mb_convert_encoding($hostsql, "UTF-8", "ISO-8859-9");
		if (mysqli_query($db_handle->connectDB(), $hostsql)) {
			header('Location: kafeler.php?id='.$cafe_id.'&msg=Yorumunuz Gönderildi.');
			//echo "<script>alert('Yorumunuz Gönderildi.');</script>";
		} else {
			  echo "Error: " . $hostsql . "<br>" . mysqli_error($db_handle->connectDB());
		}
	}else{
		echo "<script>alert('Kullanıcı Girişi Yapmalısınız!');</script>";
	}
}
?>
<html>
	<head>
		<title>İnternet Kafem</title>
		<link href="countries/kafeler.css" rel="stylesheet" type="text/css"/>
		<style>
		#container{
			color:white;
		}
		#inside div{
			margin:20px;
		}
		#bloklar div{
			float:left;
			width:240px;
			height:240px;
			margin:10px;
			padding:10px;
			background-color:black;
			opacity:0.9;
			font-size:13px;
			line-height: 1.5;
		}
		.imginblok{
			max-width:240px;
			max-height:240px;
		}
		#reservation{
			width:260px;
			height:260px;
			margin:10px;
			background-color:red;
		}
		.alt{
			padding-top:80px;
		}
		#inside{
			height:580px;
		}
		#container{
			height:700px;
		}
		</style>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<h1><? echo $thiscafe[0]["cafe_name"]; ?></h1>
		    </div>
			
			<div id="inside">
				<?php include('cafes/'.$cafe_id.'.html'); ?>
				<div id="bloklar">
					<div><h3>Önizleme</h3><img class="imginblok" src="cafes/photos/<? echo $cafe_id; ?>.jpg" /></div>
					<div style="font-size:11px;"><h3>Sistem</h3><?php include('cafes/sistem/'.$cafe_id.'.html'); ?></div>
					<div><h3>Ekipmanlar</h3><?php include('cafes/ekipman/'.$cafe_id.'.html'); ?></div>
					<div class="alt"><h3>Hakkımızda</h3><br><br><?php include('cafes/iletisim/'.$cafe_id.'.html'); ?></div>
					<div class="alt" id="reservation">
						<h3>Rezervasyon</h3><br><br>
						<form action="" method="post" id="doreservation">	
						<input name="hour" placeholder="Saat"><br><br>
						<input type="submit" name="doreservation" value="Yer Ayırt"></span>
						</form>
					</div>
					
					<div class="alt" id="comments">
						<h3>Yorumlar</h3><br><br>
						<form action="" method="post" id="docomment">	
						<input name="comment" placeholder="Yorum"><br><br>
						<input name="scoreid" placeholder="Skor ID (1-5)"><br><br>
						<input type="submit" name="docomment" value="Yorum Yap"></span>
						</form>
						<br><br>
						<ul>
						<?
						$score = $auth->getall("score");
						for($i=0;$i<count($comments);$i++){
							$commenter = $auth->getTableByValues("users","user_id",$comments[$i]["cafe_id"]);
							$thisscore = $comments[$i]["score_id"];
							echo '<li><b>'.$commenter[0]["e_mail"].' : <i>['.$score[$thisscore-1]["mean"].'] </i></b><a>'.$comments[$i]["comment"].'</a></li>';
						}
						?>
						</ul>
					</div>
				</div>
			
			<?
			if($thisuser[0]["user_type"]==1 || ($thisuser[0]["user_type"]==3 && $thisuser[0]["cafe_id"]==$cafe_id)){
				echo'
				<div id="adminpanel">
					<a>Kafe Sahibi yetkisine sahipsiniz</a>
					
				</div>
				';
			}
			?>
			</div>
		</div>
	</body>
	<? 
	
if($_GET)
{
	$msg=$_GET["msg"];
	if($msg!=""){
		echo "<script>alert('".$msg."');</script>";
	}
}
	?>
</html>