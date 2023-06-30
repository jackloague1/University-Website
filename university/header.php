<?php
    session_start();
?>

<DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" type="text/css" href="styles.css"></link>
    <nav>
        <div class="wrapper">
            <ul>
                <?php
                    if (isset($_SESSION["ssn"])) {
                        echo "<li><a href='professor-class-meetings.php'>Class Meetings</a></li>";
                        echo "<li><a href='professor-logout-connect.php'>Log Out</a></li>";
                    }
                    else if (isset($_SESSION["cwid"])) {
                        echo "<li><a href='student-classes.php'>Courses and Grades</a></li>";
                        echo "<li><a href='student-logout-connect.php'>Log Out</a></li>";
                    }
                    else {
                        echo"<li><a href='index.php'>Home</a></li>";
                        echo "<li><a href='professor-login.php'>Professor Login</a></li>";
                        echo "<li><a href='student-login.php'>Student Login</a></li>";

                    }
                ?>
            </ul>
        </div>
    </nav>
</html>