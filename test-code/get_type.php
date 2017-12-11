<?php
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");

	include 'config.php';
	
	$query = mysql_query("select id_type, type_content from type;");

	$get_type = "";
	while($row = mysql_fetch_assoc($query)) {
	if ($get_type != "") {$get_type .= ",";}
	    $get_type .= '{"id_type":"'  . $row["id_type"] . '",';
	    $get_type .= '"type_content":"'. $row["type_content"] . '"}';
	}
	$get_type ='{"records":['.$get_type.']}';
	mysql_close();

	echo($get_type);
?>

