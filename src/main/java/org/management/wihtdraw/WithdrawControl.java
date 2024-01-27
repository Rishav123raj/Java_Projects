package org.management.wihtdraw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WithdrawControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "rishavraj";    
    public WithdrawControl() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		 String accountno=request.getParameter("accountno");
		 String amountStr=request.getParameter("amount");
		 
		 double amount=Double.parseDouble(amountStr);
		 String wihtdrawResult = null;
		try {
			wihtdrawResult = performWihtdrawal(accountno,amount);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 PrintWriter out = response.getWriter();
	        out.println("<html><body>");
	        out.println("<h2>Wihtdraw Result:</h2>");
	        out.println("<p>" + wihtdrawResult + "</p>");
	        out.println("</body></html>");
	}
	private String performWihtdrawal(String accountno,double amount) throws ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
				
		  PreparedStatement preparedStatement=connection.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE accountno = ?");
		  PreparedStatement pstmt = connection.prepareStatement("INSERT INTO transaction_history (accountno, transaction_type, amount,transaction_date) VALUES (?, 'Debited', ?,?)")){
			  preparedStatement.setDouble(1, amount);
			  preparedStatement.setString(2,accountno);
			  
			  int rowsAffected=preparedStatement.executeUpdate();
			  if(rowsAffected>0) {
				     pstmt.setString(1, accountno);
	                 pstmt.setDouble(2, amount);
	                 pstmt.setTimestamp(3, getCurrentTimestamp());
	                 pstmt.executeUpdate();
				  return "Wihtdrawal of Rs."+amount+" successful to account number "+accountno;
			  }
			  else {
				  return "Withdrawal Unsuccessful";
			  }
		}
		catch (SQLException e) {
            e.printStackTrace();
            return "Error during wihtdrawal"+e.getMessage();
		}
	}

	private Timestamp getCurrentTimestamp() {
		java.util.Date today = new java.util.Date();
        return new Timestamp(today.getTime());
	}
}
