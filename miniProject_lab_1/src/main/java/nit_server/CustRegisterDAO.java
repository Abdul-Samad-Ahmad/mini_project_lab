package nit_server;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CustRegisterDAO {
	public int cregis(CustBean cb) {
		int cr = 0;
		try {
			Connection con = LoginDBConnection.getcon();
			PreparedStatement ps = con.prepareStatement("insert into custlogin values(?,?,?,?,?,?)");
			ps.setString(1, cb.getUname());
			ps.setString(2, cb.getPassword());
			ps.setString(3, cb.getFname());
			ps.setString(4, cb.getLname());
			ps.setString(5, cb.getGmail());
			ps.setString(6, cb.getPhno());
			cr = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return cr;

	}

}
