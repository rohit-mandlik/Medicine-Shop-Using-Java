/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid1 = request.getParameter("userid");
        String pass1 = request.getParameter("password");
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("currentuser", uid1);

        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement ps = null;

        String query1 = "SELECT uid,pass from customer WHERE uid=?";

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");

            ps = conn.prepareStatement(query1);
            ps.setString(1, uid1);

            rs = ps.executeQuery();
            if (rs.next()) {
                if ((rs.getString(2)).equals(pass1)) {
                    response.sendRedirect("Homepage.jsp");
                } else {
                    response.sendRedirect("LoginError1.html");
                }
            } else {
                response.sendRedirect("LoginError2.html");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
            }
            ;
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
            }
            ;
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
            ;
        }
    }
}
