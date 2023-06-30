<?php

if (isset($_POST["submit"])) {

    $cwid = $_POST['cwid'];

    require_once 'connect.php';
    require_once 'functions.php';

    if(emptyLogin($cwid) != false) {
        header("location: student-login.php?error=emptyInput");
        exit();
    }

    loginStudent($conn, $cwid);
}
else {
    header("location: student-login.php");
    exit();
}
?>