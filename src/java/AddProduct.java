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
import java.sql.*;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/AddProduct"})
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            HttpSession httpSession = request.getSession();
            String guid = (String) httpSession.getAttribute("currentuser");

            String prname = request.getParameter("prname");
            String prid = request.getParameter("prid");
            String mfname = request.getParameter("mfname");
            String mdate = request.getParameter("mdate");
            String edate = request.getParameter("edate");
            String price1 = request.getParameter("price");
            String quantity1 = request.getParameter("quantity");
            String image = request.getParameter("image");
            String image1 = request.getParameter("image1");
            String image2 = request.getParameter("image2");
            String category = request.getParameter("category");
            Double price = Double.valueOf(price1);
            int quantity = Integer.parseInt(quantity1);

            String query1 = "select pid from product where pid=?";
            String query2 = "insert into product(pid,pname,manufacturer,mfg,exp,price,image,image1,image2,category) values (?,?,?,?,?,?,?,?,?,?)";
            String query3 = "insert into inventory(pid,pname,sid,quantity) values (?,?,?,?)";

            ResultSet rs = null;
            Connection conn = null;
            PreparedStatement ps1 = null;
            PreparedStatement ps2 = null;
            PreparedStatement ps3 = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
                ps1 = conn.prepareStatement(query1);
                ps1.setString(1, prid);
                rs = ps1.executeQuery();
                if (!rs.next()) {
                    ps2 = conn.prepareStatement(query2);
                    ps2.setString(1, prid);
                    ps2.setString(2, prname);
                    ps2.setString(3, mfname);
                    ps2.setString(4, mdate);
                    ps2.setString(5, edate);
                    ps2.setDouble(6, price);
                    ps2.setString(7, image);
                    ps2.setString(8, image);
                    ps2.setString(9, image);
                    ps2.setString(10, category);
                    int i = ps2.executeUpdate();

                    ps3 = conn.prepareStatement(query3);
                    ps3.setString(1, prid);
                    ps3.setString(2, prname);
                    ps3.setString(3, guid);
                    ps3.setInt(4, quantity);
                    int j = ps3.executeUpdate();
                    out.println("<script>alert('Product Added Successfully');</script>");
                    response.sendRedirect("AddInventory.jsp");
                } else {
                    response.sendRedirect("AddProductError.html");
                }
            } catch (Exception e) {
                response.sendRedirect("AddProductError2.html");
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                } catch (Exception e) {
                };
                try {
                    if (ps1 != null) {
                        ps1.close();
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
                    if (ps3 != null) {
                        ps3.close();
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
