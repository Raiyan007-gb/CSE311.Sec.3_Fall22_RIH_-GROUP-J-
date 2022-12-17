<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: blood_bank_login.php");
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
        <h1>Hi, <b><?php echo htmlspecialchars($_SESSION["Name"]); ?></b>
        <b><?php echo htmlspecialchars($_SESSION["user_id"]); ?></b>. Welcome to our site.</h1>
    </div>
    <p>
        <a href="reset-password-blood-bank.php" class="btn btn-warning">Reset Your Password</a>
        <a href="blood_bank_logout.php" class="btn btn-danger">Sign Out of Your Account</a>
        <a href="edit_blood_bank_info.php" class="btn btn-warning">Edit Information</a>
        <a href="see_blood_bank_information.php" class="btn btn-warning">Profile Info</a>
        <a href="delete_blood_bank_data_confirmation.php" class="btn btn-danger">Delete your Profile</a>
    </p>
    <div class="center">

    </div>
</body>