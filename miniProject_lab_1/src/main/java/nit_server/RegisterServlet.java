package nit_server;

import java.io.IOException;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        AdminBean ab = new AdminBean();

        ab.setName(req.getParameter("FullName"));
        ab.setEmail(req.getParameter("Email"));
        ab.setPhno(req.getParameter("Phno"));
        ab.setPassword(req.getParameter("Password"));

        RegisterDAO dao = new RegisterDAO();
        int r = dao.register(ab);
        if(r>0) {
        	req.setAttribute("msg", "Registration Successful...<br>");
        	}
        	RequestDispatcher rd =
        	req.getRequestDispatcher("Register.jsp");
        	rd.forward(req, res);
        	}

//        res.setContentType("text/html");
//        PrintWriter out = res.getWriter();
//        if (r > 0) {
//            out.println("<h2>Registration Successful</h2>");
//        } else {
//            out.println("<h2>Registration Failed</h2>");
//        }
    }

