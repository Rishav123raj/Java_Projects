<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Functionalities</title>
<style>
body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #333;
            background-color: #fff;
            padding: 20px;
            margin: 0;
        }

        .image-container {
            display: inline-block;
            margin: 10px; /* Adjust as needed */
        }

        img {
            width: 300px;
            height: 200px;
        }

        h3 {
            color: #333;
        }
     </style>
</head>
<body>
<h1>Welcome <%= session.getAttribute("username") %></h1>
<div class="image-container">
        <a href="deposit.jsp">
            <img src="deposit.png" alt="Deposit Image">
        </a>
        <h3>Deposit</h3>
    </div>
<div class="image-container">
        <a href="withdrawal.jsp">
            <img src="with.png" alt="Wihtdraw Image">
        </a>
        <h3>Withdraw</h3>
    </div>
<div class="image-container">
        <a href="transfer.jsp">
            <img src="transfer.png" alt="Wihtdraw Image">
        </a>
        <h3>Transfer</h3>
    </div>
<div class="image-container">
        <a href="check_balance.jsp">
            <img src="balance.png" alt="Balance Image">
        </a>
        <h3>Check Balance</h3>
        </div>
<div class="image-container">
        <a href="transaction_history.jsp">
            <img src="transaction.png" alt="Transaction Image">
        </a>
        <h3>Transaction</h3>
    </div>
</body>
</html>