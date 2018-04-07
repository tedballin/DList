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

//function to obfuscate email address for protecting privacy 
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
    //ratings
    $knowledge_rating = $row["knowledge_rating"];
    $helpfulness_rating = $row["helpfulness_rating"];
    //color var for star
    $color1 = "";
    $color2 = "";
    //use bootstrap card class
 $output .= '
 <div class="card my-5">
  <div class="card-header">By <b>'.obfuscate_email($row["userEmail"]).'</b> on <i>'.$row["date"].'</i></div>
  <div class="card-body">
  <span>Knowledge Rating:</span>
  <ul class="list-inline" data-rating="'.$knowledge_rating.'" title="Knowledge Rating - '.$knowledge_rating.'">
 ';
 for($count=1; $count<=5; $count++)
 {
  if($count <= $knowledge_rating)
  {
   $color1 = 'color:#ffcc00;';
  }
  else
  {
   $color1 = 'color:#ccc;';
  }
  $output .= '<li title="'.$count.'" id="knowledge_rating-'.$count.'" data-index="'.$count.'"  physician_id="'.$row['physicianID'].'" data-rating="'.$knowledge_rating.'" class="rating list-inline-item" style="cursor:pointer; '.$color1.' font-size:16px;">&#9733;</li>';
}   
  $output .= '</ul><span>Helpfulness Rating:</span>';
  $output .= '<ul class="list-inline" data-rating="'.$helpfulness_rating.'" title="Helpfulness Rating - '.$helpfulness_rating.'">
 ';
 for($count=1; $count<=5; $count++)
 {
  if($count <= $helpfulness_rating)
  {
   $color2 = 'color:#ffcc00;';
  }
  else
  {
   $color2 = 'color:#ccc;';
  }
  $output .= '<li title="'.$count.'" id="helpfulness_rating-'.$count.'" data-index="'.$count.'"  physician_id="'.$row['physicianID'].'" data-rating="'.$helpfulness_rating.'" class="rating list-inline-item" style="cursor:pointer; '.$color2.' font-size:16px;">&#9733;</li>';
} 
 $output .= '</ul></div><hr />';
 $output .= '<div class="card-body">'.$row["message"].'</div>
 </div>';
}

echo $output;
?>