<?php
require 'connection.php';
$Name = $_POST['Name'];
$E_mail = $_POST['E_Mail'];
$user_id = $_GET['User_ID'];

$sql = "UPDATE register_user_info SET Name ='$Name',E_Mail='$E_mail' WHERE User_ID = '$user_id'";
$update = mysqli_query($link,$sql);
if($update){
    header('Location: '.'welcome.php');
}else{
    echo 'try again';
}
?>

