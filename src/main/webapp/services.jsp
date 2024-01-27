<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service</title>
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        header {
    background-color:#2ecc71;
    color: #fff;
    text-align: center;
    padding: 20px 0;
}
  
        section {
            background-color: #fff;
            margin: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background-color: #333;
            color: #fff;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        li:hover {
            background-color: #45a049;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #2ecc71;
            color: #fff;
        }
    </style>
</head>
<body>
<section>
        <header><h1>Services</h1></header>
        <p>Welcome to our ATM Management System. Below are the key services we provide:</p>
         <form action="<%= request.getContextPath() %>/HomeController?action=service" method="post">
        <ul>
            <li>ATM Deployment</li>
            <li>ATM Monitoring</li>
            <li>Cash Management</li>
            <li>Transaction Processing</li>
            <li>Fault Detection and Resolution</li>
            <li>Security Features</li>
            <li>Software Updates and Upgrades</li>
            <li>Remote Management</li>
            <li>User Support and Training</li>
            <li>Reporting and Analytics</li>
            <li>Compliance and Regulations</li>
            <li>Customer Service Integration</li>
            <li>Customization and Scalability</li>
        </ul>
      </form>
    </section>

    <footer>
        <p>&copy; 2024 ATM Management System</p>
    </footer>
</body>
</html>