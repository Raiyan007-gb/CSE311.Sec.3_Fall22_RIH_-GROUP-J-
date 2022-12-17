<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM blood_bank_pass_reset_request";
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
            <th> Name</th>
            <th> Security Code</th>
            <th> E-Mail</th>
            <th> Contact Number</th>
            <th> Location</th>
            <th> Storage Capacity</th>
            <th> VERIFICATION</th>
            <th> DELETE REQUEST? </th>
            <th> RECOVER PASSWORD </th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['user_id'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['Security_code'].'</td>
                    <td> '.$row['Email'].'</td>
                    <td> '.$row['Contact'].'</td>
                    <td> '.$row['Location'].'</td>
                    <td> '.$row['Storage_capacity'].'</td>
                    <td> '.$row['Verification'].'</td>
                    <td> FOR ID <a href="delete_pass_req_table_from_admin_for_bb.php?id='.urlencode($row['user_id']).'" target="_blank">'.$row['user_id'].'</a> </td>
                    <td> FOR ID <a href="reset_pass_from_admin_to_blood_bank.php?id='.urlencode($row['user_id']).'">'.$row['user_id'].'</a> </td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>