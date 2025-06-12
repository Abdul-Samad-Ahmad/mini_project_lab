package nit_server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.jakartaee.commons.lang3.ObjectUtils;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("uname");
		String password = req.getParameter("upass");

		AdminBean ab = new LoginDAO().retrive(name, password);

		if (ab == null) // ObjectUtils.isEmpty(ab)
		{

			req.setAttribute("invalid", "login failed");
			req.getRequestDispatcher("invalid.jsp").forward(req, res);

		} else {
			HttpSession hs = req.getSession();
			req.setAttribute("Success", " Login Process..<br>");
			hs.setAttribute("abean", ab);
			req.getRequestDispatcher("loginSuccess.jsp").forward(req, res);

		}

	}

}
