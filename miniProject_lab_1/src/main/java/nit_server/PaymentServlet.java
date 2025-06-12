package nit_server;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		 HttpSession hs = req.getSession(false);
	        if (hs == null) {
	            req.setAttribute("msg", "Session expired. Please login again.");
	            req.getRequestDispatcher("msg.jsp").forward(req, res);
	            return;
		
	} else {
		double bill = Double.parseDouble(req.getParameter("bill"));
		String code= req.getParameter("code");
    	int qty = Integer.parseInt(req.getParameter("qty"));
    	int k = new CustDAO().billUpdate(code, qty);
    	
    	if(k>0) {
    		req.setAttribute("bill", bill);
    		//req.setAttribute("product", pb);
    		req.getRequestDispatcher("Payment.jsp").forward(req, res);
    	}
	}

}
}
