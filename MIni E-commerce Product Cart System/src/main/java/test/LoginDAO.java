package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;





public class LoginDAO {
	public UserBean ub = null;

    public  UserBean login(String s1,String s2) {

//    	ResultSet res=null;
        try {
            Connection con = DBConnection.getcon();
            PreparedStatement ps =
           con.prepareStatement("select * from  userLogin where name=? and password=?");
            ps.setString(1, s1);
            ps.setString(2, s2);

          ResultSet   res = ps.executeQuery();

           if(res.next())
           {
        	   ub = new UserBean();
        	   ub.setName(res.getString(1));
        	  
        	   ub.setPassword(res.getString(2));
        	   ub.setEmail(res.getString(3));
        	   
           }
        }
       catch (Exception e) {
            e.printStackTrace();
        }
        return ub;
    }

	
	

}

