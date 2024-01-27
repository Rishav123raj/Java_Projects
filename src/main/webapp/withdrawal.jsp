<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdrawal</title>
<style>
 body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        text-align: center;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    h2 {
        color: #007bff;
    }

    form {
        max-width: 400px;
        margin: 20px;
        padding: 40px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    input[type="text"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 1px solid #ced4da;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: #ffffff;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
<form action="<%= request.getContextPath() %>/WithdrawControl" method="post">
<h2>Withdraw Money</h2>
        Account Number<input type="text" name="accountno" value="<%= session.getAttribute("accountno") %>" required readonly><br>
        Amount: <input type="text" name="amount" required><br>
        <input type="submit" value="Withdraw">
    </form>
</body>
</html>