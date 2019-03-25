<?php

mysql_connect("127.0.0.1","root","");
mysql_select_db("usernameavailable");

$echeck="select email from usuario where email=".$_POST['email'];
   $echk=mysql_query($echeck);
   $ecount=mysql_num_rows($echk);
  if($ecount!=0)
   {
      echo "Email already exists";
   } else {
       echo "Email available.";
   }

?>