<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: welcome.php");
    exit;
}
    require "connection.php";
    $sql = "SELECT * FROM blood_request_user";
    $get_data = mysqli_query($link,$sql);  
?>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
     <title>
          <head> BLOOD REQUEST INFO </head>
     </title>
    </head>
 <body>
      <div>
            <table align="center" border="1px" style = "width:1000px; line-height:40px:">
            <tr>
               <th colspan="11"> BLOOD REQUEST INFO </h></th>
            </tr>
            <t>
            <th> BLOOD TYPE</th>
            <th> USER ID</th>
            <th> NAME</th>
            <th> AGE</th>
            <th> LOCATION</th>
            <th> PHONE</th>
            <th> PREFERRED DATE</th>
            <th> PREFERRED TIME</th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['Blood_Type'].'</td>
                    <td> '.$row['User_ID'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['Age'].'</td>
                    <td> '.$row['Location'].'</td>
                    <td> '.$row['Phone'].'</td>
                    <td> '.$row['Preferred_Date'].'</td>
                    <td> '.$row['Time'].'</td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>

    