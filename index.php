<?php
date_default_timezone_set('Europe/Istanbul');

session_start();

require_once "komutlar.php";
$auth = new Auth();

$user_id = $_SESSION["user_id"];
if($user_id!=""){
	$isLoggedIn=true;
}
$user = $auth->getMemberById($user_id);

?>
<html>
	<head>
		<meta charset="UTF-8">
		<title>İnternet Kafem</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<h1 style="float:left;">İnternet Kafem</h1>
				<a style="float:right;"><? if($isLoggedIn){ echo "Hoşgeldiniz ".$user[0]["e_mail"]; } ?></a>
		    </div>
			<div id="menu">
				<ul>
				<li><a href="yer_ayirt.php">Yer Ayırt</a></li> 
				<li><a href="sorun_bildir.php">Sorun Bildir</a></li> 
				<li><a href="giris_yap.php">Giriş Yap</a></li> 
				<li><a href="logout.php">Çıkış Yap</a></li> 
				</ul>
			</div>
			<div id="inside">
				<p> Yukarıdaki yer ayırt kısmından bulunduğunuz şehri seçip oradaki internet kafeleri inceleyip size uygun olanına gitmek için yer ayırtabilirsiniz. (Yakında bütün şehirlerde)</p>
				<p> Ayrıca internet kafeler hakkında bir çok bilgi öğrenebilirsiniz. Bilgisayarların sistem özellikleri neler, kullanınan ekipmanlar neler, adres ve iletişim bilgileri ve fazlası.</p>
				<p> Sorun bildir kısmından ise herhangi bir problemle karşılaşırsanız bizimle iletişime geçebilirsiniz.</p>
				<p> Kayıt olup aramıza katılmaya ne dersin? hemen ''Giriş Yap''a tıkla </p>
			</div>
	</body>
</html>