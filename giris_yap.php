<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

if (! empty($_POST["login"])) {
    $isAuthenticated = false;
    
    $email = $_POST["email"];
    $password = $_POST["password"];
    
    $user = $auth->getMemberByEmail($email);
	
    if ($password == $user[0]["password"]) {
        $isAuthenticated = true;
    }
    
    if ($isAuthenticated) {
        $_SESSION["user_id"] = $user[0]["user_id"];
        header('Location: index.php');
    } else {
        echo "Hatalı Kullanıcı Girişi!";
    }
}
?>
<html>
	<head>
		<meta charset="UTF-8">
		<title>İnternet Kafem</title>
		<link href="css/giris_yap.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="space">
		    </div>
		<div id="container">
			<div id="header">
				<h1>Giriş Yap</h1>
			<center>	
			<form action="" method="post" id="login">
			<input name="email" placeholder="E-posta">
			<input name="password" placeholder="Şifre">	
			<input type="submit" name="login" value="Giriş Yap"></span>
			</form>
			<a href="kayit_ol.php"><button id="btn-register">Kayıt Ol</button></a>
			<a href="sifremi_unuttum.php"><button id="btn-forgot">Şifremi unuttum!</button></a>
			</center>
		    </div>
			
		</div>
	</body>
</html>