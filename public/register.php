<?php 
require_once("../includes/session.php");
require_once("../includes/functions.php");
// require_SSL();
include("../includes/header.php");

//create an error array
$errors =array();
$message ="";

// Process the form
if (isset($_POST['submit'])) {
  $fname=clean($_POST["firstname"]);
  $lname=clean($_POST["lastname"]);
  $email=clean($_POST["email"]);
  $password = clean($_POST["password"]);
  $confirm_password = clean($_POST["confirm_passowrd"]);
  $age = clean($_POST["age"]);
  $gender = clean($_POST["gender"]);
  $address = clean($_POST["address"]);

  if($password == $confirm_password){
    $hashed_passowrd = password_hash($password, PASSWORD_BCRYPT);
  } else{
      $errors[] = "Password does not match the confirm password.";
  }
// Validations
if(!has_presence($fname)) {
  $errors[] = "First name cannot be blank.";
}
if(!has_presence($lname)) {
  $errors[] = "Last name cannot be blank.";
}
if(!has_presence($email)) {
  $errors[] = "Email cannot be blank.";
}
if(!has_presence($password)) {
  $errors[] = "Password cannot be blank.";
}
if(!has_presence($confirm_password)) {
  $errors[] = "Confirm passsword cannot be blank.";
}
if(!has_presence($age)) {
  $errors[] = "Age cannot be blank.";
}
if(!has_presence($gender)) {
  $errors[] = "Gender cannot be blank.";
}
if(!has_presence($address)) {
  $errors[] = "Address cannot be blank.";
}

if(empty($errors)){

  $query  = "INSERT INTO members ";
  $query .= "(firstName, lastName, email, hashedPassword,age,gender,address) ";
  $query .= "VALUES ";
  $query .= "('{$fname}', '{$lname}', '{$email}', '{$hashed_passowrd}','{$age}','{$gender}','{$address}')";
  $result = $db->query($query);
  confirm_query($query,$db);

  $_SESSION["email"] = $email;
  $_SESSION ["firstName"]=$fname;
  //check register result
  if ($result) {
      echo "<h3>success!</h3>";
      // Success
      $_SESSION["message"] = "Account created.";
      redirect_to("myphysicians.php");
    } else {
      // Fail
      $_SESSION["message"] = "Account creation failed.";
    }
  }
}
echo "<section class=\"container\">";
echo "<div class=\"row flex-column col-12 my-5\">";
echo "<h3>Register</h3>";
//this allows me to write html code without quote
print <<< FORM
  <form action="register.php" method="post" class="register">
  First name: <br>
  <input type="text" name="firstname" value="" class="reg-input"><br>
  Last name:<br>
  <input type="text" name="lastname" value=""><br>
  Email:<br>
  <input type="email" name="email" value=""><br>
  Password:<br>
  <input type="password" name="password" value=""><br>
  Confirm Password:<br>
  <input type="password" name="confirm_passowrd" value=""><br>
  Age:<br>
  <input type="text" name="age" value=""><br>
  Gender:<br>
  <input type="text" name="gender" value=""><br>
  Address:<br>
  <textarea rows="4" cols="50" name="address" value="">
  </textarea>
  <br><br>
  <a href="showmodels.php">Cancel</a>
  <input type="submit" name=submit value="Register" class="button special">
  
  </form>
  <br />
FORM;

echo display_errors($errors);
echo "</div>";
echo"</section>";


include("../includes/footer.php");
?>