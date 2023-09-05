<?php

# Creates the SQL database if it has not been created already
function createDatabase() {
    $link = mysqli_connect('localhost', 'root', '');

    $db_selected = mysqli_select_db($link, 'universitydb');

    if (!$db_selected) {
        $sql = 'CREATE DATABASE universitydb';

        if (mysqli_query($link, $sql))
        {
            echo "Database created successfully";
        }
        else
        {
            echo "Error creating database: " . mysqli_error($link);
        }

        $db = new PDO('mysql:host=localhost;dbname=universitydb', 'root', '');
        $sql = file_get_contents('universitydb.sql');
        $query = $db->exec($sql);
    }
}

# Checks if a professor's SSN already exists in database
function ssnExists($conn, $ssn) {
    $sql = "SELECT * FROM professors WHERE ssn = ?;";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: professor-signup.php?error=stmtfailed");
        exit();
    }

    /**
     * mysqli_stmt_bind_param checks if the ssn variable provided will succeed
     * or fail based on the sql statement in the $sql variable above
     */
    mysqli_stmt_bind_param($stmt, "s", $ssn);
    mysqli_stmt_execute($stmt);

    $resultData = mysqli_stmt_get_result($stmt);

    if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
    }
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

# Checks if login field was left blank
function emptyLogin($value) {
    $result;
    if (empty($value)) {
        $result = true;
    }
    else {
        $result = false;
    }

    return $result;
}

# Logs in a professor to view their class meetings
function loginProfessor($conn, $ssn) {

    # Checks if the professor's SSN exists in the database
    $ssnExists = ssnExists($conn, $ssn);

    if ($ssnExists == false) {
        header("location: professor-login.php?error=invalidLogin");
        exit();
    }
    
    # If the professor's SSN exists, log in the professor and begin a session
    session_start();
    $_SESSION["ssn"] = $ssn;
    header("location: professor-class-meetings.php");
    exit();
}

# Checks if a student's CWID exists in the database
function cwidExists($conn, $cwid) {
    $sql = "SELECT * FROM students WHERE cwid = ?;";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: student-login.php?error=stmtfailed");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $cwid);
    mysqli_stmt_execute($stmt);

    $resultData = mysqli_stmt_get_result($stmt);

    if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
    }
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

# Logs in a student to view their courses and grades
function loginStudent($conn, $cwid) {

    # Checks if the student's CWID exists in the database
    $cwidExists = cwidExists($conn, $cwid);

    if ($cwidExists == false) {
        header("location: student-login.php?error=invalidLogin");
        exit();
    }
    
    # If the student's CWID exists, log in the student and begin a session
    session_start();
    $_SESSION["cwid"] = $cwid;
    header("location: student-classes.php");
    exit();
}

# Gets the data of all class sections based on the professor SSN provided
function getSectionsData($conn, $ssn) {
    $sql = "SELECT * from sections WHERE profSsn = $ssn";
    $query = mysqli_query($conn, $sql);
    $sectionsData = array();

    /** 
     * mysqli_fetch_assoc creates an associative array (an array where keys
     * are named) for each row in the query; each element of sectionsData
     * is then assigned an associaive array
     */
    while ($row = mysqli_fetch_assoc($query)) {
        $sectionsData[] = $row;
    }

    return $sectionsData;
}

# Gets the enrollment data of a student based on CWID provided
function getEnrollmentData($conn, $cwid) {
    $sql = "SELECT * FROM enrollments WHERE cwid = $cwid";
    $query = mysqli_query($conn, $sql);
    $enrollmentData = array();

    /** 
     * mysqli_fetch_assoc creates an associative array (an array where keys
     * are named) for each row in the query; each element of enrollmentData
     * is then assigned an associaive array
     */
    while ($row = mysqli_fetch_assoc($query)) {
        $enrollmentData[] = $row;
    }

    return $enrollmentData;
}

# Gets the course names based on course numbers from data rows provided
function getCourseNames($conn, $data) 
{
    $cNumbers = array();
    $courseNames = array();

    /** 
      * Goes through each section in sectionsData and stores their cNumber values 
      * in the cNumbers array
      */
    for($i = 0; $i < sizeof($data); $i++) {
        $cNumbers[$i] = $data[$i]['cNumber'];
    }

    /**
     * Selects the title column, which is the name of a course, from the courses
     * table in the database, based on a matching cNumber in the cNumbers array
     */
    for($i = 0; $i < sizeof($cNumbers); $i++)
    {
        $sql = "SELECT title FROM courses WHERE cNumber = $cNumbers[$i]";
        $query = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_assoc($query))
        {
            $courseNames[] = $row;
        }
    }

    return $courseNames;
}