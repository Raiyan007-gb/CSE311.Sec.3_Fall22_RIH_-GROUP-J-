<?php
// import the config file
require_once "connection.php";
 
// Define variables and initialize with null string
$user_id = $Bpassword= $confirm_Bpassword = $Name = $Security_code = $Contact = $Email = $Location = $Storage_capacity 
=$facilities = $Verififation = "";
$user_id_err = $Bpassword_err = $confirm_Bpassword_err = $Name_err = $Security_code_err = $Contact_err
 = $Email_err = $Location_err = $Storage_capacity_err 
=$facilities_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate username
    if(empty(trim($_POST["Name"]))){
        $Name_err = "Please enter a Name.";
    } else{
        // Prepare a select statement
        $sql = "SELECT user_id FROM blood_bank_info WHERE Name = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $Name);
            
            // Set parameters
            $param_Name = trim($_POST["Name"]);
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                /* store result */
                mysqli_stmt_store_result($stmt);
                
                if(mysqli_stmt_num_rows($stmt) == 1){
                    $Name_err = "This Blood Bank Name is already taken.";
                } else{
                    $Name = trim($_POST["Name"]);
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
        
    }
    
    // Validate password
    if(empty(trim($_POST["Bpassword"]))){
        $Bpassword_err = "Please enter a password.";     
    } elseif(strlen(trim($_POST["Bpassword"])) < 6){
        $Bpassword_err = "Password must have atleast 6 characters.";
    } else{
        $Bpassword = trim($_POST["Bpassword"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["confirm_Bpassword"]))){
        $confirm_Bpassword_err = "Please confirm password.";     
    } else{
        $confirm_Bpassword = trim($_POST["confirm_Bpassword"]);
        if(empty($Bpassword_err) && ($Bpassword != $confirm_Bpassword)){
            $confirm_Bpassword_err = "Password did not match.";
        }
    }
    // Validate Email
    if(empty(trim($_POST["Email"]))){
        $Email_err = "Please enter the E-mail.";
    } else{
        $Email = trim($_POST["Email"]);
    }

    if(empty(trim($_POST["Security_code"]))){
        $Security_code_err = "Enter the Security code.";     
    }elseif(is_numeric(trim($_POST["Security_code"])) && strlen(trim($_POST["Security_code"])) ==10){
        $Security_code = trim($_POST["Security_code"]);
    }else{
        $Security_code_err = "you must enter a valid Security code";
    }

    if(empty(trim($_POST["Contact"]))){
        $Contact_err = "Enter the Contact number.";     
    }elseif(is_numeric(trim($_POST["Contact"])) && strlen(trim($_POST["Contact"])) ==11){
        $Contact = trim($_POST["Contact"]);
    }else{
        $Contact_err = "You must provide a valid Contact number.";
    }

    if(empty(trim($_POST["Location"]))){
        $Location_err = "Enter the Location.";     
    }else{
        $Location = trim($_POST["Location"]);
    }

    if(empty(trim($_POST["Storage_capacity"]))){
        $Storage_capacity_err = "Enter the Storage_capacity.";     
    }elseif(is_numeric(trim($_POST["Storage_capacity"]))){
        $Storage_capacity = trim($_POST["Storage_capacity"]);
    }else{
        $Storage_capacity_err = "Enter your Storage capacity.";
    }

    if(empty(trim($_POST["facilities"]))){
        $facilities_err = "Enter the facilities.";     
    }else{
        $facilities = trim($_POST["facilities"]);
    }

    $Verification = trim($_POST["Verification"]);
    
    
    
    // Check input errors before inserting in database
    if(empty($Name_err) && empty($Bpassword_err) && empty($Security_code_err) && empty($confirm_Bpassword_err)&& empty($Email_err)&& empty($Contact_err)&& empty($Location_err)
    && empty($Storage_capacity_err)&& empty($facilities_err)){
        
        // Prepare an insert statement
        $sql = "INSERT INTO blood_bank_info (Name, Bpassword,Security_code,Contact,Email
        ,Location,Storage_capacity,facilities,Verification) VALUES ( ?,?,?, 
        ?, ?,?,?, ?, ?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssisssiss", $param_Name, $param_Bpassword,$Security_code,
            $Contact,$Email,$Location,$Storage_capacity,$facilities,$Verification);
            
            // Set parameters
            $param_Name = $Name;
            $param_Bpassword = password_hash($Bpassword, PASSWORD_DEFAULT); // Creates a password hash
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Redirect to login page
                header("location: blood_bank_login.php");
            } else{
                echo "Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    
    // Close connection







    //verification will be manage by admin
    mysqli_close($link);
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up as Blood Bank</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Sign Up</h2>
        <p>Please fill this form to create an account as BLOOD BANK.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($Name_err)) ? 'has-error' : ''; ?>">
                <label>Blood Bank Name</label>
                <input type="text" name="Name" class="form-control" value="<?php echo $Name; ?>">
                <span class="help-block"><?php echo $Name_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($Bpassword_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="Bpassword" class="form-control" value="<?php echo $Bpassword; ?>">
                <span class="help-block"><?php echo $Bpassword_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($confirm_Bpassword_err)) ? 'has-error' : ''; ?>">
                <label>Confirm Password</label>
                <input type="password" name="confirm_Bpassword" class="form-control" value="<?php echo $confirm_Bpassword; ?>">
                <span class="help-block"><?php echo $confirm_Bpassword_err; ?></span>
            </div>

            <div class="form-group <?php echo (!empty($Security_code_err)) ? 'has-error' : ''; ?>">
                <label>Security Code</label>
                <input type="text" name="Security_code" class="form-control" value="<?php echo $Security_code; ?>">
                <span class="help-block"><?php echo $Security_code_err; ?></span>
            </div>  
            <div class="form-group <?php echo (!empty($Contact_err)) ? 'has-error' : ''; ?>">
                <label>Contact</label>
                <input type="text" name="Contact" class="form-control" value="<?php echo $Contact; ?>">
                <span class="help-block"><?php echo $Contact_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Email_err)) ? 'has-error' : ''; ?>">
                <label>E-Mail</label>
                <input type="email" name="Email" class="form-control" value="<?php echo $Email; ?>">
                <span class="help-block"><?php echo $Email_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Location_err)) ? 'has-error' : ''; ?>">
                <label>Location</label>
                <input type="text" name="Location" class="form-control" value="<?php echo $Location; ?>">
                <span class="help-block"><?php echo $Location_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Storage_capacity_err)) ? 'has-error' : ''; ?>">
                <label>Storage Capacity</label>
                <input type="text" name="Storage_capacity" class="form-control" value="<?php echo $Storage_capacity; ?>">
                <span class="help-block"><?php echo $Storage_capacity_err; ?></span>
            </div>  
            <div class="form-group <?php echo (!empty($facilities_err)) ? 'has-error' : ''; ?>">
                <label>Facilities</label>
                <input type="text" name="facilities" class="form-control" value="<?php echo $facilities; ?>">
                <span class="help-block"><?php echo $facilities_err; ?></span>
            </div> 
            
            <div>
                <label for="Verification">Declair:</label>
                  <select id="Verification" name="Verification">
                  <option value="Not Verified">Not Verified</option>
                  </select><br><br>                                      
            </div>
         
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
            <p>Already have an account? <a href="blood_bank_login.php">Login here</a>.</p>
        </form>
    </div>    
</body>
</html>