package nit_server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/Bill")
public class BillProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    	//System.out.println("BillProductServlet.doPost()");

        HttpSession hs = req.getSession(false);
        if (hs == null) {
            req.setAttribute("msg", "Session expired. Please login again.");
            req.getRequestDispatcher("msg.jsp").forward(req, res);
            return;
        }
        else {
        	ProductBean pb = new ProductBean();
        	pb.setPname(req.getParameter("name"));
        	pb.setPcode(req.getParameter("pCode"));
        	pb.setPrice(Double.parseDouble(req.getParameter("price")));
        	pb.setStock(Integer.parseInt(req.getParameter("stock")));
        	//String code= req.getParameter("pCode");
        	int qty = Integer.parseInt(req.getParameter("qty"));
        	//int k = new CustDAO().billUpdate(code, qty);
        	if(pb!=null) {
        		req.setAttribute("quantity", qty);
        		req.setAttribute("product", pb);
        		req.getRequestDispatcher("BillProduct.jsp").forward(req, res);
        	}
        }
    }
}

       

       
    
