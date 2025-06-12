package nit_server;
import java.io.Serializable;
import java.sql.*;

@SuppressWarnings("serial")
public class ProductBean implements Serializable{
	
	private String pcode,pname;
	
    private double price;
	private int stock;
	public ProductBean() {}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	

}
