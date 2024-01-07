<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Random Number Game</title>
<style>
body {
    background-color: #282c34;
    color: #61dafb;
    font-family: 'Arial', sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
}

h1, h2 {
    color: #61dafb;
}

form {
    margin-top: 20px;
}

input[type="number"] {
    padding: 5px;
    font-size: 16px;
}

input[type="submit"] {
    padding: 10px 20px;
    font-size: 18px;
    background-color: #61dafb;
    color: #282c34;
    cursor: pointer;
    border: none;
}

input[type="submit"]:hover {
    background-color: #4fa3d1;
}

/* Add animation for a more game-like feel */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

h1, h2, form {
    animation: fadeIn 1s ease-out;
}
</style>
</head>
<body>
 <%
 int randomNumber = ((int)((Math.random()*100)+1));
session.setAttribute("randomNumber", randomNumber);
%>
<h1>You have to select a number between 1 and 100.</h1><br/>
<h2>Guess the number in 10 tries.</h2>
<form action="guessNumber.jsp" method="post">
<h2>Enter your first guess: <br/><br/><input type="number" name="userGuess"/></h2>
<input type="submit" value="Submit Guess"/>
<input type="hidden" name="numGuess" value="1"/>
</form>
</body>
</html>