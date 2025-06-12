package nit_server;
import java.sql.Connection;
import java.sql.DriverManager;
public class LoginDBConnection {

	private static Connection con = null;
	private LoginDBConnection() {}
	static {
		try {
			Class.forName(LoginDBInfo.Driver);
			con = DriverManager.getConnection(LoginDBInfo.Url,LoginDBInfo.Uname,LoginDBInfo.Pasword);

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getcon() {
		return con;
	}


}
