<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

h2 {
    color: #333;
}

form {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    color: #333;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #fff;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

/* Optional: Add some spacing between form elements */
br {
    margin-bottom: 10px;
}
</style>
</head>
<body>
    <form action="<%= request.getContextPath() %>/ExamController" method="post">
    <input type="hidden" name="action" value="changepassword">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>
        <label for="newPassword">New Password:</label>
        <input type="password" name="newPassword" required><br><br>
        
        <label for="confirmPassword">Confirm New Password:</label>
        <input type="password" name="confirmPassword" required><br><br>
 <%
 if ("POST".equalsIgnoreCase(request.getMethod())) {
     org.examination.bean.UpdateForm updateBean = new org.examination.bean.UpdateForm();
     updateBean.setUsername(request.getParameter("username"));
     updateBean.setNewPassword(request.getParameter("newPassword"));
     updateBean.setConfirmPassword(request.getParameter("confirmPassword"));
     
     org.examination.database.LoginData loginData = new org.examination.database.LoginData();
     boolean passwordChanged = loginData.changePassword(updateBean);

     if (passwordChanged) {
         out.println("<p>Password changed successfully!</p>");
     } 
     else {
         out.println("<p>Password change failed. Please try again.</p>");
     }
 }
 %>
        <input type="submit" value="Change Password">
</body>
</html>