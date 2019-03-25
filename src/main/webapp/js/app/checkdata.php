<?php

$host = 'localhost';
$user = 'root';
$pass = 'bitnami';

mysql_connect($host, $user, $pass);

mysql_select_db('wildcart');

if(isset($_POST['login']))
{
 $login=$_POST['login'];

 $checkdata=" SELECT login FROM usuario WHERE login='$login' ";

 $query=mysql_query($checkdata);

 if(mysql_num_rows($query)>0)
 {
  echo "User Name Already Exist";
 }
 else
 {
  echo "OK";
 }
 exit();
}

//if(isset($_POST['user_email']))
//{
// $emailId=$_POST['user_email'];
//
// $checkdata=" SELECT loginid FROM user WHERE loginid='$emailId' ";
//
// $query=mysql_query($checkdata);
//
// if(mysql_num_rows($query)>0)
// {
//  echo "Email Already Exist";
// }
// else
// {
//  echo "OK";
// }
// exit();
//}
?>