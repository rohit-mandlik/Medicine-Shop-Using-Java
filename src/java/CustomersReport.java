
import com.itextpdf.text.BaseColor;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/cr"})
public class CustomersReport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        String gid = (String) httpSession.getAttribute("currentuser");

        int flag = 0;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "rohit123");
            ps = conn.prepareStatement("select * from customer");
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
                Font font = FontFactory.getFont(FontFactory.TIMES_BOLD, 10);
                Font font1 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 9);
                Font font2 = FontFactory.getFont(FontFactory.TIMES_BOLDITALIC, 17, BaseColor.BLACK);
                Font font3 = FontFactory.getFont(FontFactory.COURIER_BOLDOBLIQUE, 17, BaseColor.BLACK);
              
                // Create a PdfPTable for the header and set the background color
                
                PdfPTable headerTable1 = new PdfPTable(1);
                headerTable1.setWidthPercentage(100);
                PdfPCell headerCell1 = createCell("Ashtavinayak Medical Store", font3);
                //headerCell1.setBorderWidth(0);
                headerCell1.setFixedHeight(40f);
                headerCell1.setBackgroundColor(BaseColor.WHITE);
                headerCell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerTable1.addCell(headerCell1);

                // Add the header table to the document
                document.add(headerTable1);
                
                PdfPTable headerTable = new PdfPTable(1);
                headerTable.setWidthPercentage(100);
                PdfPCell headerCell = createCell("Customers", font2);
                headerCell.setFixedHeight(30f);

                headerCell.setBackgroundColor(BaseColor.ORANGE);
                headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                headerTable.addCell(headerCell);

                // Add the header table to the document
                document.add(headerTable);

                // Create a PdfPTable for the date and set the background color
                PdfPTable dateTable = new PdfPTable(1);
                dateTable.setWidthPercentage(100);
                PdfPCell dateCell = createCell(new SimpleDateFormat("EEEE, dd-MMM-yyyy").format(new Date()), font1);
                dateCell.setFixedHeight(20f);
                dateCell.setBackgroundColor(BaseColor.YELLOW);
                dateCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                dateTable.addCell(dateCell);
                document.add(dateTable);
                
                // Create a table with 6 columns
                PdfPTable table = new PdfPTable(6);
                table.setWidthPercentage(100); // Set the table width to 100% of the page width
                table.setLockedWidth(false);
                
                // Set table cell border width and color
                table.getDefaultCell().setBorderWidth(1);
                table.getDefaultCell().setBorderColor(com.itextpdf.text.BaseColor.BLACK);

                // Add table headers
                table.addCell(createCellh("Sr. No.", font, BaseColor.LIGHT_GRAY));
                table.addCell(createCellh("uid", font, BaseColor.LIGHT_GRAY));
                table.addCell(createCellh("Customer Name", font, BaseColor.LIGHT_GRAY));
                table.addCell(createCellh("Email", font, BaseColor.LIGHT_GRAY));
                table.addCell(createCellh("Contact No.", font, BaseColor.LIGHT_GRAY));
                table.addCell(createCellh("Address", font, BaseColor.LIGHT_GRAY));

                // Iterate over the ResultSet and add table rows
                while (rs.next()) {
                    flag++;
                    table.addCell(createCell(String.valueOf(flag), font1));
                    table.addCell(createCell(rs.getString("uid"), font1));
                    table.addCell(createCell(rs.getString("fname")+" "+rs.getString("Lname"), font1));
                    table.addCell(createCell(rs.getString("email"), font1));
                    table.addCell(createCell("+91 " + rs.getLong("phno"), font1));
                    table.addCell(createCell(rs.getString("address"), font1));
                }

                // Add the table to the document
                document.add(table);
            PdfPTable dateTable1 = new PdfPTable(1);
                dateTable1.setWidthPercentage(100);
                PdfPCell dateCell1 = createCell(new SimpleDateFormat("EEEE, dd-MMM-yyyy").format(new Date()), font1);
                dateCell1.setFixedHeight(20f);
                dateCell1.setBackgroundColor(BaseColor.YELLOW);
                dateCell1.setHorizontalAlignment(Element.ALIGN_LEFT);
                dateTable1.addCell(dateCell1);
                document.add(dateTable1);
            } finally {
                // Close the document
                document.close();
            }

            // Set the response headers
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"AMS_Customers.pdf\"");

            // Write the PDF data to the response
            try ( // Get the response output stream
                    OutputStream outputStream = response.getOutputStream()) {
                // Write the PDF data to the response
                baos.writeTo(outputStream);
                outputStream.flush();
            }

        } catch (DocumentException | IOException | ClassNotFoundException | SQLException e) {
            throw new ServletException("Error: " + e.getMessage(), e);
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
            } catch (SQLException e) {
                throw new ServletException("Error: " + e.getMessage(), e);
            }
        }
    }

    private PdfPCell createCellh(String content, Font font, BaseColor backgroundColor) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setBackgroundColor(backgroundColor);
        cell.setFixedHeight(20f);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        return cell;
    }

    // Helper method to create a PdfPCell with specified content and font
    private PdfPCell createCell(String content, Font font) {
        PdfPCell cell = new PdfPCell(new Paragraph(content, font));
        cell.setBackgroundColor(BaseColor.WHITE);

        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        return cell;
    }
}
