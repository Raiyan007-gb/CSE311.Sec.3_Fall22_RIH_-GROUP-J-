<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM register_user_info";
    $get_data = mysqli_query($link,$sql);  
?>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="refresh" content="1000;url=welcome_admin.php" />
     <title>
            PUBLIC ACCOUNT INFORMATION
     </title>
    </head>
 <body>
      <div>
            <table align="center" border="1px" style = "width:1000px; line-height:40px:">
            <tr>
               <th colspan="11">PUBLIC ACCOUNT INFORMATION</h></th>
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
            <th> DELETE ACCOUNT USER ACCOUNT</th>
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
                    <td> FOR ID <a href="delete_us_data_from_admin.php?id='.urlencode($row['User_ID']).'" target="_blank">'.$row['User_ID'].'</a> </td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>