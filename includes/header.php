<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/main.css">
  <title>DList. Finding the right doctors.</title>
</head>

<body>
  <header>
    <nav class="main_nav navbar bg-dark navbar-dark navbar-expand-sm">
      <div class="container justify-content-sm-between">
        <div class="navbar-brand text-info d-none d-sm-inline-block"><a href="index.php">DList</a></div>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.php">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myphysicians.php">My Physicians</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.php">About</a>
          </li>
          <li class="nav-item">
          <?php if(logged_in()){
             echo "<a class=\"nav-link\" id=\"logInOut\" href=\"logout.php\">".htmlentities($_SESSION["firstName"])." Logout</a>";
         }else{
            echo "<a class=\"nav-link\"   id=\"logInOut\" href=\"login.php\">Login</a>";
         }
             ?>
          </li>
        </ul>
      </div>
    </nav>

  </header>