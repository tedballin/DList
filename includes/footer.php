<footer id="footer" class="bg-light">
    <div class="container d-flex justify-content-between">
      <div class="footer-block-wrapper">
        <h5>
          Contact
        </h5>
        <ul class="footer_contact">
          <li class="nav-item">
            <a href="#" class="nav__link">+1(604)123-4567</a>
          </li>
          <li class="nav-item">
            <a href="/about-us/senior-management-team" class="nav__link">info@dlist.com</a>
          </li>
          <li class="nav-item">
            <a href="https://www.google.ca/maps/place/1008+W+Pender+St,+Vancouver,+BC+V6E/@49.28673,-123.1202354,17z/data=!3m1!4b1!4m5!3m4!1s0x548671824a6b0e83:0xf7d792a987dea033!8m2!3d49.28673!4d-123.1180467"
              target="_blank" class="nav__link">suite #1000,
              <br>1008 W Pender St,
              <br>Vancouver BC</a>
          </li>
        </ul>
      </div>
      <div class="footer-block-wrapper">
        <h6>DList &copy 2018 All Rights Reserved</h6>
      </div>
      <div class="footer-block-wrapper">
        <h5>Social Media</h5>
      </div>
    </div>
  </footer>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</body>
</html>

<?php
//5. close database connection
//it only closes on pages that have database connection
if(isset($connection)){
   mysqli_close($db);
}
?>