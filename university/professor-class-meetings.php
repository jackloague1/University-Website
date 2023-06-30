<?php
    require_once 'connect.php';
    include_once 'header.php';
    include_once 'functions.php';
    
    $ssn = $_SESSION['ssn'];

    $sectionsData = getSectionsData($conn, $ssn);
    $courseNames = getCourseNames($conn, $sectionsData);
?>

<!DOCTYPE html>
<html lang="en">

    <h2>Class Meetings</h2>
    <table>
        <tr>
            <th>Sec #</th>
            <th>Course Name</th>
            <th>Classroom</th>
            <th>Meeting Days</th>
            <th>Start Time</th>
            <th>End Time</th>
        </tr>
        <?php
            for ($i = 0; $i < sizeof($sectionsData); $i++)
            {
                echo '<tr>';
                    echo '<td>'.$sectionsData[$i]['sNumber'].'</td>';
                    echo '<td>'.$courseNames[$i]['title'].'</td>';
                    echo '<td>'.$sectionsData[$i]['classroom'].'</td>';
                    echo '<td>'.$sectionsData[$i]['meetingDays'].'</td>';
                    echo '<td>'.$sectionsData[$i]['startTime'].'</td>';
                    echo '<td>'.$sectionsData[$i]['endTime'].'</td>';
                echo '</tr>';
            }
        ?>
    </table>
</html>