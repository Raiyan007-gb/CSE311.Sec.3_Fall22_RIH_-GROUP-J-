<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome ADMIN</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
    <div class="page-header">
        <h1>Hi, <b><?php echo htmlspecialchars($_SESSION["Name"]); ?></b>
        <b><?php echo htmlspecialchars($_SESSION["Admin_ID"]); ?></b>. Welcome to our site.</h1>
    </div>
    <p>
        <a href="reset-password-admin.php" class="btn btn-warning">Reset Your Password</a>
        <a href="admin_logout.php" class="btn btn-danger">Sign Out of Your Account</a>
        <a href="see_admin_information.php" class="btn btn-warning">ADMIN Profile</a>
    </p>
    <div class="center">
    <a href="user_pass_reset_request.php" class="btn btn-danger">PASSWORD RECOVERY FOR USER</a>
    <a href="blood_bank_pass_reset_request.php" class="btn btn-danger">PASSWORD RECOVERY FOR BLOOD BANK</a>
    <a href="public_info_from_admin_home.php" class="btn btn-info">PUBLIC INFORMATION</a>
    <a href="bloodbank_info_from_admin_home.php" class="btn btn-info">BLOOD BANK INFORMATION</a>
    </div>
</body>
</html>