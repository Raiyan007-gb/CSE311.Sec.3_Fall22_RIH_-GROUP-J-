<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, otherwise redirect to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
 
// Include config file
require_once "connection.php";
 
// Define variables and initialize with empty values
$Name = $E_mail = "";
$Name_err = $E_mail_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate new password
    if(empty(trim($_POST["Name"]))){
        $Name_err = "Enter your Name.";     
    } elseif(strlen(trim($_POST["Name"])) < 1){
        $Name_err = "Name must characters.";
    } else{
        $Name = trim($_POST["Name"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["E_mail"]))){
        $E_mail_err = "Please enter your E_mail.";
    } else{
        $E_mail = trim($_POST["E_mail"]);
    }
        
    // Check input errors before updating the database
    if(empty($Name_err) && empty($E_mail_err)){
        // Prepare an update statement
        $sql = "UPDATE register_user_info SET Name = ?,E_Mail= ? WHERE User_ID = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssi", $param_Name,$param_E_mail, $param_id);
            
            // Set parameters
            $param_Name = $Name;
            $param_E_mail = $E_mail;
            $param_id = $_SESSION["User_ID"];
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // updated successfully. Destroy the session, and redirect to login page
                session_destroy();
                header("location: login.php");
                exit();
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    
    // Close connection
    mysqli_close($link);
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User Info</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Edit User Info</h2>
        <p>Please fill out this form to Edit User Info.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post"> 
            <div class="form-group <?php echo (!empty($Name_err)) ? 'has-error' : ''; ?>">
                <label>Name</label>
                <input type="Text" name="Name" class="form-control" value="<?php echo $Name; ?>">
                <span class="help-block"><?php echo $Name_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($E_mail_err)) ? 'has-error' : ''; ?>">
                <label>E-Mail</label>
                <input type="Text" name="E_mail" class="form-control" value="<?php echo $E_mail; ?>">
                <span class="help-block"><?php echo $E_mail_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <a class="btn btn-link" href="welcome.php">Cancel</a>
            </div>
        </form>
    </div>    
</body>
</html>