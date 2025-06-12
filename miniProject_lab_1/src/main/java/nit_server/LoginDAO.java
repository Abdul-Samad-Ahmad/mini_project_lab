package nit_server;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	public AdminBean ab = null;

    public  AdminBean retrive(String s1,String s2) {

//    	ResultSet res=null;
        try {
            Connection con = LoginDBConnection.getcon();
            PreparedStatement ps =
           con.prepareStatement("select * from  admin where name=? and password=?");
            ps.setString(1, s1);
            ps.setString(2, s2);

          ResultSet   res = ps.executeQuery();

           if(res.next())
           {
        	   ab = new AdminBean();
        	   ab.setName(res.getString(1));
        	   ab.setEmail(res.getString(2));
        	   ab.setPassword(res.getString(3));
        	   ab.setPhno(res.getString(4));
           }
        }
       catch (Exception e) {
            e.printStackTrace();
        }
        return ab;
    }
}
    


