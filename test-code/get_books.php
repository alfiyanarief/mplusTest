<?php
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");

	include 'config.php';
	
	$query = mysql_query("select b.id_book, b.title, b.author, b.date_published, b.number_of_pages, t.type_content
		                              from book as b
		                              left join type as t on t.id_type = b.id_type
		                              group by b.id_book, b.title, b.author, b.date_published, b.number_of_pages, t.type_content
		                              order by b.id_book asc;");

	$get_books = "";
	while($row = mysql_fetch_assoc($query)) {
	if ($get_books != "") {$get_books .= ",";}
	    $get_books .= '{"id_book":"'  . $row["id_book"] . '",';
	    $get_books .= '"title":"'  . $row["title"] . '",';
	    $get_books .= '"author":"'  . $row["author"] . '",';
	    $get_books .= '"date_published":"'  . $row["date_published"] . '",';
	    $get_books .= '"number_of_pages":"'  . $row["number_of_pages"] . '",';
	    $get_books .= '"type_content":"'. $row["type_content"] . '"}';
	}
	$get_books ='{"records":['.$get_books.']}';
	mysql_close();

	echo($get_books);
?>

