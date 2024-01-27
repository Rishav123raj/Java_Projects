import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BankAccountDAO {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "rishavraj"; 
    
    public static double getBalance(int accountNumber) {
        double balance = 0;

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT balance FROM accounts WHERE accountno = ?")) {

            preparedStatement.setInt(1, accountNumber);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                balance = resultSet.getDouble("balance");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return balance;
    }
}