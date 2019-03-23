<?php
if(isset($_POST['email']))
{
    // include Database connection file 
    include("db_connection.php");
 
    $username = mysqli_real_escape_string($con, $_POST['email']);
 
    $query = "SELECT usuario FROM  usuario WHERE email = '$email'";
    if(!$result = mysqli_query($con, $query))
    {
        exit(mysqli_error($con));
    }
 
    if(mysqli_num_rows($result) > 0)
    {
        // username is already exist 
        echo '<div style="color: red;"> <b>'.$email.'</b> ¡Direccion de correo no disponible! </div>';
    }
    else
    {
        // username is avaialable to use.
        echo '<div style="color: green;"> <b>'.$email.'</b> ¡Direccion de correo disponible! </div>';
    }
}
?>