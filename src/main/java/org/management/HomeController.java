package org.management;

import java.io.IOException;

import org.management.bean.LoginForm;
import org.management.database.LoginData;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginData logindata;
    public void init() {
    	logindata=new LoginData();
    }
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action) {
		case "login":
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case "service":
			request.getRequestDispatcher("services.jsp").forward(request, response);
        	break;
		case "about":
			request.getRequestDispatcher("about.jsp").forward(request, response);
        	break;
		case "contact":
			request.getRequestDispatcher("contact.jsp").forward(request, response);
        	break;
		default:
			request.getRequestDispatcher("index.jsp").forward(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch (action) {
        case "login":
            handleLogin(request, response);
            break;
        default:
        	 request.getRequestDispatcher("index.jsp").forward(request, response);
             break;
	}
}
	
	private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String accountno=request.getParameter("accountno");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		LoginForm loginbean=new LoginForm();
		loginbean.setAccountno(accountno);
		loginbean.setUsername(username);
		loginbean.setPassword(password);
		
		try {
		if(logindata.validate(loginbean)) {
		    HttpSession session = request.getSession();
		    session.setAttribute("username", username);
		    session.setAttribute("accountno", accountno);
			response.sendRedirect("features.jsp");
		}
		else {
			 response.sendRedirect(request.getContextPath() + "/loginerror.jsp");
		}
		}
		catch(Exception e) {
			System.out.println("DB related error");
			e.printStackTrace();
	}
}
}
