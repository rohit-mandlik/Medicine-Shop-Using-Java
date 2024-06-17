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
import javax.sql.*;
import java.sql.*;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/CancelOrder"})
public class CancelOrder extends HttpServlet {

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
            out.println("<title>Servlet CancelOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelOrder at " + request.getContextPath() + "</h1>");

            HttpSession httpSession = request.getSession();
            String guid = (String) httpSession.getAttribute("currentuser");
            int oid = Integer.parseInt(request.getParameter("oid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String pid = request.getParameter("pid");

            Connection conn = null;
            ResultSet rs = null;
            PreparedStatement ps = null;
            PreparedStatement ps1 = null;
            PreparedStatement ps2 = null;
            PreparedStatement ps3 = null;
            String query1 = "select * from orders where oid=?";
            String query2 = "insert into cancelledorders(oid,pid,sid,uid,orderdatetime,quantity,price,image) values(?,?,?,?,?,?,?,?)";
            String query3 = "delete from orders where oid=?";
            String query4 = "update inventory set quantity = quantity + ? ";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                
                ps = conn.prepareStatement(query1);
                ps.setInt(1, oid);
                rs = ps.executeQuery();
                ps1 = conn.prepareStatement(query3);
                ps1.setInt(1, oid);
                int j = ps1.executeUpdate();
                
                ps3 = conn.prepareStatement(query4);
                ps3.setInt(1, quantity);
                int l = ps3.executeUpdate();
                
                if (rs.next()) {
                    String c = rs.getString("sid");
                    String d = rs.getString("uid");
                    String e = rs.getString("orderdatetime");
                    Double f = rs.getDouble("price");
                    String g = rs.getString("image");

                    ps2 = conn.prepareStatement(query2);
                    ps2.setInt(1, oid);
                    ps2.setString(2, pid);
                    ps2.setString(3, c);
                    ps2.setString(4, d);
                    ps2.setString(5, e);
                    ps2.setInt(6, quantity);
                    ps2.setDouble(7, f);
                    ps2.setString(8, g);

                    int i = ps2.executeUpdate();
                    out.println("<script>alert('Order Cancelled');</script>");
                    response.sendRedirect("CancelledOrders.jsp");
                }
            } catch (Exception E) {
                out.println(E);
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                } catch (Exception e) {
                };
                try {
                    if (ps != null) {
                        ps.close();
                    }
                } catch (Exception e) {
                };
                try {
                    if (ps2 != null) {
                        ps2.close();
                    }
                } catch (Exception e) {
                };
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (Exception e) {
                };
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
