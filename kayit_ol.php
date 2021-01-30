<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

if (! empty($_POST["signup"])) {
	$hosthost = "sql200.byethost31.com";
	$hostuser = "b31_24938894";
	$hostpassword = "123456";
	$hostdatabase = "b31_24938894_users";
	
	$hostconn = mysqli_connect($hosthost, $hostuser, $hostpassword, $hostdatabase);
	if (!$hostconn) {
      die("Connection failed: " . mysqli_connect_error());
	}
	$email = $_POST["email"];
	$emailt = $_POST["emailt"];
    $password = $_POST["password"];
    $passwordt = $_POST["passwordt"];
    $usertype = $_POST["usertype"]; //get select element's value
    $cafeid = $_POST["cafeid"];
    
    $user = $auth->getMemberByEmail($email);
	
	if($email!=$emailt){
		echo "E-postalar uyuşmamaktadır.";
	}else if($password!=$passwordt){
		echo "Şifreler uyuşmamaktadır.";
	}else{
		if(count($user)<=0){
			$hostsql = "INSERT INTO users(user_id, e_mail, password, user_type, cafe_id) VALUES ('','$email','$password','$usertype','$cafeid')";
			$hostsql = mb_convert_encoding($hostsql, "UTF-8", "ISO-8859-9");
			if (mysqli_query($hostconn, $hostsql)) {
				header('Location: giris_yap.php');
			} else {
				  echo "Error: " . $hostsql . "<br>" . mysqli_error($hostconn);
			}
		}else{
			echo "*Bu kullanıcı bulunmaktadır!";
		}
	}
	mysqli_close($hostconn);

}
?>
<html>
	<head>
		<meta charset="UTF-8">
		<title>İnternet Kafem</title>
		<link href="css/kayit_ol.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="space">
		    </div>
		<div id="container">
			<div id="header">
				<h1>Kayıt Ol</h1>
				<center>
				<form action="" method="post" id="signup">
						<input name="email" placeholder="*E-posta">
						<input name="emailt" placeholder="*E-posta Tekrar">
						<input name="password" placeholder="*Şifre">	
						<input name="passwordt" placeholder="*Şifre Tekrar">
						<input name="usertype" placeholder="Kullanıcı(2) / Kafe sahibi(3)">
						<input name="cafeid" placeholder="Kafe ID">
					<div id="selectParent">
					<select>
						<option value="1">Kullanıcı</option>
						<option value="2">Kafe Sahibi</option>           
					</select>
					</div>
					<input type="submit" name="signup" value="Kayıt Ol"></span>
				</form>
				</center>
		    </div>
		</div>
	</body>
</html>