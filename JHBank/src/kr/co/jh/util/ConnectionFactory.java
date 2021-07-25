package kr.co.jh.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public Connection getConnection() {
		Connection conn = null;
		try {
			// 1단계
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2단계
			String url = "jdbc:oracle:thin:@192.168.217.202:1521/KOPODA";
			String user = "da2109";
			String password = "da0328";

			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
