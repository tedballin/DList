<?php 
require_once("../includes/session.php");
require_once("../includes/functions.php");
// require_SSL();
include("../includes/header.php");

  // process submission
//create an error array
$errors =array();
$email="";

//check if form is submitted 
if(isset($_POST["submit"])){
    //get user's input
    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);

 //validations
    //create a required array
    if(!has_presence($email)) {
      $errors[] = "Email cannot be blank.";
    }
    if(!has_presence($password)) {
      $errors[] = "Password cannot be blank.";
    }


if(empty($errors)){
 //try to login 
 $email=clean($_POST["email"]);
  $password = clean($_POST["password"]);
 //either find the user or rutrn null(false)
$found_user = attempt_login($email,$password);
  if($found_user){
      //sucess
      //mark user as logged in
      $_SESSION["email"]=$found_user["email"];
      $_SESSION["firstName"]=$found_user["firstName"];
      // redirect to callback if one set
      $callback_url = "/yza314/DList/public/myphysicians.php";
      if(isset($_SESSION["callback_url"]))
      $callback_url = $_SESSION["callback_url"];
      //switchback to non-secure http
      header("Location: http://".$_SERVER["HTTP_HOST"].$callback_url);
  } else {
      $_SESSION["message"] = "Email/password not found.";
      echo $_SESSION["message"];
  }
}
}

echo "<section class=\"container\">";
echo "<div class=\"login_form\">";
print <<< FORM
 <h3 style="padding-top: 0.5em;">Log In</h3>

 <form action="login.php" method="post"> 
     Email:
     <input type= "text" name="email" value="$email"/>
     Password:
     <input type="password" name="password" value=""/>
     <input type="submit" name="submit" value="Log In"/>
     <br>
     <a href="register.php">Not registered yet? Register here.</a>
 </form>
FORM;
echo "</div>";
echo"</section>"
?> 
<?php
include("../includes/footer.php") ?>