<?php
	$hostname = "localhost";
	$username = "root";
	$password = "";
	$database = "test_code";
		
	$connect = @mysql_connect($hostname, $username, $password);
	mysql_select_db($database, $connect);
?>
