/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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

/**
 *
 * @author Admin
 */
@MultipartConfig
public class resumeForm extends HttpServlet {

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
            out.println("<title>Servlet resumeForm</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String path=request.getParameter("D:/53003230108/Server");
            Part filePart=request.getPart("myFile");
            String filename=filePart.getSubmittedFileName();
            out.print("<br><br><hr>File Name:"+filename);
            OutputStream os=null;
            InputStream is=null;
            try{
                os=new FileOutputStream(new File(path+File.separator+filename));
                is=filePart.getInputStream();
                int read=0;
                while((read=is.read())!=1){
                    os.write(read);
                }
                out.println("<br>file Uploaded Sucessfully.....!!");
                
            }
            catch(FileNotFoundException e)
            {
                out.print(e);
            }
            out.println("<h1>Servlet resumeForm at " + request.getContextPath() + "</h1>");
            out.println("Name:"+request.getParameter("name") );
            out.println("Email:"+request.getParameter("email") );
            out.println("Mobile Number:"+request.getParameter("mobile") );
            out.println("Address:"+request.getParameter("address") );
            out.println("DOB:"+request.getParameter("dob") );
            out.println("Qualification:"+request.getParameter("qualification") );
            out.println("Degree:"+request.getParameter("degree") );
            out.println("Percentage:"+request.getParameter("percentage") );
            out.println("Institute:"+request.getParameter("institute") );
            out.println("JobTitle:"+request.getParameter("jobTitle") );
            out.println("Experience:"+request.getParameter("experience") );
            out.println("Company:"+request.getParameter("company") );
            out.println("<a href='FileDownload'>Download OnePage resume</a>");
            
            
            
            
            
            


                    
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
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
