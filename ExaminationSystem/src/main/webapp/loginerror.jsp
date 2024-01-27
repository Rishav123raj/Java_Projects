<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Error</title>
<style>
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
    text-align: center;
}

h2 {
    color: #ff6347;
    font-size: 2em;
    margin-top: 50px;
    animation: glow 1s infinite alternate;
}

a {
    display: block;
    text-decoration: none;
    color: #4169e1;
    font-size: 1.2em;
    margin-top: 20px;
    transition: color 0.3s;
}

a:hover {
    color: #ff6347;
}

@keyframes glow {
    from {
        text-shadow: 0 0 10px #ff6347, 0 0 20px #ff6347, 0 0 30px #ff6347;
    }
    to {
        text-shadow: 0 0 20px #ff6347, 0 0 30px #ff6347, 0 0 40px #ff6347;
    }
}
</style>
</head>
<body>
<h2>You entered the wrong Username or password.</h2>
<a href="login.jsp">Please Try Again</a>
</body>
</html>