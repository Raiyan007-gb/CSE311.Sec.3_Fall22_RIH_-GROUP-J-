<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM register_user_info WHERE User_ID =($_SESSION[User_ID])";
    $get_data = mysqli_query($link,$sql);  
?>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="refresh" content="10;url=welcome.php" />
     <title>
          <head> USER Info </head>
     </title>
    </head>
 <body>
      <div>
            <table align="center" border="1px" style = "width:1000px; line-height:40px:">
            <tr>
               <th colspan="11">See <?php echo htmlspecialchars($_SESSION["username"]); ?>'s Info</h></th>
            </tr>
            <t>
            <th> ID </th>
            <th> Name</th>
            <th> Blood Type</th>
            <th> Age</th>
            <th> Location</th>
            <th> Phone</th>
            <th> E-mail</th>
            <th> Last Donation</th>
            <th> UserType</th>
            <th> Preferred Date</th>
            <th> Health Problems</th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['User_ID'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['Blood_Type'].'</td>
                    <td> '.$row['Age'].'</td>
                    <td> '.$row['Location'].'</td>
                    <td> '.$row['Phone'].'</td>
                    <td> '.$row['E_mail'].'</td>
                    <td> '.$row['Last_Donation'].'</td>
                    <td> '.$row['UserType'].'</td>
                    <td> '.$row['Preferred_Date'].'</td>
                    <td> '.$row['Health_Problem'].'</td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>

    