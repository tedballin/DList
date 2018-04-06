<?php 
require_once("../includes/session.php");
//include functions
require_once("../includes/functions.php");
//get the physicianID from URL
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
echo "<input type=\"hidden\" name=\"physicianID\" value=\"$ID\">\n";
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
//set physicianID in session
$_SESSION["physicianID"] = $physicianID;
$_SESSION["physicianFirst"] = $physicianFirst;
$_SESSION["physicianLast"] = $physicianLast;
//set timezone and get current time
date_default_timezone_set("America/Vancouver");

echo"
<hr/>
<h3> Comments </h3>
<form method='post' id='comment_form'>
    <input type='hidden' name='userEmail' value='$userEmail'>
    <input type='hidden' name='physicianID' value='$physicianID'>
    <input type='hidden' name='date' value='".date('Y-m-d H:i:s')."'>
    <textarea name='comment_content'></textarea><br>
    <input type='reset' name='clear' value='Cancel'>
    <input type='submit' name='submit' id='submit' value='Comment'>
</form>";
//check if the user has logged in, if not hide the comment box
if(!isset($_SESSION["email"])){
    echo"<script type = 'text/javascript'>document.getElementById('comment_form').style.display = 'none';</script>";
}

//displaying all comments
echo "
<span id='comment_message'></span>
<div id='display_comment'>
</div>";


echo"</section>";
//add footer
include('../includes/footer.php');
?>

<script type="text/javascript">
    //make sure everything has loaded
    $(document).ready(function(){

        //submit comment data, execute when the form is submitted
        $('#comment_form').on('submit',function(event){
            //this fucntion will stop submitting form data to server
            event.preventDefault();
            //convert form data to URL encoded string
            var form_data=$(this).serialize();
            console.log(form_data);
            //ajax request
            $.ajax({
                //send request to add_comment page
                url:"add_comment.php",
                //define method to send data
                method:"POST",
                //define the data want ot send to server
                data:form_data,
                //define data type that we want to receive - JSON
                dataType:"JSON",
                //success callback function, receive data from server
                success:function(data) {
                    //check if there;s data error
                    if(data.error!=''){
                        //reset form field
                        $('#comment_form')[0].reset();
                        //display error message under div with comment
                        $('#comment_message').html(data.error);
                        load_comment();
                    }
                }
            })
        });
    load_comment();
    function load_comment(){
        $.ajax({
            //send request to fetch_comment
            url:"fetch_comment.php",
            method:"POST",
            //success callback, display with html()
            success:function(data){
                $('#display_comment').html(data);
            }
        })
    }
    });
</script>


