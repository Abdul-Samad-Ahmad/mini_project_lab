package nit_server;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/add")

public class ProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		HttpSession hs = req.getSession(false);
		if(hs==null) {
			req.setAttribute("wrong","No Products areAdded");
			RequestDispatcher rq = req.getRequestDispatcher("Wrong.jsp");
			rq.forward(req, res);
		}
		else {
		ProductBean pb = new ProductBean();
		
		pb.setPcode(req.getParameter("pcode"));
		pb.setPname(req.getParameter("pname"));
		pb.setPrice(Double.parseDouble(req.getParameter("pprice")));
		pb.setStock(Integer.parseInt(req.getParameter("stock")));
		
//		ProductDAO dao = new ProductDAO();
//		int p = dao.details(pb);
		int p = new ProductDAO().details(pb);
		if(p>0) {
			
			req.setAttribute("msg", "Successfully Added Products");
			 RequestDispatcher rq = req.getRequestDispatcher("Product.jsp");
	            rq.forward(req, res);
			
		}
		}
	}
//		else {
//			req.setAttribute("wrong","No Products areAdded");
//			RequestDispatcher rq = req.getRequestDispatcher("Wrong.jsp");
//			rq.forward(req, res);
//		}
		
	}


