package org.examination;

import java.io.IOException;
import java.io.PrintWriter;
import org.examination.bean.LoginForm;
import org.examination.bean.UpdateForm;
import org.examination.database.LoginData;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LoginData logindata;
    public void init() {
    	logindata=new LoginData();
    }
    public ExamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action) {
		case "login":
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("index.jsp").forward(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");

        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "changepassword":
                handleChangePassword(request, response);
                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
	}
	
	 private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		LoginForm loginbean=new LoginForm();
		loginbean.setUsername(username);
		loginbean.setPassword(password);
		
		try {
		if(logindata.validate(loginbean)) {
			username = request.getParameter("username");
		    HttpSession session = request.getSession();
		    session.setAttribute("username", username);
			response.sendRedirect("examination.jsp");
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
	 
	 private void handleChangePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        String username = request.getParameter("username");
	        String newPassword = request.getParameter("newPassword");
	        String confirmPassword = request.getParameter("confirmPassword");

	        UpdateForm updateBean = new UpdateForm();
	        updateBean.setUsername(username);
	        updateBean.setNewPassword(newPassword);
	        
	        if (!newPassword.equals(confirmPassword)) {
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<html><head><title>Password Mismatch</title></head><body>");
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('New Password and Confirm Password do not match!');");
	            out.println("history.back();"); 
	            out.println("</script>");
	            out.println("</body></html>");
	            return; 
	        }
	        
	        try {
	            boolean passwordChanged = logindata.changePassword(updateBean);
	            if (passwordChanged) {
	            	System.out.println("Password Changed Successfully");
	                response.sendRedirect("login.jsp");
	            }
	            else {
	            	System.out.println("Password Change failed");
	            }
	        } catch (Exception e) {
	            // Handle DB-related errors
	            System.out.println("DB related error");
	            e.printStackTrace();
	        }
	    }
	}

