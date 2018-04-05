<?php

//fetch_comment.php
require_once("../includes/session.php");

//create db connection using PDO
$db = new PDO('mysql:host=localhost;dbname=DList', 'root', 'Ilovephp');

$physicianID = $_SESSION["physician"];

//define query
$query = "SELECT * FROM comments "; 
$query .="WHERE physicianID = $physicianID ";
$query .="ORDER BY date DESC";
//execute query
$statement = $db->prepare($query);
$statement->execute();

$result = $statement->fetchAll();
$output = '';
//output result with foreach loop
foreach($result as $row)
{
    //use bootstrap card class
 $output .= '
 <div class="card my-5">
  <div class="card-header">By <b>'.$row["userEmail"].'</b> on <i>'.$row["date"].'</i></div>
  <div class="card-body">'.$row["message"].'</div>
 </div>
 ';
}

echo $output;
?>
