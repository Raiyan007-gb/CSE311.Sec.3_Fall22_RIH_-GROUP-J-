<?php
// Initialize the session
session_start();
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: welcome.php");
    exit;
}
    require "connection.php";   
    $Blood_Type= 'B+';
    $sql = "SELECT * FROM donor_information_table WHERE Blood_Type = '$Blood_Type' ";
    $get_data = mysqli_query($link,$sql);  
    mysqli_close($link);

?>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="refresh" content="100;url=welcome.php" />
     <title>
          <head> USER Info </head>
     </title>
    </head>
 <body>
      <div>
            <table align="center" border="1px" style = "width:1000px; line-height:40px:">
            <tr>
               <th colspan="11"><?php echo htmlspecialchars($Blood_Type); ?> Owners</h></th>
            </tr>
            <t>
            <th> Blood Type</th>
            <th> User ID</th>
            <th> Name </th>
            <th> Age </th>
            <th> Last Donation</th>
            <th> Location</th>
            <th> UserType</th>
            <th> E-mail </th>
            <th> Phone</th>
            <th> Health Problem</th>
            </t>
            <?php 
                   while($row = mysqli_fetch_assoc($get_data)){
                    echo '<tr>
                    <td> '.$row['Blood_Type'].'</td>
                    <td> '.$row['User_ID'].'</td>
                    <td> '.$row['Name'].'</td>
                    <td> '.$row['Age'].'</td>
                    <td> '.$row['Last_Donation'].'</td>
                    <td> '.$row['Location'].'</td>
                    <td> '.$row['UserType'].'</td>
                    <td> '.$row['E_mail'].'</td>
                    <td> '.$row['Phone'].'</td>
                    <td> '.$row['Health_Problem'].'</td>
                    </tr>';
                  }
            ?>
            </table> 
      </div>
 </body>
</html>
