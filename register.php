<?php
// import the config file
require_once "connection.php";
 
// Define variables and initialize with null string
$username = $password = $confirm_password = $Name = $Age = $Phone = $E_mail = $Location 
= $Last_Donation =$UserType = $Preferred_Date= $Blood_Type =$Health_Problem = "";
$username_err = $password_err = $confirm_password_err = $Name_err = $Age_err = $Phone_err = $E_mail_err = $Location_err 
= $Last_Donation_err = $UserType_err = $Preferred_Date_err = $Blood_Type_err = $Health_Problem_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate username
    if(empty(trim($_POST["Username"]))){
        $username_err = "Please enter a Username.";
    } else{
        // Prepare a select statement
        $sql = "SELECT User_ID FROM register_user_info WHERE Username = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);
            
            // Set parameters
            $param_username = trim($_POST["Username"]);
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                /* store result */
                mysqli_stmt_store_result($stmt);
                
                if(mysqli_stmt_num_rows($stmt) == 1){
                    $username_err = "This Username is already taken.";
                } else{
                    $username = trim($_POST["Username"]);
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
        
    }
    
    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter a password.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Password must have atleast 6 characters.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Please confirm password.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Password did not match.";
        }
    }
    if(empty(trim($_POST["Name"]))){
        $Name_err = "Enter your Name.";     
    } elseif(strlen(trim($_POST["Name"])) < 1){
        $Name_err = "Name must be characters.";
    } else{
        $Name = trim($_POST["Name"]);
    }
    
    // Validate Email
    if(empty(trim($_POST["E_mail"]))){
        $E_mail_err = "Please enter your E_mail.";
    } else{
        $E_mail = trim($_POST["E_mail"]);
    }

    if(empty(trim($_POST["Age"]))){
        $Age_err = "Enter your Age.";     
    }elseif($_POST["Age"] < 18){
        $Age_err = "You Must Be At Least 18 Years Old";
    }else{
        $Age = trim($_POST["Age"]);
    }

    if(empty(trim($_POST["Phone"]))){
        $Phone_err = "Enter your Phone number.";     
    }elseif(is_numeric(trim($_POST["Phone"])) && strlen(trim($_POST["Phone"])) ==11){
        $Phone = trim($_POST["Phone"]);
    }else{
        $Phone_err = "You must provide a valid Phone number.";
    }

    if(empty(trim($_POST["Location"]))){
        $Location_err = "Enter your Location.";     
    }else{
        $Location = trim($_POST["Location"]);
    }

    if(empty(trim($_POST["Last_Donation"]))){
        $Last_Donation_err = "Enter your Last Donation.";     
    }elseif(is_numeric(trim($_POST["Last_Donation"]))){
        $Last_Donation = trim($_POST["Last_Donation"]);
    }else{
        $Last_Donation_err = "Enter your Last Donation in Days.";
    }

    if(empty(trim($_POST["UserType"]))){
        $UserType_err = "Enter your UserType.";     
    }else{
        $UserType = trim($_POST["UserType"]);
    }

    if(empty(trim($_POST["Preferred_Date"]))){
        $Preferred_Date_err = "Enter your Preferred_Date.";     
    }else{
        $Preferred_Date = trim($_POST["Preferred_Date"]);
    }

    if(empty(trim($_POST["Health_Problem"]))){
        $Health_Problem_err = "Enter your Health Problem.";     
    }else{
        $Health_Problem = trim($_POST["Health_Problem"]);
    }
    
    $Blood_Type= trim($_POST["Blood_Type"]);
    
    
    
    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err)&& empty($Name_err)&& empty($E_mail_err)&& empty($Age_err)&& empty($Phone_err)&& empty($Location_err)&& empty($Last_Donation_err)
    && empty($UserType_err)&& empty($Preferred_Date_err)&& empty($Health_Problem_err)){
        
        // Prepare an insert statement
        $sql = "INSERT INTO register_user_info (Username, Password,Name,Age,Phone,E_mail
        ,Location,Last_Donation,UserType,Preferred_Date,Blood_Type,Health_Problem) VALUES ( ?,?,?, 
        ?, ?,?,?, ?, ?,?,?,?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssssssssssss", $param_username, $param_password,$Name,$Age,
            $Phone,$E_mail,$Location,$Last_Donation,$UserType,$Preferred_Date,$Blood_Type,
            $Health_Problem);
            
            // Set parameters
            $param_username = $username;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Redirect to login page
                header("location: login.php");
            } else{
                echo "Something went wrong. Please try again later.";
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
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Sign Up</h2>
        <p>Please fill this form to create an account.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label>Username</label>
                <input type="text" name="Username" class="form-control" value="<?php echo $username; ?>">
                <span class="help-block"><?php echo $username_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control" value="<?php echo $password; ?>">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
                <label>Confirm Password</label>
                <input type="password" name="confirm_password" class="form-control" value="<?php echo $confirm_password; ?>">
                <span class="help-block"><?php echo $confirm_password_err; ?></span>
            </div>

            <div class="form-group <?php echo (!empty($Name_err)) ? 'has-error' : ''; ?>">
                <label>Name</label>
                <input type="text" name="Name" class="form-control" value="<?php echo $Name; ?>">
                <span class="help-block"><?php echo $Name_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Age_err)) ? 'has-error' : ''; ?>">
                <label>Age</label>
                <input type="text" name="Age" class="form-control" value="<?php echo $Age; ?>">
                <span class="help-block"><?php echo $Age_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Phone_err)) ? 'has-error' : ''; ?>">
                <label>Phone</label>
                <input type="text" name="Phone" class="form-control" value="<?php echo $Phone; ?>">
                <span class="help-block"><?php echo $Phone_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($E_mail_err)) ? 'has-error' : ''; ?>">
                <label>E-Mail</label>
                <input type="email" name="E_mail" class="form-control" value="<?php echo $E_mail; ?>">
                <span class="help-block"><?php echo $E_mail_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Location_err)) ? 'has-error' : ''; ?>">
                <label>Location</label>
                <input type="text" name="Location" class="form-control" value="<?php echo $Location; ?>">
                <span class="help-block"><?php echo $Location_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Last_Donation_err)) ? 'has-error' : ''; ?>">
                <label>Last Donation</label>
                <input type="text" name="Last_Donation" class="form-control" value="<?php echo $Last_Donation; ?>">
                <span class="help-block"><?php echo $Last_Donation_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($UserType_err)) ? 'has-error' : ''; ?>">
                 <label for="UserType">Choose UserType:</label>
                 <select id="UserType" name="UserType">
                 <option value="ACCEPTOR">ACCEPTOR</option>
                 <option value="DONOR">DONOR</option>
                 </select><br><br>                                      
                <span class="help-block"><?php echo $UserType_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Preferred_Date_err)) ? 'has-error' : ''; ?>">
            <label>
                 Preferred Date:
                 <input type="date" name="Preferred_Date" 
                  placeholder="yyyy-mm-dd" >
                 <span class="validity"></span>
            </label>
                
            </div>  

            <div class="form-group <?php echo (!empty($Blood_Type_err)) ? 'has-error' : ''; ?>">
            <label for="Blood_Type">Choose Blood Type:</label>
                 <select id="Blood_Type" name="Blood_Type">
                 <option value="AB+">AB+</option>
                 <option value="AB-">AB-</option>
                 <option value="A+">A+</option>
                 <option value="A-">A-</option>
                 <option value="B+">B+</option>
                 <option value="B-">B-</option>
                 <option value="O+">O+</option>
                 <option value="O-">O-</option>
                 </select><br><br>    
                <span class="help-block"><?php echo $Blood_Type_err; ?></span>
            </div>  

            <div class="form-group <?php echo (!empty($Health_Problem_err)) ? 'has-error' : ''; ?>">
                <label>Health Problem</label>
                <input type="text" name="Health_Problem" class="form-control" value="<?php echo $Health_Problem; ?>">
                <span class="help-block"><?php echo $Health_Problem_err; ?></span>
            </div>  

            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
            <p>Already have an account? <a href="login.php">Login here</a>.</p>
        </form>
    </div>    
</body>
</html>