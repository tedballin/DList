<?php
    // ***********Database***********
    //1.creaete a database connection
    //use constant values
	define("DB_SERVER", "localhost");
	define("DB_USER", "root");
	define("DB_PASS", "Ilovephp");
    define("DB_Name", "DList");
    
    //function to conneco to db
    function connectToDB($dbhost, $dbuser, $dbpass, $dbname) {
        //create the handle (mysqli object)
        $connection = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);
    //check connection
    if(mysqli_connect_errno()){
        //quit and display error and error number
        die("Database connection failed:" .
        mysqli_connect_error() .
        " (" . mysqli_connect_errno() . ")"
    );
    }
       return $connection;
    }

    //connect
    $db = connectToDB(DB_SERVER,DB_USER,DB_PASS,DB_Name);
    
    // check if theres a query error, and if the query actually changes something
    function confirm_query($result,$db){
        if($result&&mysqli_affected_rows($db)>0){
            //nothing
    }else{
        die("Database query failed.".mysqli_error($db));
        }
    }

    // search result 
    function search_query($result,$db){
        if($result&&mysqli_affected_rows($db)>0){
            //nothing
    }else{
        echo "<h3>No doctors found. Try search with different criteria.</h3>";
        }
    }

    //convert html predefined characters
    function hts($string="") {
        return htmlspecialchars($string);
    }
    //check presence
    function has_presence($value) {
        return isset($value) && $value !== "";
    }


    //displaying errors
    function display_errors($errors=array()) {
        $output = '';
        if(!empty($errors)) {
        $output .= "<div class=\"errors\">";
        $output .= "Please fix the following errors:";
        $output .= "<ul>";
        foreach($errors as $error) {
            $output .= "<li>" . hts($error) . "</li>";
        }
        $output .= "</ul>";
        $output .= "</div>";
        }
        return $output;
    }

        //cleaing input string
    function clean($string) {
        global $db;
        $escaped_string = mysqli_real_escape_string($db, $string);
        return $escaped_string;
    }

        //clean input data
    function cleanData($data){
    $data = trim($data); //trim white space
    $data = stripcslashes($data);
    $data = strip_tags($data); //removes all html and php tags
    return $data;
    }

    //redirect
    function redirect_to($location) {
        header("Location: " . $location);
        exit;
    }


    // security
    function require_SSL() {
        if(!(isset($_SERVER['HTTPS']))){
            header("Location: https://". $_SERVER["HTTP_HOST"]. $_SERVER["REQUEST_URI"]);
            exit();
        }
    }

    function revert_SSL() {
        if(isset($_SERVER['HTTPS'])){
            header("Location: http://". $_SERVER["HTTP_HOST"]. $_SERVER["REQUEST_URI"]);
            exit();
        }
    }

    // *******show physicians*********
    //function to create the physician list
    function format_physician_as_link($page,$id,$firstName,$lastName,$type){
        echo "<a href=\"$page?physician=$id\">$firstName $lastName - $type</a>";
    }

    function format_myphysician_as_link($page,$id,$firstName,$lastName,$description){
        echo "<a href=\"$page?physician=$id\">$firstName $lastName ($description)</a>";
    }


    //********* login **********
    //try login,check if db has this user info
    
    function find_user_by_email($email){
        global $db;
        $safe_email = mysqli_real_escape_string($db,$email);
        $query = "SELECT * ";
        $query .= "FROM members ";
        $query .= "WHERE email = '$safe_email' ";
        $query .= "LIMIT 1";
        $email_result= $db->query($query);
        if($email = $email_result->fetch_assoc()){
            return $email;
        }else{
            return null;
        }
    }
    
    function attempt_login($email,$password) {
        $user = find_user_by_email($email);
        if($user){
            //found email, now check password
        if(password_verify($password,$user["hashedPassword"])){
            //pasword matches
            return $user;
    }else{
        //pass does not match
        return false;
    }
        }else{
        //email not found
        return false;
    }
    } 
    // check log in status, simple check
    function logged_in(){
        //retrun bool value true or false
        return isset($_SESSION["email"]);
    }
    //reinforcement for pages where login is required
    function confirm_logged_in(){
        if(!logged_in()){
            if(isset($_POST["add"])){
                    //store callback url and add request into session for later use (after user log in)
                    $_SESSION["callback_url"] = "/yza314/DList/public/myphysicians.php";
                    $_SESSION["physicianID"] =$_POST["physicianID"];
                }
            //if not loged in redirect
            redirect_to("login.php");
        }
    }

    // *******myphysicians list*********
    function check_exist($userEmail, $physicianID){
        global $db;
        $query = "SELECT * FROM physiciansList WHERE physicianID='$physicianID' AND userEmail='$userEmail'";
        $result = $db -> query($query);
        return mysqli_num_rows($result) > 0;
    }
    
    //perform insert query, add models to the physicianlist
    function add_to_physicianslist($userEmail, $physicianID,$physicianFirst,$physicianLast,$description=""){
        global $db;
        $query  = "INSERT INTO physicianslist ";
        $query .= "(userEmail, physicianID, physicianFirst, physicianLast, description) ";
        $query .= "VALUES ";
        $query .= "('{$userEmail}','{$physicianID}','{$physicianFirst}','{$physicianLast}','{$description}') ";
        $result = $db->query($query);
        confirm_query($result,$db);
        
        //check register result
        if ($result) {
            // Success
            $_SESSION["message"] = "Added to myphysicians list.";
          } else {
            // Fail
            $_SESSION["message"] = "Try again.";
          }
    }

    

    //perform delete query, remove models from the watchlist
    function remove_from_physicianslist($userEmail, $physicianID){
        global $db;
        $query  = "DELETE FROM physicianslist WHERE userEmail ='$userEmail' ";
        $query .= "AND physicianID='$physicianID'";
        $result = $db->query($query);
        confirm_query($result,$db);
    
        if ($result) {
            // Success
            $_SESSION["message"] = "Physician removed.";
            redirect_to("myphysicians.php");
          } else {
            // Failure
            $_SESSION["message"] = "Physician removal failed.";
            redirect_to("myphysicians.php");
          }
        }
    
    function find_all_my_physicians($userEmail){
        global $db;
        $query = "SELECT * ";
        $query .= "FROM physicianslist ";
        $query .= "WHERE userEmail = '$userEmail' ";
        $query .= "ORDER BY physicianLast ASC";
        $plist_result = $db ->query($query);
        // confirm_query($wlist_result,$db);
        return $plist_result;
        
    } 

?>