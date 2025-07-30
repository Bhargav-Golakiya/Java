import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class resumeForm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String path = "D:/53003230108/Server";
            Part filePart = request.getPart("photo");
            String filename = filePart.getSubmittedFileName();
            out.print("<br><br><hr>File Name:" + filename);

            // Save the uploaded file
            OutputStream os = null;
            InputStream is = null;
            try {
                os = new FileOutputStream(new File(path + File.separator + filename));
                is = filePart.getInputStream();
                int read = 0;
                while ((read = is.read()) != -1) {
                    os.write(read);
                }
                out.println("<br>File Uploaded Successfully.....!!");
            } catch (FileNotFoundException e) {
                out.print(e);
            }

            // Collect form data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String qualification = request.getParameter("qualification");
            String degree = request.getParameter("degree");
            String percentage = request.getParameter("percentage");
            String institute = request.getParameter("institute");
            String jobTitle = request.getParameter("jobTitle");
            String experience = request.getParameter("experience");
            String company = request.getParameter("company");

            // Create PDF
            Document document = new Document();
            try {
                // Create a PDF output stream
                PdfWriter.getInstance(document, new FileOutputStream("D:/53003230108/Server/" + name + "_resume.pdf"));
                document.open();

                // Add content to the PDF
                Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12);
                document.add(new Paragraph("Resume for " + name, font));
                document.add(new Paragraph("Email: " + email, font));
                document.add(new Paragraph("Mobile: " + mobile, font));
                document.add(new Paragraph("Address: " + address, font));
                document.add(new Paragraph("Date of Birth: " + dob, font));
                document.add(new Paragraph("Qualification: " + qualification, font));
                document.add(new Paragraph("Degree: " + degree, font));
                document.add(new Paragraph("Percentage: " + percentage, font));
                document.add(new Paragraph("Institute: " + institute, font));
                document.add(new Paragraph("Job Title: " + jobTitle, font));
                document.add(new Paragraph("Experience: " + experience, font));
                document.add(new Paragraph("Company: " + company, font));

                // Add the image to the PDF
                File imageFile = new File(path + File.separator + filename);  // The uploaded image file
                if (imageFile.exists()) {
                    Image img = Image.getInstance(imageFile.getAbsolutePath());
                    img.scaleToFit(150, 150);  // Adjust size of the image as per need
                    img.setAlignment(Image.ALIGN_CENTER);  // Align the image to the center
                    document.add(img);
                }

                document.close();
                out.println("<br><br>PDF generated successfully!<br>");
                out.println("<a href='D:/53003230108/Server/" + name + "_resume.pdf'>Download PDF Resume</a>");
            } catch (DocumentException e) {
                out.println("<br>Failed to generate PDF: " + e.getMessage());
            } finally {
                if (document.isOpen()) {
                    document.close();
                }
            }

            out.println("<h1>Servlet resumeForm at " + request.getContextPath() + "</h1>");
            out.println("Name:" + name);
            out.println("Email:" + email);
            out.println("Mobile Number:" + mobile);
            out.println("Address:" + address);
            out.println("DOB:" + dob);
            out.println("Qualification:" + qualification);
            out.println("Degree:" + degree);
            out.println("Percentage:" + percentage);
            out.println("Institute:" + institute);
            out.println("JobTitle:" + jobTitle);
            out.println("Experience:" + experience);
            out.println("Company:" + company);
            out.println("<a href='FileDownload'>Download OnePage resume</a>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Generates a PDF resume from form data with an image";
    }
}
