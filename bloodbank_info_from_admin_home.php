<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM blood_bank_info";
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
            <th> Security_code</th>
            <th> Contact</th>
            <th> E-mail</th>
            <th> Location</th>
            <th> Storage_capacity</th>
            <th> Facilities</th>
            <th> Verification</th>
            <th> DELETE BLOOD BANK ACCOUNT?</th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['user_id'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['Security_code'].'</td>
                    <td> '.$row['Contact'].'</td>
                    <td> '.$row['Email'].'</td>
                    <td> '.$row['Location'].'</td>
                    <td> '.$row['Storage_capacity'].'</td>
                    <td> '.$row['facilities'].'</td>
                    <td> '.$row['Verification'].'</td>
                    <td> FOR ID <a href="delete_bb_data_frm_admin.php?id='.urlencode($row['user_id']).'" target="_blank">'.$row['user_id'].'</a> </td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>