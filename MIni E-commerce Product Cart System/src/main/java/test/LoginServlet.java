package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")

public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res)
	 throws ServletException,IOException{
		
		 String name = req.getParameter("name");
		 String password = req.getParameter("password");
		 
		 UserBean ub = new LoginDAO().login(name,password);
		 if(ub==null) {
			 req.setAttribute("msg", ub);
			 req.getRequestDispatcher("msg.jsp").forward(req, res);
		 }
		 else {
			 HttpSession hs = req.getSession() ;
			 hs.setAttribute("name", hs);
			 req.getRequestDispatcher("login.jsp").forward(req, res);
		 }
		
//		
		
		
	}

}
