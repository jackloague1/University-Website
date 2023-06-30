<?php
    require_once 'connect.php';
    include_once 'header.php';
    include_once 'functions.php';
    
    $cwid = $_SESSION['cwid'];

    $enrollmentData = getEnrollmentData($conn, $cwid);
    $courseNames = getCourseNames($conn, $enrollmentData);
?>

<!DOCTYPE html>
<html lang="en">

    <h2>Student Courses and Grades</h2>
    <table>
        <tr>
            <th>Sec #</th>
            <th>Course Number</th>
            <th>Course Name</th>
            <th>Grade</th>
        </tr>
        <?php
            for ($i = 0; $i < sizeof($enrollmentData); $i++)
            {
                echo '<tr>';
                    echo '<td>'.$enrollmentData[$i]['sNumber'].'</td>';
                    echo '<td>'.$enrollmentData[$i]['cNumber'].'</td>';
                    echo '<td>'.$courseNames[$i]['title'].'</td>';
                    echo '<td>'.$enrollmentData[$i]['grade'].'</td>';
                echo '</tr>';
            }
        ?>
</html>