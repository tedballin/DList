<?php 
require_once("../includes/session.php");
//include functions
require_once("../includes/functions.php");
//check and require login for this page
include("../includes/header.php");
 ?>
  
  
  <section class="content container">
  <?php
        //2. perform a database query, get the order numbers from database
         $query1 = "SELECT DISTINCT type ";
         $query1 .= "FROM physicians ";
         $query1 .= "WHERE NOT type='General Family Practice' ";
         $query1 .= "ORDER BY type ASC";

         $specialty_result = $db->query($query1);

          // check if theres a query error
         confirm_query($specialty_result,$db);
        ?>

         <img class="w3-image" src="../public/img/main-image.jpg" alt="Doctor Photo" width="100%" height="auto">
        <form class="search_form" action="" method="post">
            <h3>Find a physician</h3>
            <hr/>
            <div class="row">
                <div class="search_column">
                    <label for="">Practice type </label>
                    <br>
                    <input type="radio" name="type" value="General Family Practice" checked> Family Physicians
                    <br>
                    <input type="radio" name="type" value="specialists"> Specialists
                    <div class="specialty" style="display: block">
                        <select name="specialty">
                            <option value="" selected="selected">Select specialty</option>
                            <?php         
                            //3. use returned data, fetch_assoc returns a associative array
                            while($p_specialty = $specialty_result -> fetch_assoc()){
                            ?>
                            <!-- loop the order number and put it into the dropdown list in descending order -->
                            <option vlaue="<?php echo $p_specialty["type"];?>">
                                <?php echo $p_specialty["type"];?>
                            </option>
                            <?php
                                }
                            ?>
                                <?php
                                // 4. free returned data 
                                $specialty_result->free_result();
                            ?>
                        </select>
                    </div>
                    <input type="radio" name="type" value=""> All
                </div>

                <div class="search_column col-sm-3">
                    <label for="">Gender </label>
                    <br>
                    <input type="radio" name="gender" value="Male" checked> Male
                    <br>
                    <input type="radio" name="gender" value="Female"> Female
                    <br>
                    <input type="radio" name="gender" value="either"> Either
                </div>
                <div class="search_column">
                    <label for="">Availability for New Patient </label>
                    <br>
                    <input type="checkbox" name="availability" value="Yes"> Available
                    <br>

                    <label for="">City</label>
                    <br>
                    <input type="text" name="city" placeholder="City">
                </div>

            </div>

            <div class="row">
                <div class="search_column">
                    <label for="">Physician Name</label>
                    <br>
                    <input type="text" name="firstName" placeholder="First name">
                    <input type="text" name="lastName" placeholder="Last name">
                </div>
                
            <div class="search_column col-sm-3 d-flex" style="margin-top: 1.5em; margin-left: 8em;">
                    <input type="reset" value="Clear">
                    <input type="submit" name="submit_btn" value="Search">
            </div>
          </div>
        </form>

    <div class="search_result">
      <h2>Search result:</h2>
    <?php
    if(isset($_POST["submit_btn"])){

        $conditions= "WHERE";
        //get post values
        if(!empty($_POST["gender"])){$gender =  cleanData($_POST["gender"]);
            if($gender=="either"){ $conditions .= " (gender = 'Male' OR gender = 'Female')";}                          
            else{$conditions .= " gender = '$gender'";}}
        if(!empty($_POST["type"])){$practiceType = cleanData($_POST["type"]);
            if($practiceType == "specialists"){$conditions.="AND NOT type = 'General Family Practice'";}
                                 else{ $conditions .= " AND type = '$practiceType'";}}
        if(!empty($_POST["specialty"])){$specialty =  cleanData($_POST["specialty"]);
                                        $conditions .= " AND type = '$specialty'";}
        if(!empty($_POST["availability"])){$availability =  cleanData($_POST["availability"]);
                                        $conditions .= " AND availableForNewPt = '$availability'";}
        if(!empty($_POST["firstName"])){$firstName =  cleanData($_POST["firstName"]);
                                             $conditions .= " AND firstName = '$firstName'";}
        if(!empty($_POST["lastName"])){$lastName =  cleanData($_POST["lastName"]);
                                            $conditions .= " AND lastName = '$lastName'";}
        if(!empty($_POST["city"])){$city =  ucwords(cleanData($_POST["city"]));
                                             $conditions .= " AND address LIKE '%$city%'";}


    //perform a daynamic query based on user's input
    $queryString = "SELECT * ";
    $queryString .= "FROM physicians ";
    $queryString .= $conditions;
    $result = $db->query($queryString);
    //check if there is query error
    search_query($result,$db);
}
    ?>
    <ul>
    <!-- 3. use returned result -->
    <?php
    if(!empty($result)){
    while($physician = $result->fetch_assoc()){
    ?>
    <li>
    <?php    
    format_physician_as_link("doctor_details.php",$physician["ID"],$physician["firstName"],$physician["lastName"],$physician["type"]);
    ?>
    </li>
    <?php
    }
    $result->free_result();
}
    ?>
    </ul>

  </div>
   </section>

<?php
include("../includes/footer.php") ?>