<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
  header("location: welcome_blood_bank.php");
  exit;
}
 
// Include config file
require_once "connection.php";
 
// Define variables and initialize with empty values
$Name = $user_id = $Bpassword = "";
$Name_err = $user_id_err  = $Bpassword_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if user_id is empty
    if(empty(trim($_POST["user_id"]))){
        $user_id_err  = "Please enter user_id .";
    } else{
        $user_id  = trim($_POST["user_id"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["Bpassword"]))){
        $Bpassword_err = "Please enter your password.";
    } else{
        $Bpassword = trim($_POST["Bpassword"]);
    }
    // Validate credentials
    if(empty($user_id_err) && empty($Bpassword_err)){
        // Prepare a select statement
        $sql = "SELECT user_id, Name,Bpassword FROM blood_bank_info WHERE user_id = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_user_id);
            
            // Set parameters
            $param_user_id  = $user_id;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Store result
                mysqli_stmt_store_result($stmt);
                
                // Check if username exists, if yes then verify password
                if(mysqli_stmt_num_rows($stmt) == 1){                    
                    // Bind result variables
                    mysqli_stmt_bind_result($stmt, $user_id,$Name, $hashed_password);
                    if(mysqli_stmt_fetch($stmt)){
                        if(password_verify($Bpassword, $hashed_password)){
                            // Password is correct, so start a new session
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["user_id"] = $user_id;                          
                            $_SESSION["Name"] = $Name; 
                            // Redirect user to welcome page
                            header("location: welcome_blood_bank.php");
                        } else{
                            // Display an error message if password is not valid
                            $Bpassword_err = "The password you entered was not valid.";
                        }
                    }
                } else{
                    // Display an error message if username doesn't exist
                    $$user_id_err = "No account found with that username.";
                }
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
    <title>LOGIN AS BLOOD BANK</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; 
            margin :auto;padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Blood Bank Login</h2>
        <p>Please fill in your credentials to login.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($user_id_err)) ? 'has-error' : ''; ?>">
                <label>USER ID</label>
                <input type="text" name="user_id" class="form-control" value="<?php echo $user_id; ?>">
                <span class="help-block"><?php echo $user_id_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($Bpassword_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="Bpassword" class="form-control">
                <span class="help-block"><?php echo $Bpassword_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login">
                <a href="pass_req_wit_bbuid.php" class="btn btn-danger">RESET PASS</a>
            </div>
            <p>Don't have an account? <a href="register_blood_bank.php">Register as Blood Bank</a>.</p>
            <p>Go to <a href="login.php">USER</a> Login page</p>
            <p>Login as <a href="admin_login.php">ADMIN </a>.</p>
        </form>
    </div>    
</body>
</html>