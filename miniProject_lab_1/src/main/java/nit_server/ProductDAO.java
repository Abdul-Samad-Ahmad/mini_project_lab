package nit_server;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	
	

	     public	int p = 0;
		public int details(ProductBean pb) {
		
			try {
				 Connection con = LoginDBConnection.getcon();
				 PreparedStatement ps = con.prepareStatement("insert into product1 values(?,?,?,?)");

				 ps.setString(1, pb.getPcode());
				 ps.setString(2, pb.getPname());
				 ps.setDouble(3, pb.getPrice());     
				 ps.setInt(4, pb.getStock());

				 p = ps.executeUpdate();


			}catch(Exception e) {
				e.printStackTrace();
			}
			return p;

		}

		 ArrayList<ProductBean> al = new ArrayList<ProductBean>();
		public ArrayList<ProductBean> viewAll() {
		
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

		
		
	}



