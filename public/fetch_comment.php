<?php

//fetch_comment.php
require_once("../includes/session.php");

//create db connection using PDO
$db = new PDO('mysql:host=localhost;dbname=DList', 'root', 'Ilovephp');

$physicianID = $_SESSION["physicianID"];

//define query
$query = "SELECT * FROM comments "; 
$query .="WHERE physicianID = $physicianID ";
$query .="ORDER BY date DESC";
//execute query
$statement = $db->prepare($query);
$statement->execute();

$result = $statement->fetchAll();
$output = '';

//function to obscure email address for privacy
function obfuscate_email($email)
{
    $em   = explode("@",$email);
    $name = implode(array_slice($em, 0, count($em)-1), '@');
    $len  = floor(strlen($name)/2);

    return substr($name,0, $len) . str_repeat('*', $len) . "@" . end($em);   
}


//output result with foreach loop
foreach($result as $row)
{
    //use bootstrap card class
 $output .= '
 <div class="card my-5">
  <div class="card-header">By <b>'.obfuscate_email($row["userEmail"]).'</b> on <i>'.$row["date"].'</i></div>
  <div class="card-body">'.$row["message"].'</div>
 </div>
 ';
}

echo $output;
?>
