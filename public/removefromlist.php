<?php
require_once("../includes/session.php");
//include functions
require_once("../includes/functions.php");
//check and require login for this page
confirm_logged_in();

//get the model name 
$physicianID = $_GET["physician"];
//perform removal action, function is predefined in functions.php
remove_from_physicianslist($_SESSION["email"], $physicianID);

//add footer
include('../includes/footer.php');
?>