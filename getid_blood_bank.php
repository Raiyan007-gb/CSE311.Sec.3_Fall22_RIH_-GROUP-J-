<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: blood_bank_login.php");
    exit;
}
  require "connection.php";
  $sql = "SELECT user_id FROM blood_bank_info WHERE user_id =($_SESSION[user_id])";
  $result=mysqli_query($link,$sql);
    $data=mysqli_fetch_assoc($result);
  
  $link->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="refresh" content="8;url=blo.php" />
    <title>REGISTER SUCCESFULL</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
</head>
<body>
    <div class="page-header">
    <h2>REMEMBER YOUR BLOOD BANK ID <?php echo htmlspecialchars($data['user_id']); ?></h2>
    </div>
    <div class="center">

    </div>
</body>
</html>