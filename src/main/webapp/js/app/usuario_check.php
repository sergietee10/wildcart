<?php
if(isset($_POST['login']))
{
    // include Database connection file 
    include("db_connection.php");
 
    $username = mysqli_real_escape_string($con, $_POST['login']);
 
    $query = "SELECT login FROM  usuario WHERE login = '$login'";
    if(!$result = mysqli_query($con, $query))
    {
        exit(mysqli_error($con));
    }
 
    if(mysqli_num_rows($result) > 0)
    {
        // username is already exist 
        echo '<div style="color: red;"> <b>'.$login.'</b> ¡Este usuario ya esta en uso! </div>';
    }
    else
    {
        // username is avaialable to use.
        echo '<div style="color: green;"> <b>'.$login.'</b> ¡Nombre de usuario disponible! </div>';
    }
}
?>