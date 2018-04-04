<?php
require_once("../includes/session.php");
//include functions
require_once("../includes/functions.php");


//simple logout
unset($_SESSION["email"]);
session_destroy();
redirect_to("login.php");
?>