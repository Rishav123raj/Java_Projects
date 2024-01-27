<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
<style>
    body {
      font-family: Arial, sans-serif;
      background-image:url('exam.jpg');
      text-align: center;
    }

    .login-container {
      max-width: 400px;
      margin: 100px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .login-container h2 {
      color: #333;
    }

    .login-form {
      margin-top: 20px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }

    .form-group input {
      width: 100%;
      padding: 8px;
      box-sizing: border-box;
    }

    .form-group button {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .form-group button:hover {
      background-color: #45a049;
    }
    
    a{
           float: left; 
            margin-right: 20px; 
}

    button{
           float: right; 
            margin-right: 20px; 
}
  </style>
</head>
<body>
<div class="login-container">
    <h2>Exam System Login</h2>
    <form class="login-form" action="<%= request.getContextPath() %>/ExamController" method="post">
    <input type="hidden" name="action" value="login">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form-group">
      <br/>
      <a href='changePassword.jsp'>Forgot Password ?</a>
      <br/><br/>
      <input type="submit" value="Start Exam"></input>
      </div>
    </form>
  </div>
</body>
</html>