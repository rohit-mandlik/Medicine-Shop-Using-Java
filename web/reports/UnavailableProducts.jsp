<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%
    // Helper method to create a PdfPCell with specified content and font
    private PdfPCell createCell(String content, Font font) {
        PdfPCell cell = new PdfPCell(new Paragraph(content, font));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        return cell;
    }
%>
<%
    HttpSession httpSession = request.getSession();
    String gid = (String) httpSession.getAttribute("currentuser");

    int flag = 0;
    ResultSet rs = null;
    PreparedStatement ps = null;
    java.sql.Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
        ps = conn.prepareStatement("select p.pid, p.pname, p.price, p.manufacturer, i.quantity from product p, inventory i where i.pid = p.pid and i.quantity = 0 and sid = ?");
        ps.setString(1, gid);
        rs = ps.executeQuery();

        // Create a PDF document
        Document document = new Document();
        
        // Create a ByteArrayOutputStream to hold the PDF data
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
        try {
            // Create a PdfWriter instance to write the document to the ByteArrayOutputStream
            PdfWriter.getInstance(document, baos);
            
            // Open the document
            document.open();
            
            // Create a Font instance for text rendering
            Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            
            // Create a Paragraph instance for the table header
            Paragraph header = new Paragraph();
            header.setFont(font);
            header.add("Unavailable Products");
            document.add(header);
            
            // Create a table with 6 columns
            PdfPTable table = new PdfPTable(6);
            table.setWidthPercentage(100); // Set the table width to 100% of the page width
            
            // Set table cell border width and color
            table.getDefaultCell().setBorderWidth(1);
            table.getDefaultCell().setBorderColor(com.itextpdf.text.BaseColor.BLACK);
            
            // Add table headers
            table.addCell(createCell("Sr. No.", font));
            table.addCell(createCell("Product ID", font));
            table.addCell(createCell("Product Name", font));
            table.addCell(createCell("Price", font));
            table.addCell(createCell("Manufacturer", font));
            table.addCell(createCell("Stock", font));
            
            // Iterate over the ResultSet and add table rows
            while (rs.next()) {
                flag++;
                table.addCell(createCell(String.valueOf(flag), font));
                table.addCell(createCell(rs.getString("pid"), font));
                table.addCell(createCell(rs.getString("pname"), font));
                table.addCell(createCell("Rs. " + rs.getDouble("price"), font));
                table.addCell(createCell(rs.getString("manufacturer"), font));
                table.addCell(createCell(String.valueOf(rs.getInt("quantity")), font));
            }
            
            // Add the table to the document
            document.add(table);
        } finally {
            // Close the document
            document.close();
        }
        
        // Set the response headers
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"unavailable_products.pdf\"");
        
        // Get the response output stream
        OutputStream outputStream = response.getOutputStream();
        
        // Write the PDF data to the response
        baos.writeTo(outputStream);
        outputStream.flush();
        outputStream.close();
        
    } catch (Exception e) {
        out.println("Error: " + e);
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            out.println("Error: " + e);
        }
    }
%>


