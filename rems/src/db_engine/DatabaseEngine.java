//Database Core

package db_engine;

import java.sql.*;

public class DatabaseEngine {

	final String db_name = "rems_db";
	final String db_username = "sunil";
	final String db_password = "Sunil#123";
	
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println("Database Driver Error");
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
					+ db_name, db_username, db_password);
		} catch (SQLException e) {
			System.err.println("Database Connection Error");
		}
	}

	public DatabaseEngine(String query) {
		try {
			stmt = con.prepareStatement(query);
		} catch (SQLException e) {
			System.err.println("Database Query Error");
		}
	}

	public ResultSet getResultSet() {
		try {
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			System.err.println("Execution Of Database Query Error");
		}

		return rs;
	}

	public Integer getRowAffected() {
		Integer rowAffected = 0;
		try {
			rowAffected = stmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Execution Of Database Query Error");
		}
		return rowAffected;
	}

}
