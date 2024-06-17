/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/AddressForm"})
public class AddressForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddressForm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddressForm at " + request.getContextPath() + "</h1>");
            String name = request.getParameter("name");
            String mail = request.getParameter("eid");
            String contact = request.getParameter("mbn");
            String pincode = request.getParameter("pin");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String raddress = request.getParameter("address");

            String event = request.getParameter("btndone");

            if (event.equals("Done")) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("aname", name);
                httpSession.setAttribute("amail", mail);
                httpSession.setAttribute("acontact", contact);
                httpSession.setAttribute("apincode", pincode);
                httpSession.setAttribute("acity", city);
                httpSession.setAttribute("astate", state);
                httpSession.setAttribute("araddress", raddress);
                response.sendRedirect("Payment1.jsp");
                response.setContentType("text/html;charset=UTF-8");
            }
            else{
                response.sendRedirect("Buy.jsp");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
