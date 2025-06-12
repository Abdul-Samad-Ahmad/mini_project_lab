package nit_server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BuyServlet")

public class CustBuyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		 HttpSession hs = req.getSession(false);
	        //AdminBean ab = (AdminBean)hs.getAttribute("username");
	      
			//List<ProductBean> list = (List<ProductBean>)hs.getAttribute("products");
	        if (hs == null) {
	            req.setAttribute("msg", "Session expired. Please login again");
	            RequestDispatcher rd = req.getRequestDispatcher("msg.jsp");
	            rd.forward(req, res);
	           
	        }
	        else {
	        
//	        
	        	ArrayList<ProductBean> al = (ArrayList<ProductBean>)hs.getAttribute("Clist");      
//	        	
	        	String pcode = req.getParameter("pcode");
	        	Iterator<ProductBean> itr = al.iterator();
	        	
	        while(itr.hasNext()) {
	        	 ProductBean pb = itr.next();
	        	 if(pcode.equals(pb.getPcode())) {
	        		 req.setAttribute("products", pb);
	        		 req.getRequestDispatcher("Buy.jsp").forward(req, res);
	        		 return;  // Exit method to prevent further execution
	        		 
	        		 
	        	 }
	        	 else {
	        		 System.out.println("something went wrong edit servlet");
	        		 
	        	 }
	        }
	        	
	        }
	        
	       
	        
	       
	       
	    }
}
