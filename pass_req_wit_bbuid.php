<?php
// import the config file
$mysqli = new mysqli("localhost","root","","bddbms");
require_once "connection.php";
 
// Define variables and initialize with null string
$user_id = "";
$user_id_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    if(empty(trim($_POST["user_id"]))){
        $user_id_err = "Enter your User ID.";     
    }elseif(is_numeric(trim($_POST["user_id"]))){
        $user_id = trim($_POST["user_id"]);
    }else{
        $user_id_err = "Please enter a valid USER ID <br>
                        AS EXAMPLE 2013130";
    }

    // Check input errors before inserting in database
    if(empty($user_id_err)){
        
        // Prepare an insert statement
        $sql = "INSERT INTO pass_req_wit_bbuid (user_id) VALUES ( ?)";
        $data = "INSERT INTO blood_bank_pass_reset_request (user_id,Name,Security_code,Contact,Email,Location,Storage_capacity,Verification) 
        SELECT user_id,Name,Security_code,Contact,Email,Location,
        Storage_capacity,Verification
        FROM blood_bank_info
        WHERE user_id =ANY (SELECT user_id
                            FROM pass_req_wit_bbuid
                            WHERE User_ID = ?)";
        $dataCheck = "SELECT user_id FROM blood_bank_info WHERE user_id = ?";       
                
                $stmt = $mysqli->prepare($dataCheck);
                $stmt -> bind_param("i", $user_id); 



                mysqli_report(MYSQLI_REPORT_STRICT);
                if($stmt -> execute()){
                    mysqli_stmt_store_result($stmt);
                    // updated successfully. Destroy the session, and redirect to login page
                    if(mysqli_stmt_num_rows($stmt) == 1){
                        $stmt = $mysqli->prepare($sql);
                $stmt -> bind_param("i", $user_id); 


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
               $stmt -> bind_param("i", $user_id); 
              

               if($stmt -> execute()){
                   // updated successfully. Destroy the session, and redirect to login page
                  header( "refresh:2;url=blood_bank_login.php" ); 
                  echo "";
              }else{
                    header( "refresh:2;url=blood_bank_login.php" ); 
                    echo "";
              }


                    }else{
                        header( "refresh:2;url=blood_bank_login.php" ); 
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
            <div class="form-group <?php echo (!empty($user_id_err)) ? 'has-error' : ''; ?>">
                <label>USER ID</label>
                <input type="number" name="user_id" class="form-control" value="<?php echo $user_id; ?>">
                <span class="help-block"><?php echo $user_id_err; ?></span>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <a class="btn btn-link" href="login.php">Cancel</a>
            </div>
        </form>
    </div>    
</body>
</html>