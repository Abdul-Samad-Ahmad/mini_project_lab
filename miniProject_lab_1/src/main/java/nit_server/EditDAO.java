package nit_server;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EditDAO {
	
	
	public static ProductBean getProductByCode(String pcode) {
		ProductBean pb = null;
		try {
			Connection con = LoginDBConnection.getcon();
			PreparedStatement ps = con.prepareStatement("select * from product1 where pcode =? ");
			ps.setString(1, pcode);
		ResultSet rs =	ps.executeQuery();
		if(rs.next()) {
			pb = new ProductBean();
			pb.setPcode(rs.getString("pcode"));
			pb.setPname(rs.getString("pname"));
			pb.setPrice(rs.getDouble("pprice"));
			pb.setStock(rs.getInt("stock"));
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pb;
	
	}

	
	int k =0;
	public int update(ProductBean pb) {
		try {
			Connection con = LoginDBConnection.getcon();
			PreparedStatement ps = con.prepareStatement("update product1 set  pprice=?, stock=?   where pcode =? ");
			
			ps.setDouble(1,pb.getPrice());
			ps.setInt(2,pb.getStock());
			ps.setString(3,pb.getPcode());
	
			 k=ps.executeUpdate();
			
		}catch(Exception e) 
		{
			e.printStackTrace();
		}
			return k;
			
	}
	int a = 0;
	public int delete(String code) {
		try {
			Connection con = LoginDBConnection.getcon();
			PreparedStatement ps = con.prepareStatement("delete from product1 where pcode=?");
			ps.setString(1,code);
			a= ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
}


	
	


 
  
	

	
//
//
//
