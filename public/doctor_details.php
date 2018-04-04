<?php 
require_once("../includes/session.php");
//include functions
require_once("../includes/functions.php");
//get the productname from URL
$physicianID = $_REQUEST["physician"];
$queryString = "SELECT * FROM physicians WHERE ID = ?";

//construct a statement object 
$stmt =$db->prepare($queryString);
//tells php to substitute ? with $modelName
$stmt->bind_param("i",$physicianID);
//run the actual query
$stmt->execute();
$stmt->bind_result($ID,$firstName,$lastName,$type,$gender,$address,$phoneNumber,$availableForNewPt);

//include header
include("../includes/header.php");

echo "<section class=\"container\">";
//physician details
if($stmt->fetch()){
    echo "<h4>$firstName $lastName</h4>\n";
	echo "<ul>";
    echo "<li> Physician ID: $ID</li>";
    echo "<li> Practice Type: $type</li>";
    echo "<li> Gender: $gender</li>";
    echo "<li> Address: $address</li>";
    echo "<li> Phone: $phoneNumber</li>";
    echo "<li> Available for New Patient: $availableForNewPt</li>";
    echo "</ul>";
    
    global $physicianFirst,$physicianLast;
    $physicianFirst = $firstName;
    $physicianLast = $lastName;
}

//free result
$stmt->free_result();

//create add to watchlist button
//check if it's already in the watchlist, if yes, dont display add button
if(@check_exist($_SESSION["email"],$physicianID)==false){
echo "<form action=\"myphysicians.php\" method=\"post\">\n";
echo "<input type=\"hidden\" name=\"physician\" value=\"$ID\">\n";
echo "<input type=\"hidden\" name=\"physicianFirst\" value=\"$physicianFirst\">\n";
echo "<input type=\"hidden\" name=\"physicianLast\" value=\"$physicianLast\">\n";
echo "<b>Add to Myphysicians: </b><br>\n";
echo "<input type=\"text\" name=\"description\" placeholder=\"Description\">\n";
echo "<input type=\"submit\" name=\"add\" value=\"Add\">\n";
echo "</form>";
} else{
    echo "<h3 class=\"sign\"> This physician is alreay in your Myphisicians list </h3>";
}
//set the user email if exist 
$userEmail = !empty($_SESSION["email"])? $_SESSION["email"]:"";
//set timezone and get current time
date_default_timezone_set("America/Vancouver");

echo"
<hr/>
<h3> Comments </h3>
<form>
    <input type='hidden' name='userEmail' value='$userEmail'>
    <input type='hidden' name='date' value='".date('Y-m-d H:i:s')."'>
    <textarea name='message'>
    </textarea><br>
    <input type='reset' name='clear' value='Cancel'>
    <input type='submit' name='comment' value='Comment'>
</form>";


echo"</section>";
//add footer
include('../includes/footer.php');
?>