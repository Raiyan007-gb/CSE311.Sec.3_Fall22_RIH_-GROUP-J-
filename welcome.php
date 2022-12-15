<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
    <div class="page-header">
        <h1>Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>
        <b><?php echo htmlspecialchars($_SESSION["User_ID"]); ?></b>. Welcome to our site.</h1>
    </div>
    <p>
        <a href="reset-password.php" class="btn btn-warning">Reset Your Password</a>
        <a href="logout.php" class="btn btn-danger">Sign Out of Your Account</a>
        <a href="edit_user_info.php" class="btn btn-warning">EDIT YOUR INFORMATION</a>
        <a href="become_a_donor.php" class="btn btn-info">BE A DONOR</a>
        <a href="see_user_information.php" class="btn btn-warning">SEE OWN INFORMATION</a>
        <a href="delete_user_data_confirmation.php" class="btn btn-danger">Delete your Profile</a>
    </p>
    <div class="center">
                
    </div>
</body>
</html>












<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; text-align: center; }
.dropbtn {
  background-color: #ff0000;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #ff0000;}
</style>
</head>
<body>
    <label for="FIND's DONOR"></label>
          <div class="dropdown">
            <button class="dropbtn">FIND's DONOR</button>
           <div class="dropdown-content">
                <a href="AB+.php">AB+ (AB POSITIVE)</a>
                <a href="AB-.php">AB- (AB NEGATIVE)</a>
                <a href="A+.php">A+ (A POSITIVE)</a>
                <a href="A-.php">A- (A NEGATIVE)</a>
                <a href="B+.php">B+ (B POSITIVE)</a>
                <a href="B-.php">B- (B NEGATIVE)</a>
                <a href="O+.php">O+ (O POSITIVE)</a>
                <a href="O-.php">O- (O NEGATIVE)</a>
           </div>
          </div>
    <div class="center">

    </div>
</body>
</html>
