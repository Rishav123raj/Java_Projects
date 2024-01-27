<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color:  #33CCFF;
            background-image:url('back.jpg');
            color: #ECF0F1; /* Light gray text color */
        }

        .login-container {
            background-color: #2C3E50; /* Darker color for the container */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            text-align: left;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #95A5A6; /* Light gray border color */
            border-radius: 6px;
            margin-bottom: 15px;
        }

        button {
            padding: 10px;
            background-color: #3498DB; /* Blue button color */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
        background-color: #2980B9; /* Darker blue on hover */
         }
    </style>
</head>
<body>
<div class="login-container">
        <h2>ATM Management System</h2>
        <form id="loginForm" action="<%= request.getContextPath() %>/HomeController?action=login" method="post">
        <label for="number">Card Holder's Account Number</label>
            <input type="number" id="accountno" name="accountno" required><br/><br/>
            <label for="text">Card Holder's Name</label>
            <input type="text" id="username" name="username" required><br/></br/>
            <label for="password">ATM Pin</label>
            <input type="password" id="password" name="password" required><br/><br/>
            <input type="hidden" value="authenticate"></input>
             <input type="hidden" name="redirectToDeposit" value="true">
             <input type="submit" value="Login"></input>
        </form>
    </div>

</body>
</html>