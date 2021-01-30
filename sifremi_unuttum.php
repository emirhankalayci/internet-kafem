<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

$sentcode = 6137;

if (! empty($_POST["newpassword"])) {
    $isAuthenticated = false;
    
    $email = $_POST["email"];
    $password = $_POST["password"];
    $code = $_POST["code"];
    
    $user = $auth->getMemberByEmail($email);
	
    if ($code == $sentcode) {
        $isAuthenticated = true;
    }
    
    if ($isAuthenticated) {
        $auth->edit("users", "user_id", $user[0]["user_id"], "password", $password);
        //header('Location: giris_yap.php');
		echo "Başarılı";
    } else {
        echo "Hatalı Kod!";
    }
}

if (! empty($_POST["sendcode"])) {
    $email = $_POST["email"];
	
	$to = $email;
	$message = "Şifre değiştirmek için kodunuz : ".$sentcode;
	$subject = "Şifre Değiştirme Talebi";
	$headers = "İnternetKafem";
	if (mail($to, $subject, $message, $headers)) {
	   echo '<script>console.log("Mail Gönderildi.");</script>';
	} else {
	   echo '<script>console.log("Mesaj gönderilmedi. Hata: ', $mail->ErrorInfo.'");</script>';
	}
}
?>
<html>
	<head>
		<meta charset="UTF-8">
		<title>İnternet Kafem</title>
		<link href="css/sifremi_unuttum.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="space">
		    </div>
		<div id="container">
			<div id="header">
				<h1>Şifremi Unuttum</h1>
			<center>
			<form action="" method="post" id="forgotpass">	
			<input name="email" placeholder="E-posta">
			<input type="submit" name="sendcode" value="Kod Gönder"></span>
			<input name="code" placeholder="Kodu Giriniz">
			<input name="password" placeholder="Yeni şifreniz">	
			<input type="submit" name="newpassword" value="Şifreyi Güncelle"></span>
			</form>
			</center>
		    </div>
			
		</div>
	</body>
</html>