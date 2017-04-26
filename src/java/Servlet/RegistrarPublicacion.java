/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.util.*;
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
public class RegistrarPublicacion extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
       
        Calendar fecha = new GregorianCalendar();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH) + 1;
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        
        String hoy =  año + "/" + (mes) + "/" + dia;
        
        String hasht = request.getParameter("jej");
        String hasht2 =  hasht +"&";
        
        String titu = null;
        String body = request.getParameter("cuerpo");
        String type = null;
        InputStream imgPst = null; 
        Part filePartP = request.getPart("imgPost");
        if (filePartP != null) {
            System.out.println(filePartP.getName());
            System.out.println(filePartP.getSize());
            System.out.println(filePartP.getContentType());
            
            imgPst = filePartP.getInputStream();
        }
        //String vide = request.getParameter("usuario");
        
        String idusuario = request.getParameter("idu");
        Integer iduser = Integer.parseInt(idusuario.trim());  
          
        Consulta co = new Consulta();
        
      if(co.registrarPo(hoy,titu,body,type,imgPst,null,iduser)){
          response.sendRedirect("profile.jsp");
         }else{
            response.sendRedirect("home.jsp");
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
