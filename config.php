<?php 

	session_start();

	$connect = mysqli_connect('localhost', 'root', '', 'db');

	if (!$connect) {
		die("No connection!" . mysqli_conect_error());
	}

	define('ROOT_PATH', realpath(dirname('Users/Damir/Downloads/OSPanel/domains/projectnumberone/')));
	define('BASE_URL', 'localhost/projectnumberone/');

?>