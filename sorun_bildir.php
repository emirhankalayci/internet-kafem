<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

$user_id = $_SESSION["user_id"];
if($user_id!=""){
	$isLoggedIn=true;
}

if (! empty($_POST["sendcode"])) {
    $topic = $_POST["topic"];
    $aciklama = $_POST["aciklama"];
	$to = "laxer61@hotmail.com";
	$user = $auth->getMemberById($user_id);
	$message = $user[0]["e_mail"]." : ".$aciklama;
	$subject = $topic;
	$headers = "İnternetKafem";
	if (mail($to, $subject, $message, $headers)) {
	   echo '<script>console.log("Mail Gönderildi.");</script>';
	} else {
	   echo '<script>console.log("Mesaj gönderilmedi. Hata: ', $mail->ErrorInfo.'");</script>';
	}
}
?>
?>
<html>
	<head>
		<meta charset="UTF-8">
		<title>İnternet Kafem</title>
		<link href="css/sorun_bildir.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="space">
		    </div>
		<div id="container">
			<div id="header">
				<h1>Sorun Bildir</h1>
			<center>
			<form action="" method="post" id="forgotpass">			
			<input name="topic" placeholder="Konu">
			<input name="aciklama" class="aciklama" placeholder="Açıklama">
			<input type="submit" name="newpassword" value="Sorun Bildir"></span>
			</form>
			</center>
		    </div>
			
		</div>
	</body>
</html>