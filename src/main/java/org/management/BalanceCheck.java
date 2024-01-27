package org.management;

import org.management.deposit.BankAccountDAO;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BalanceCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BalanceCheck() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int accountno = Integer.parseInt(request.getParameter("accountno"));

	        double balance = BankAccountDAO.getBalance(accountno);

	        // Display the balance
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<html><head>");
	        out.println("<style>");
	        out.println("body {");
	        out.println("    font-family: Arial, sans-serif;");
	        out.println("    background-color: #f4f4f4;");
	        out.println("    margin: 20px;");
	        out.println("}");

	        out.println("h2 {");
	        out.println("    color: #333;");
	        out.println("}");

	        out.println("p {");
	        out.println("    color: #666;");
	        out.println("}");

	        out.println("#balance {");
	        out.println("    font-weight: bold;");
	        out.println("    color: #3498db;");
	        out.println("    font-size: 18px;");
	        out.println("}");
	        
	        out.println(".balance-container {");
	        out.println("text-align:center");
	        out.println("padding:20px");
	        out.println("border:1px solid #ccc");
	        out.println("border-radius:5px");
	        out.println("box-shadow: 0 0 10px rgba(0, 0, 0, 0.1)");
	        out.println("}");
	        
	        out.println("</style>");
	        out.println("</head><body>");
	        out.println("<div class='balance-container'>");
	        out.println("<h2>Bank Balance:</h2>");
	        out.println("<p>Account Number: " + accountno + "</p>");
	        out.println("<p id='balance'>Balance: Rs. " + balance + "</p>");
	        out.println("</body></html>");
	}

}
