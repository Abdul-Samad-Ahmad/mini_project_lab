package nit_server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession hs = request.getSession(false);

        if (hs == null) {
            request.setAttribute("wrong", "Session expired. Please login again");
            RequestDispatcher rd = request.getRequestDispatcher("Wrong.jsp");
            rd.forward(request, response);
            return;
        }

        ArrayList<ProductBean> al = (ArrayList<ProductBean>) hs.getAttribute("alist");
        String pcode = request.getParameter("pcode");
        boolean found = false;

        Iterator<ProductBean> it = al.iterator();
        while (it.hasNext()) {
            ProductBean pb = it.next();
            if (pcode.equals(pb.getPcode())) {
                it.remove(); // Remove from session list
                found = true;
                break;
            }
        }

        if (!found) {
            request.setAttribute("msg", "Product not found in session.");
            request.getRequestDispatcher("msg.jsp").forward(request, response);
            return;
        }

        int a = new EditDAO().delete(pcode);
        if (a > 0) {
            request.setAttribute("msg", "Deleted Successfully");
            request.getRequestDispatcher("delete.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Something went wrong while deleting.");
            request.getRequestDispatcher("msg.jsp").forward(request, response);
        }
    }
}
