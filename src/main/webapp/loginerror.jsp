<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Error</title>
<style>
body {
  background-color: #1a1a1a;
  color: #fff;
  font-family: 'Arial', sans-serif;
  text-align: center;
  padding: 50px;
  margin: 0;
}

h2 {
  color: #ff4500; /* Orange-Red */
}

a {
  display: inline-block;
  padding: 10px 20px;
  margin-top: 20px;
  background-color: #4caf50; /* Green */
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

a:hover {
  background-color: #45a049; /* Darker Green on hover */
}
</style>
</head>
<body>
<h2>You entered the wrong Username or password.</h2>
<br/><br/>
<a href="login.jsp">Please Try Again</a>
</body>
</html>