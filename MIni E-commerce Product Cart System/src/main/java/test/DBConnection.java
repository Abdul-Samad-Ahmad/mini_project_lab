package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	
	
	

		private static Connection con = null;
		private DBConnection() {}
		static {
			try {
				Class.forName(DBLoginInfo.driver);
				con = DriverManager.getConnection(DBLoginInfo.url,DBLoginInfo.uname,DBLoginInfo.password);

			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		public static Connection getcon() {
			return con;
		}


	}



