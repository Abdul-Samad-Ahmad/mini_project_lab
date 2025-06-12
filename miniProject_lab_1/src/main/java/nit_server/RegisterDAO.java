package nit_server;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterDAO {
	public int register(AdminBean ab) {
		int r = 0;
		try {
			 Connection con = LoginDBConnection.getcon();
			 PreparedStatement ps = con.prepareStatement("insert into admin values(?,?,?,?)");
			 ps.setString(1, ab.getName());
			 ps.setString(2, ab.getEmail());
			 ps.setString(3, ab.getPhno());     
			 ps.setString(4, ab.getPassword());

		       r = ps.executeUpdate();


		}catch(Exception e) {
			e.printStackTrace();
		}


		return r;

	}



}
