<?php
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
	
	include 'config.php';
		
	$postdata = file_get_contents("php://input");
    $request = json_decode($postdata);
    
    @$id_book = $request->id_book;
    @$title = $request->title;
    @$author = $request->author;
    @$date_published = $request->date_published;
    @$number_of_pages = $request->number_of_pages;
    @$id_type = $request->id_type;
    @$action = $request->action;
    
    
    mysql_query("START TRANSACTION");
       	
	if($action == 'save'){
		$save = mysql_query("insert into book(id_book, title, author, date_published, number_of_pages, id_type)
										values('$id_book', '$title', '$author', '$date_published', '$number_of_pages', '$id_type');");	
		
		if ($save) {
			mysql_query("COMMIT");
			$commit ='{"opt":true}';
			echo ($commit);
		} else {        
			mysql_query("ROLLBACK");
			$rollback ='{"opt":false}';
			echo ($rollback);
		}			
	}elseif($action == 'edit'){		
		$edit = mysql_query("update book
								set title = '$title',
									author = '$author',
									date_published = '$date_published',
									number_of_pages = '$number_of_pages',
									id_type = '$id_type'
								where id_book = '$id_book'");
								
		if ($edit) {
			mysql_query("COMMIT");
			$commit ='{"opt":true}';
			echo ($commit);
		} else {        
			mysql_query("ROLLBACK");
			$rollback ='{"opt":false}';
			echo ($rollback);
		}
	}elseif($action == 'remove'){
		$remove = mysql_query("delete from book where id_book = '$id_book'");
		
		if ($remove) {
			mysql_query("COMMIT");
			$commit ='{"opt":true}';
			echo ($commit);
		} else {        
			mysql_query("ROLLBACK");
			$rollback ='{"opt":false}';
			echo ($rollback);
		}
	}
?>
