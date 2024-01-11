<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm Submission</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
    text-align: center;
}

input[type="button"] {
    background-color: #4caf50;
    color: #fff;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 4px;
}

input[type="button"]:hover {
    background-color: #45a049;
}

.alert {
    background-color: #f44336;
    color: #fff;
    padding: 15px;
    margin-top: 20px;
    border-radius: 4px;
}
</style>
<body>
<script>
        function confirmSubmission() {
            var confirmation = confirm("Confirm Exam Submission");
            if (confirmation) {
                document.getElementById("confirmation").submit();
            } else {
                // Display an alert message
                alert("Exam submission canceled");
            }
        }
    </script>
</head>
<body>
 <form id="confirmation" action="submit.jsp" method="post">
        <input type="button" value="Submit Exam" onclick="confirmSubmission()">
    </form>
</body>
</html>