<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Guess It</title>
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
if (session.getAttribute("rounds") == null) {
    session.setAttribute("rounds", 1);
    session.setAttribute("score", 0);
}

String randomNumber = Integer.toString((int)session.getAttribute("randomNumber"));
int randNumber = Integer.parseInt(randomNumber);
int userGuess=0;
int numGuess=1;
int limitAttempt=10;
boolean isCorrect=false;
boolean isCorrectTwo=false;
            
try {
                userGuess=Byte.parseByte(request.getParameter("userGuess"));;
                numGuess=Byte.parseByte(request.getParameter("numGuess"));;
                isCorrectTwo=true;
 }
catch (NumberFormatException e) {
out.println("<h1>Please enter a number between 1 and 100.</h1>");
out.println("<a href=\"index.jsp\">Start Over?</a>\n");
}

if ((isCorrectTwo==true)&&(userGuess>100||userGuess<1)) {
out.println("<h1>Please enter a number between 1 and 100</h1>");
out.println("<a href=\"index.jsp\">Start Over?</a>\n");
}

if ((userGuess>=1)&&(userGuess<=100)) {
if (userGuess<randNumber) {
out.println("<h1>You've guessed too low. Try again.</h1>");
numGuess++;
if(numGuess>limitAttempt){
	isCorrect=true;
	out.println("<h1>You have reached the limit.Please try again</h1>");
	out.println("<a href=\"index.jsp\">Play Again?</a>\n");		
}
}
else if (userGuess>randNumber) {
out.println("<h1>You've guessed too high. Try again.</h1>");
numGuess++;
if(numGuess>limitAttempt){
	isCorrect=true;
	out.println("<h1>You have reached the limit.Please try again</h1>");
	out.println("<a href=\"index.jsp\">Play Again?</a>\n");		
}
}
else {
isCorrect=true;
out.println("<h1>You guessed the number " + randNumber + "</h1><h2> and it took you only " + numGuess + " tries!</h2>");
out.println("<a href=\"index.jsp\">Play Again?</a>\n");

int maxScore=100;
int score=maxScore/numGuess;
session.setAttribute("score", (int) session.getAttribute("score") + score);
session.setAttribute("rounds", (int) session.getAttribute("rounds") + 1);
}
if (!isCorrect) {
out.println("<form method=\"post\" action=\"guessNumber.jsp\">\n<h2>Enter guess number " + numGuess + 
                        ": </h2>\n<br/>\n<input type=\"number\" name=\"userGuess\">\n<br/><br/>\n<input type=\"submit\" value=\"Submit Guess\"/)>\n");
out.println("<input type=\"hidden\" name=\"numGuess\" value=\"" + numGuess + "\"/>");
out.println("</form>");
}
}
%>
<div>
    <h2>Round: <%= session.getAttribute("rounds") %></h2>
    <h2>Total Score: <%= session.getAttribute("score") %></h2>
</div>
</body>
</html>