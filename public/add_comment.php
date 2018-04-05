<?php

//add_comment.php
//include session
require_once("../includes/session.php");

//create db connection using PDO
$db = new PDO('mysql:host=localhost;dbname=DList', 'root', 'Ilovephp');

$error = '';
$comment_email= '';
$comment_content = '';
$date = '';

$physicianID = $_POST["physicianID"];
$comment_email= $_POST["userEmail"];
$date = $_POST["date"];


//check, error message
if(empty($_POST["comment_content"]))
{
 $error .= '<p class="">Comment is required</p>';
}
else
{
 $comment_content = $_POST["comment_content"];
}

if($error == '')
{
//define query
 $query = "INSERT INTO comments "; 
 $query .="(physicianID, userEmail, date, message) ";
 $query .="VALUES ";
 $query .="(:physicianID, :userEmail, :date, :message)";

 //prepare statement perform query
 $statement = $db->prepare($query);
 //excute insert query
 $statement->execute(
  array(
   ':physicianID' => $physicianID,
   ':userEmail'    => $comment_email,
   ':date' => $date,
   ':message' => $comment_content
  )
 );
 $error = '<label>Comment Added</label>';
}

//store ouput in an array
$data = array(
 'error'  => $error
);

// convert array to sring and send this data to Ajax
echo json_encode($data);
?>