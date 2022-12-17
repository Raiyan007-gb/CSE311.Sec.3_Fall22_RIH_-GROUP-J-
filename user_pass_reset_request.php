<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM user_pass_reset_request";
    $get_data = mysqli_query($link,$sql);  
?>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="refresh" content="100;url=admin_login.php" />
     <title>
          REQ PASS RE 
     </title>
    </head>
 <body>
      <div>
            <table align="center" border="1px" style = "width:1000px; line-height:40px:">
            <tr>
               <th colspan="11">PASSWORD RECOVERY REQUEST</h></th>
            </tr>
            <t>
            <th> User ID </th>
            <th> Userame</th>
            <th> Name</th>
            <th> E-Mail</th>
            <th> Contact Number</th>
            <th> User Type</th>
            <th> DELETE REQUEST? </th>
            <th> RECOVER PASSWORD </th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['User_ID'].'</td>
                    <td> '.$row['Username'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['E_mail'].'</td>
                    <td> '.$row['Contact'].'</td>
                    <td> '.$row['UserType'].'</td> 
                    <td> FOR ID <a href="delete_pass_req_table_from_admin.php?id='.urlencode($row['User_ID']).'" target="_blank">'.$row['User_ID'].'</a> </td>
                    <td> FOR ID <a href="reset_pass_from_admin_to_user.php?id='.urlencode($row['User_ID']).'">'.$row['User_ID'].'</a> </td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>