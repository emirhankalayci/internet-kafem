<?php
require "DBController.php";
date_default_timezone_set('Europe/Istanbul');

class Auth {
    function getMemberByEmail($email) {
        $db_handle = new DBController();
        $query = "Select * from users where e_mail = ?";
        $result = $db_handle->runQuery($query, 's', array($email));
        return $result;
    }
	
    function getMemberById($id) {
        $db_handle = new DBController();
        $query = "Select * from users where user_id = ?";
        $result = $db_handle->runQuery($query, 's', array($id));
        return $result;
    }
	
    function getTableByValues($table, $get, $value) {
		$db_handle = new DBController();
        $query = "Select * from $table where $get like ?";
		//"SELECT * FROM TABLO WHERE KATEGORI = '$kategori' and TEXT LIKE '%$kelime%'"
        $result = $db_handle->runQuery($query, 's', array($value));
        return $result;
    }
	
    function getall($table) {
		$db_handle = new DBController();
        $query = "Select * from $table";
		//"SELECT * FROM TABLO WHERE KATEGORI = '$kategori' and TEXT LIKE '%$kelime%'"
        $result = $db_handle->runQuery($query, '', array());
        return $result;
    }
	
    function sqlcode($query) {
		$db_handle = new DBController();
        $result = $db_handle->runQuery($query, '', array());
        return $result;
    }
	
	function edit($table, $idname, $id, $edit, $value){
		$db_handlee = new DBController();
		$hostsql = "UPDATE $table SET $edit = '$value' WHERE $idname = $id";
		if (mysqli_query($db_handlee->connectDB(), $hostsql)) {
			//Başarılı
		} else {
			echo "<script>console.log('Error: " . $hostsql . " \n " . mysqli_error($db_handlee->connectDB())."');</script>";
		}
	}

    function update($query) {
        mysqli_query($this->conn,$query);
    }
}
?>