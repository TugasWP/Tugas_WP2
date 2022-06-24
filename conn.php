<?php

$sever = "localhost";
$user = "root";
$pass = "hellowq";
$db = "wpa_inventory";

$conn = new mysqli($sever,$user,$pass,$db);

// if($conn->connect_error){
//     echo "Koneksi gagal ".$conn->connect_error;
// }else{
//     echo "koneksi berhasil";
// }