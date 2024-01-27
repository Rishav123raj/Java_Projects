<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.management.deposit.BankAccountDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Balance Enquiry</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

form {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #fff;
    padding: 10px 15px;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

/* Optional: Style for readonly input */
input[readonly] {
    background-color: #eee;
    cursor: not-allowed;
}
</style>
</head>
<body>
<form action="<%= request.getContextPath() %>/BalanceCheck" method="post">
        Enter Account Number: <input type="text" name="accountno" value="<%= session.getAttribute("accountno") %>" required readonly><br>
        <input type="submit" value="Check Balance">
    </form>
</body>
