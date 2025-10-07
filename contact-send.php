<?php
require_once "./includes/core/helper.php";
require_once "./includes/core/db.php";

$keys = [
    'name',
    'email',
    'phone',
    'message',
    'datenschutz'
];

$givenKeys = array_keys($_POST);
if(count(array_diff($keys, $givenKeys)) !== 0){
    http_response_code(400);
   echo 0;
    exit;
}


$db = DB::getInstance();
$sql = "INSERT INTO `contact` (`name`, `email`, `telefon`, `Nachricht`) VALUES ( :name, :email, :phone, :message)";

$params = [
    ':name' => $_POST['name'],
    ':email' => $_POST['email'],
    ':phone' => $_POST['phone'],
    ':message' => $_POST['message'],
];


    $insert = $db->execute($sql, $params);

    if($insert === 1) {
        http_response_code(200);
        echo 1;
    } else {
        http_response_code(500);
        echo 0;
    }
return;

