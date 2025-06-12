package nit_server;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/clogin")

public class CustLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException
	,IOException{
		
		String name = req.getParameter("uname");
		String password = req.getParameter("passw");
		
		CustBean cb = new CustDAO().Login2(name, password);
		if(cb==null) {
			req.setAttribute("cmsg", "invalid cid");
			req.getRequestDispatcher("cmsg.jsp").forward(req, res);
			//cmsg.jsp is not done see onces 
		}
		else {
			HttpSession hs = req.getSession();
			req.setAttribute("CSuccess", "Login process<br>");
			hs.setAttribute("cbean", cb);
			req.getRequestDispatcher("clogin.jsp").forward(req, res);
		}
	}

}
