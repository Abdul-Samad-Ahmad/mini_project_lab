package nit_server;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession hs = request.getSession(false);
//        AdminBean ab = (AdminBean) hs.getAttribute("username");
        if (hs == null) {
            request.setAttribute("wrong", "Session expired. Please login again");
            RequestDispatcher rd = request.getRequestDispatcher("Wrong.jsp");
            rd.forward(request, response);
            
        } else {
        	 ArrayList<ProductBean> al = (ArrayList<ProductBean>)hs.getAttribute("alist");
        	 String pC = request.getParameter("pcode");
        	 Iterator<ProductBean> it = al.iterator();
        	 while(it.hasNext()) {
        	ProductBean pb = (ProductBean)it.next();
        	if(pC.equals(pb.getPcode()))
        	
        	pb.setPrice(Double.parseDouble(request.getParameter("pprice")));
        	pb.setStock(Integer.parseInt(request.getParameter("stock")));
        	
        	int k = new EditDAO().update(pb);
        	if(k>0) {
        		request.setAttribute("msg", "updated Sussessfully");
        		System.out.println("hello");
        		request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        		
        	}
        	else {
        		System.out.println("something went wrong in updateding");
        	}
        	 }
        	
        
        }
    }
}
        
        