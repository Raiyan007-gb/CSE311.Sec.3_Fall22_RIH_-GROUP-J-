<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: admin_login.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM admin_own_info WHERE Admin_ID =($_SESSION[Admin_ID])";
    $get_data = mysqli_query($link,$sql);  
?>

<!DOCTYPE html>
<html>
     <title>
          <head> USER Info </head>
     </title>
 <body>
      <div>
            <table align="center" border="4px" style = "width:300px; line-height:40px:">
            <tr>
               <th colspan="11">See Owner Info</h></th>
            </tr>
            <t>
            <th> ID </th>
            <th> Name</th>
            <th> Phone</th>
            <th> E-mail</th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['Admin_ID'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['Contact_info'].'</td>
                    <td> '.$row['E_Mail'].'</td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>