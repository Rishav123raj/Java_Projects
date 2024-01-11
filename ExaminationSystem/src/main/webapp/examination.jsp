<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="org.examination.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Examination</title>
<style>
 body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

h1 {
  text-align: center;
  color: #333;
}

.question {
  background-color: #fff;
  border: 1px solid #ccc;
  margin: 20px;
  padding: 15px;
  border-radius: 8px;
}

.options {
  list-style: none;
  padding: 0;
}

.option {
  margin-bottom: 10px;
}

input[type="radio"] {
  margin-right: 5px;
}

button {
  background-color: #4caf50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}

#startButton {
            float: right; /* Float the button to the right */
            margin-right: 20px; /* Add some margin to the right to create spacing */
        }
        
a{
           float: right; 
            margin-right: 20px; 
}

.question-box {
    background-color: #f9f9f9;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

h2.question-title {
    color: #555;
    margin-bottom: 10px;
}

p.question-text {
    color: #777;
    margin-bottom: 10px;
}
</style>
</head>
<body>
<h1>MCQ Examination</h1>
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
                    autoSubmitForm();
                } else {
                    seconds--;
                }
            }, 1000); // Update the timer every 1000 milliseconds (1 second)
        }
        
        function autoSubmitForm() {
            clearInterval(countdown); // Stop the countdown (optional, but prevents further decrementing)
            document.getElementById("enter").submit(); // Submit the form
          }
        
        window.onload = function () {
            startTimer();
        }; 
    </script>
</head>
<body>
<div>
        <% 
            // Retrieve the username from the session
            String username = (String) session.getAttribute("username");
            if (username != null) {
        %>
            <h2>Welcome, <%= username %>!</h2>
        <%
            } else {
        %>
            <p>Invalid session. Please login again.</p>
        <%
            }
        %>
    </div>
    <p id="timer"></p>
    <br/><br/>
    <form id="enter" action="submit.jsp" method="post">
    <div class="question-box">
    <h2 class="question-title">Question 1</h2>
        <p>If CAT is coded as 312, how is DOG coded?</p>
      <input type="radio" name="q2" value="a"> 416
      <input type="radio" name="q2" value="b"> 514
      <input type="radio" name="q2" value="c"> 415
      <input type="radio" name="q2" value="d"> 513
    </div>
    <div class="question-box">
    <h2 class="question-title">Question 2</h2>
       <p>What is the next number in the series: 2, 6, 12, 20, ?</p>
      <input type="radio" name="q1" value="a"> 30
      <input type="radio" name="q1" value="b"> 24
      <input type="radio" name="q1" value="c"> 28
      <input type="radio" name="q1" value="d"> 36
    </div>
    <div class="question-box">
    <h2 class="question-title">Question 3</h2>
         <p>What comes next in the pattern: 3, 6, 12, 24, ?</p>
      <input type="radio" name="q3" value="a"> 36
      <input type="radio" name="q3" value="b"> 48
      <input type="radio" name="q3" value="c"> 30
      <input type="radio" name="q3" value="d"> 42
    </div>
    <div class="question-box">
    <h2 class="question-title">Question 4</h2>
         <p>If FRIEND is coded as 7236514, how is TEACHER coded?</p>
      <input type="radio" name="q4" value="a"> 20513818
      <input type="radio" name="q4" value="b"> 20531818
      <input type="radio" name="q4" value="c"> 20531881
      <input type="radio" name="q4" value="d"> 20513881
      </div>
    <div class="question-box">
    <h2 class="question-title">Question 5</h2>  
         <p>What is the missing number in the series: 2, 5, 10, 17, ?</p>
      <input type="radio" name="q5" value="a"> 25
      <input type="radio" name="q5" value="b"> 24
      <input type="radio" name="q5" value="c"> 18
      <input type="radio" name="q5" value="d"> 26  
    </form>
  <a href='confirm.jsp'>Submit Answers</a>
</body>
</html>