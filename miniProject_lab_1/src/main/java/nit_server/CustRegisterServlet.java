package nit_server;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterSer")

public class CustRegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws 
	ServletException,IOException{
		 CustBean cb = new CustBean();
		 //1122Q

	        
	        cb.setUname(req.getParameter("uname"));
	        cb.setPassword(req.getParameter("pass"));
	        cb.setFname(req.getParameter("fname"));
	        cb.setLname(req.getParameter("lname"));
	        cb.setGmail(req.getParameter("gmail"));
	        cb.setPhno(req.getParameter("pno"));
	       
	        int r = new CustRegisterDAO().cregis(cb);
	       // RegisterDAO dao = new RegisterDAO();
	       // int r = dao.register(ab);
	        if(r>0) {
	        	req.setAttribute("cmsg", "Registration Successful...<br>");
	        	}
	        	RequestDispatcher rd =
	        	req.getRequestDispatcher("CRegiste.jsp");
	        	rd.forward(req, res);
	        	}
	}


