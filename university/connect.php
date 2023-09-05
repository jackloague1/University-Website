<?php

$conn = mysqli_connect('localhost', 'root', '', 'universitydb');

if(!$conn) {
    die("Connection failed: " .mysqli_connect_error());
}