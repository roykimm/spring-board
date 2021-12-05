package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DBConn {

	private Connection conn;

	public DBConn() {

		try {
			String dbURL = "";
			String dbID = "bpj";
			String dbPassword = "bpj";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConn() {
		return conn;
	}

}
