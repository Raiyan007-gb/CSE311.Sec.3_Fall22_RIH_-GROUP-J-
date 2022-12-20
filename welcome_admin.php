<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
    require "connection.php";   
    $sql="SELECT COUNT(*) AS User_ID
    FROM register_user_info";
    $result=mysqli_query($link,$sql);
    $data=mysqli_fetch_assoc($result);
    $sql1="SELECT COUNT(*) AS User_ID
    FROM blood_bank_info";
    $res=mysqli_query($link,$sql1);
    $data1=mysqli_fetch_assoc($res);
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
        <h1><b><i>ADMIN</b> <b><?php echo htmlspecialchars($_SESSION["Name"]); ?></i></b>
        <b><?php echo htmlspecialchars($_SESSION["Admin_ID"]); ?></b></h1>
        <h1><b><i>Welcome to our site</i></b></h1>
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
    <a href="bloodbank_info_from_admin_home.php" class="btn btn-warning">BLOOD BANK VERIFICATION</a>
    </div>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; 
            margin :auto;padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>TOTAL USER ACCOUNTS <?php echo htmlspecialchars($data['User_ID']); ?></h2>
        <h2>TOTAL BLOOD BANK ACCOUNTS <?php echo htmlspecialchars($data1['User_ID']); ?></h2>
    </div>    
</body>
</html>