<?php
// import the config file
$mysqli = new mysqli("localhost","root","my_password","bddbms");
require_once "connection.php";
 
// Define variables and initialize with null string
$User_ID = "";
$User_ID_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    if(empty(trim($_POST["User_ID"]))){
        $User_ID_err = "Enter your User_ID.";     
    }elseif(is_numeric(trim($_POST["User_ID"]))){
        $User_ID = trim($_POST["User_ID"]);
    }else{
        $User_ID_err = "Please enter a valid USER ID <br>
                        AS EXAMPLE 2013130";
    }

    // Check input errors before inserting in database
    if(empty($User_ID_err)){
        
        // Prepare an insert statement
        $sql = "INSERT INTO pass_req_wit_uid (User_ID) VALUES ( ?)";
        $data = "INSERT INTO user_pass_reset_request (User_ID,Username,Name,E_mail,Contact,UserType) 
                 SELECT User_ID,Username,Name,E_mail,Phone,UserType	
                 FROM register_user_info
                 WHERE User_ID =ANY (SELECT User_ID
                                     FROM pass_req_wit_uid
                                     WHERE User_ID = ?)";
        $dataCheck = "SELECT User_ID FROM register_user_info WHERE User_ID = ?";       
                
                $stmt = $mysqli->prepare($dataCheck);
                $stmt -> bind_param("i", $User_ID); 



                mysqli_report(MYSQLI_REPORT_STRICT);
                if($stmt -> execute()){
                    mysqli_stmt_store_result($stmt);
                    // updated successfully. Destroy the session, and redirect to login page
                    if(mysqli_stmt_num_rows($stmt) == 1){
                        $stmt = $mysqli->prepare($sql);
                $stmt -> bind_param("i", $User_ID); 


                if($stmt -> execute()){
                    // updated successfully. Destroy the session, and redirect to login page
                   echo'<h1><center><b>"Requested for password Recovery"</b>
                     <br><b>Wait for admin response and check your e-mail</b><br>
                     redirecting you to login page in ...2...1 Seconds!!</center></h1>';
                   
              
               }else{

                     echo'<h1><center><b style="color:red">"You have already requested for reset password"</b>
                     <br><b style="color:red">Wait for admin response and check your e-mail</b><br>
                     <b style="color:red">redirecting you to login page in .2...1 Seconds!!</b></center></h1>';
                   
               }
               $stmt = $mysqli->prepare($data);
               $stmt -> bind_param("i", $User_ID); 
              

               if($stmt -> execute()){
                   // updated successfully. Destroy the session, and redirect to login page
                  header( "refresh:2;url=login.php" ); 
                  echo "";
              }else{
                    header( "refresh:2;url=login.php" ); 
                    echo "";
              }


                    }else{
                        header( "refresh:2;url=login.php" ); 
                        echo'<h1><center><b style="color:red">"User ID not found which has been provided"</b>
                        <br>
                        <b style="color:red">redirecting you to login page in ..2...1 Seconds!!</b></center></h1>';
                  }
                  
                }
                mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
                
             
             // Close statement
             $stmt -> close();
             $mysqli -> close();
            
        }
    



    // Close connection
    mysqli_close($link);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PASSWORD RECOVERY</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>PASSWORD RECOVERY</h2>
        <p>Please provide valid User ID so Admin can aprove you password recovery</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post"> 
            <div class="form-group <?php echo (!empty($User_ID_err)) ? 'has-error' : ''; ?>">
                <label>USER ID</label>
                <input type="number" name="User_ID" class="form-control" value="<?php echo $User_ID; ?>">
                <span class="help-block"><?php echo $User_ID_err; ?></span>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <a class="btn btn-link" href="login.php">Cancel</a>
            </div>
        </form>
    </div>    
</body>
</html>