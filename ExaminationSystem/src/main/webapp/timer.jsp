<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>30-Minute Timer</title>
    <script>
        var countdown;
        
        function startTimer() {
            var seconds = 1800; // Set the initial countdown time to 30 minutes (1800 seconds)
            countdown = setInterval(function() {
                var minutes = Math.floor(seconds / 60);
                var remainingSeconds = seconds % 60;
                document.getElementById("timer").innerHTML = minutes + " minutes " + remainingSeconds + " seconds remaining"; 
                if (seconds <= 0) {
                    clearInterval(countdown);
                    document.getElementById("timer").innerHTML = "Time's up!";
                } else {
                    seconds--;
                }
            }, 1000); // Update the timer every 1000 milliseconds (1 second)
        }
    </script>
</head>
<body>
    <h1>30-Minute Timer</h1>
    <button onclick="startTimer()">Start Your Exam</button>
    <p id="timer"></p>
</body>
</html>