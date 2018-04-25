<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../public/css/main.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <title>DList. Finding the right doctors.</title>
</head>

<body>
  <header>
    <nav class="main_nav navbar bg-dark navbar-expand-sm">
      <div class="container justify-content-sm-between">
        <div class="navbar-brand text-info d-none d-sm-inline-block logo_text"><a href="index.php">DList</a></div>
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