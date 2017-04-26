/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author black
 */
public class LeerImagenCov extends HttpServlet {

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
        
        //PrintWriter out = response.getWriter();
        
         Conexion conn =  new Conexion();
         ResultSet rs = null;
         //PreparedStatement stmt = null;
         CallableStatement proc = null;
        
         String imagenPerfil = request.getParameter("idUser");
         Integer imgPerfil = Integer.parseInt(imagenPerfil.trim());
         
        try {
 
            String sql = " {call readImgC(?)}  ";
            proc = conn.getCon().prepareCall(sql);
            proc.setInt(1, imgPerfil);
            rs = proc.executeQuery();
            
            if(rs.next()){
                response.setContentType("image/jpeg");
                byte[] content = rs.getBytes("profcov");
                response.getOutputStream().write(content);
            }           
            
        } catch (Exception ex) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println(ex.toString());
        } finally {
            if (conn.getCon() != null) {
                try {
                    conn.getCon().close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
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
