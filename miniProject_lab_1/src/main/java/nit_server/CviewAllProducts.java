package nit_server;



import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/View")
public class CviewAllProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get the existing session without creating a new one
        HttpSession hs = req.getSession(false);

        if (hs == null) {
            req.setAttribute("msg", "Session expired. Please login again.<br>");
            req.getRequestDispatcher("msg.jsp").forward(req, res);
           
        }

        // Check if AdminBean is present in the session
//        AdminBean ab = (AdminBean) hs.getAttribute("username");
//        if (ab == null) {
//            req.setAttribute("msg", "Unauthorized access. Admin not logged in.<br>");
//            req.getRequestDispatcher("msg.jsp").forward(req, res);
//            return;
//        }
        else {
       
            // Fetch product list and store it in the session
            ArrayList<ProductBean> al = new CustDAO().Cview();
            hs.setAttribute("Clist", al);
       
            //req.setAttribute("error", "Failed to fetch products: " );
        

        // Forward to the JSP for display
        req.getRequestDispatcher("CProducts.jsp").forward(req, res);
    }
    }
}

