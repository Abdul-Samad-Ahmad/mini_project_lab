package nit_server;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustDAO {
	

	
		public CustBean cb = null;

	    public  CustBean Login2(String c1,String c2) {

//	    	ResultSet res=null;
	        try {
	            Connection con = LoginDBConnection.getcon();
	            PreparedStatement ps =
	           con.prepareStatement("select * from  custlogin where uname=? and password=?");
	            ps.setString(1, c1);
	            ps.setString(2, c2);

	          ResultSet   res = ps.executeQuery();

	           if(res.next())
	           {
	        	   cb = new CustBean();
	        	   
	        	   cb.setUname(res.getString(1));
	        	   cb.setPassword(res.getString(2));
	        	   cb.setFname(res.getString(3));
	        	   cb.setLname(res.getString(4));
	        	   cb.setGmail(res.getString(5));
	        	   cb.setPhno(res.getString(6));
	        	   
	           }
	        }
	       catch (Exception e) {
	            e.printStackTrace();
	        }
	        return cb;
	    }
	
	    public ArrayList<ProductBean> Cview() {
	        ArrayList<ProductBean> al = new ArrayList<ProductBean>();
	        try {
	            Connection con = LoginDBConnection.getcon();
	            System.out.println("ProductDAO-- Database connected");
	            PreparedStatement ps = con.prepareStatement("select * from product1");
	            ResultSet rs = ps.executeQuery();
	           
	            while (rs.next()) {
	                ProductBean pb = new ProductBean();
	                pb.setPcode(rs.getString("PCODE"));
	                pb.setPname(rs.getString("PNAME"));
	                pb.setPrice(rs.getDouble("PPRICE"));
	                pb.setStock(rs.getInt("STOCK"));
	                al.add(pb);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
	    
	    public int k = 0;
	    public int billUpdate(String code,int qty) {
	    	try {
	    		Connection con = LoginDBConnection.getcon();
	    		 System.out.println("ProductDAO-- Database connected");
	    		 PreparedStatement ps = con.prepareStatement("update product1 set stock=stock-? where pcode=?");
	    		 ps.setInt(1, qty);
	    		 ps.setString(2, code);
	    		 k= ps.executeUpdate();
	    		
	    	}catch(Exception e) {
	    		
	    		e.printStackTrace();
	    		
	    	}
			return k;
	    }

}
	    





