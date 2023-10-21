<?php

require_once('db.php');

if(!$db){
    echo 'conection failed';
}

$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];

$sql = "SELECT email FROM usuarios WHERE email = '".$email."'";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);
if($count == 1){
    echo json_encode('Error');
}else{
    $insert = "INSERT INTO usuarios(name, email, phone, password) VALUES ('".$name."', '".$email."',
    '".$phone."', md5('".$password."'))";
    $query = mysqli_query($db, $insert);
    if($query){
        echo json_encode("Success");
    }
}
?>