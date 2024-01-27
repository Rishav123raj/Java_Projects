package org.management.transfer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TransferControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "rishavraj";

    public TransferControl() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String fromAccount=request.getParameter("accountno");
		String toAccount=request.getParameter("toAccount");
		double amount=Double.parseDouble(request.getParameter("amount"));
		
		String transferResult=null;
		 try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
	            // Check if accounts exist
	            if (!accountExists(connection, fromAccount) || !accountExists(connection, toAccount)) {
	                response.getWriter().println("Invalid accounts");
	                return;
	            }

	            // Check if there's enough balance in the source account
	            if (!hasSufficientFunds(connection, fromAccount, amount)) {
	                response.getWriter().println("Insufficient funds");
	                return;
	            }

	            // Perform the transfer
	            transferResult=performTransfer(connection, fromAccount, toAccount, amount);
	            
	            PrintWriter out = response.getWriter();
	            out.println("<html><head>");
	            out.println("<style>");
	            out.println("body { font-family: 'Arial', sans-serif; background-color: #f0f0f0; margin: 0; padding: 0; text-align: center; }");
	            out.println("h2 { color: #333; }");
	            out.println("p { color: green; }");
	            out.println("</style>");
	            out.println("</head><body>");
	            out.println("<h2>Transfer Result:</h2>");
	            out.println("<p>" + transferResult + "</p>");
	            out.println("</body></html>");
		        
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.getWriter().println("Database error: " + e.getMessage());
	        }
	    }
	    private boolean accountExists(Connection connection, String accountNumber) throws SQLException {
	        String sql = "SELECT COUNT(*) FROM accounts WHERE accountno = ?";
	        try (PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, accountNumber);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                resultSet.next();
	                return resultSet.getInt(1) > 0;
	            }
	        }
	    }

	    private boolean hasSufficientFunds(Connection connection, String accountNumber, double amount) throws SQLException {
	        String sql = "SELECT balance FROM accounts WHERE accountno = ?";
	        try (PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, accountNumber);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                if (resultSet.next()) {
	                    double balance = resultSet.getDouble("balance");
	                    return balance >= amount;
	                }
	                return false; // Account not found
	            }
	        }
	    }
	    
	    
	    private String performTransfer(Connection connection, String fromAccount, String toAccount, double amount)
	            throws SQLException {
	        String debitSql = "UPDATE accounts SET balance = balance - ? WHERE accountno = ?";
	        String creditSql = "UPDATE accounts SET balance = balance + ? WHERE accountno = ?";
	        
	        try (PreparedStatement debitStatement = connection.prepareStatement(debitSql);
	                PreparedStatement creditStatement = connection.prepareStatement(creditSql);
	                PreparedStatement pstmtFrom = connection.prepareStatement(
	                        "INSERT INTO transaction_history (accountno, transaction_type, amount, transaction_date) VALUES (?, 'TransferFrom', ?, ?)");
	                PreparedStatement pstmtTo = connection.prepareStatement(
	                        "INSERT INTO transaction_history (accountno, transaction_type, amount, transaction_date) VALUES (?, 'TransferTo', ?, ?)")) {

	            // Debit from the source account
	            debitStatement.setDouble(1, amount);
	            debitStatement.setString(2, fromAccount);
	            debitStatement.executeUpdate();

	            // Credit to the destination account
	            creditStatement.setDouble(1, amount);
	            creditStatement.setString(2, toAccount);
	            int rowsAffected = creditStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                // Insert into transaction_history for the source account
	                pstmtFrom.setString(1, fromAccount);
	                pstmtFrom.setDouble(2, amount);
	                pstmtFrom.setTimestamp(3, getCurrentTimestamp());
	                pstmtFrom.executeUpdate();

	                // Insert into transaction_history for the destination account
	                pstmtTo.setString(1, toAccount);
	                pstmtTo.setDouble(2, amount);
	                pstmtTo.setTimestamp(3, getCurrentTimestamp());
	                pstmtTo.executeUpdate();
	            	return "Trasnfer of amount "+amount+" from "+fromAccount+" to account "+toAccount+" is successfull";
	            }
	            else {
	            	return "Transfer Unsuccessfull";
	            }
	        }
	    }

		private Timestamp getCurrentTimestamp() {
			 java.util.Date today = new java.util.Date();
		        return new Timestamp(today.getTime());
		}
}
