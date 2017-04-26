/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Consulta;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 16177215)
public class EditarPerfil extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       
        String idUs = request.getParameter("idu");        
        Integer iduser= Integer.parseInt(idUs.trim());
        
        String desc = request.getParameter("descrip");
       
        InputStream imgPer = null; 
        Part filePartP = request.getPart("imgP");
        if (filePartP != null) {
            System.out.println(filePartP.getName());
            System.out.println(filePartP.getSize());
            System.out.println(filePartP.getContentType());
            
            imgPer = filePartP.getInputStream();
        }
        InputStream imgCov = null; 
        Part filePartC = request.getPart("imgC");
        if (filePartC != null) {
            System.out.println(filePartC.getName());
            System.out.println(filePartC.getSize());
            System.out.println(filePartC.getContentType());
            
            imgCov = filePartC.getInputStream();
        }
        
        Consulta co = new Consulta();
        
      if(co.editarPer(iduser, desc, imgPer, imgCov)){
          response.sendRedirect("profile.jsp");
          
         }else{
            response.sendRedirect("profile.jsp");
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
