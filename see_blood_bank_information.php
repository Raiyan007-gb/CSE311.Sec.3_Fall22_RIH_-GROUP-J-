<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM blood_bank_info WHERE user_id =($_SESSION[user_id])";
    $get_data = mysqli_query($link,$sql);  
?>

<!DOCTYPE html>
<html>
     <title>
          <head> USER Info </head>
     </title>
 <body>
      <div>
            <table align="center" border="1px" style = "width:900px; line-height:40px:">
            <tr>
               <th colspan="10">See Owner Info</h></th>
            </tr>
            <t>
            <th> ID </th>
            <th> Name</th>
            <th> Security Code</th>
            <th> Contact Number </th>
            <th> E-mail</th>
            <th> Location</th>
            <th> Storage Capacity</th>
            <th> Facilities </th>
            <th> Verification </th>
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
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>