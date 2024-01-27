<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.text.SimpleDateFormat"  %>
<html>
<head>
    <title>Transaction History</title>
<style>
 body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
</style>
</head>
<body>

<%
    try {
        // Establish the database connection
        String JDBC_URL = "jdbc:mysql://localhost:3306/project";
        String JDBC_USER = "root";
        String JDBC_PASSWORD = "rishavraj";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

        // Specify the account number you want to retrieve transactions for
        String accountNumberToRetrieve = (String) session.getAttribute("accountno");;

        // Retrieve transaction history data for a specific account number
        String sql = "SELECT * FROM transaction_history WHERE accountno = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, accountNumberToRetrieve);
            try (ResultSet resultSet = statement.executeQuery()) {

                // Display the transaction history table
%>
                <h2>Transaction History for Account Number: <%= accountNumberToRetrieve %></h2>
                <table border="1">
                    <tr>
                        <th>Transaction Type</th>
                        <th>Amount (in Rs.)</th>
                        <th>Transaction Date</th>
                    </tr>
<%
                while (resultSet.next()) {
                    String transactionType = resultSet.getString("transaction_type");
                    double amount = resultSet.getDouble("amount");
                    Timestamp transactionDate = resultSet.getTimestamp("transaction_date");
                    
                 // Format the timestamp as a string
                    String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(transactionDate);
%>
                    <tr>
                        <td><%= transactionType %></td>
                        <td><%= amount %></td>
                        <td><%= formattedDate %></td>
                    </tr>
<%
                }
%>
                </table>
<%
            }
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>