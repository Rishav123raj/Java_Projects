package org.examination.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.examination.bean.LoginForm;
import org.examination.bean.UpdateForm;

public class LoginData {

	public boolean validate(LoginForm loginBean) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/connection?allowPublicKeyRetrieval=true&useSSL=false", "root", "rishavraj");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from user where username = ? and password = ? ")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}
	
	public boolean changePassword(UpdateForm updateBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/connection?allowPublicKeyRetrieval=true&useSSL=false", "root", "rishavraj");

                // Prepare statement for updating the password
                PreparedStatement preparedStatement = connection
                        .prepareStatement("update user set password = ? where username = ?")) {
        	
            preparedStatement.setString(1, updateBean.getNewPassword());
            preparedStatement.setString(2, updateBean.getUsername());

            int rowsUpdated = preparedStatement.executeUpdate();
            status = rowsUpdated > 0;

        } catch (SQLException e) {
            // Handle SQL exception
            printSQLException(e);
        }

        return status;
    }
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}