package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest {

	/**
	 * @param args
	 * @throws ClassNotFoundException 
	 */
	public static void main(String[] args) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("org.postgresql.Driver");

			conn = DriverManager
					.getConnection("jdbc:postgresql://localhost/cse135?"
							+ "user=postgres&password=test");

			Statement statement = conn.createStatement();

			// Use the created statement to SELECT
			// the student attributes FROM the Student table.
			rs = statement.executeQuery("SELECT * FROM countries_and_states");

			while (rs.next()) {
				System.out.println(rs.getString(2));
			}
			rs.close();

			statement.close();

			conn.close();
		} catch (SQLException e) {

			throw new RuntimeException(e);
		} finally {

			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				} // Ignore
				rs = null;
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				} // Ignore
				pstmt = null;
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				} // Ignore
				conn = null;
			}

		}
	}
}
