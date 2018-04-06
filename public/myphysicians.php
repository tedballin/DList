<?php 
require_once("../includes/session.php");
//include functions
require_once("../includes/functions.php");
//check and require login for this page
confirm_logged_in();
include("../includes/header.php");


//normal add request as logged in
if(isset($_POST["add"])){
//insert new physician to watchlist
$physician = $_POST["physicianID"];
$physicianFirst = $_POST["physicianFirst"];
$physicianLast = $_POST["physicianLast"];
$description = $_POST["description"];
add_to_physicianslist($_SESSION["email"],$physician,$physicianFirst,$physicianLast,$description);
}

//execute add request automatically after login
if(isset($_SESSION["physicianID"])){
    //check if it's already in the databse before adding it
    if(@check_exist($_SESSION["email"],$_SESSION["physicianID"])==false){   
         add_to_physicianslist($_SESSION["email"],$_SESSION["physicianID"],$_SESSION["physicianFirst"],$_SESSION["physicianLast"],"");
        }
    }


echo "<section class=\"container main_content\">";
echo "<h2>Welcome back, ".$_SESSION["firstName"]."</h2>";
//fetch resul of watchlisted items based on user (email account)
$plist_set = find_all_my_physicians($_SESSION["email"]);
//check if the reuslt is empty by counting the rows
if (mysqli_num_rows($plist_set) > 0){
    //do nothing
}else{
    echo "<h3 class=\"sign\"> Your physicians list is empty.</h3>";
}
echo"
    <table>
        <tr>
            <th style=\"text-align: left; width: 400px;\">Physician</th>
            <th style=\"text-align: left; width: 200px;\">Action</th>
        </tr>";

    while($plist = $plist_set->fetch_assoc()){
        echo "<tr><td>";
        format_myphysician_as_link("doctor_details.php",$plist ["physicianID"],$plist ["physicianFirst"],$plist ["physicianLast"],$plist ["description"]);
        echo "</td>";
        echo "<td><a href=\"removefromlist.php?physician=".$plist["physicianID"]."\" onclick=\"return confirm('Are you sure?');\">Remove</a>";
        echo "</td></tr>";
    }

echo "</table>";
echo"</section>";
$plist_set->free_result();
include("../includes/footer.php");
?>