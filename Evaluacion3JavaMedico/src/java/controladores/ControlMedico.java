/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Medico;

/**
 *
 * @author TheGixe
 */
@WebServlet(name = "ControlMedico", urlPatterns = {"/ControlMedico"})
public class ControlMedico extends HttpServlet {

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
        
        try{
        String accion = request.getParameter("accion");
        
        switch(accion){
            case "1": ingresar(request,response);
            break;
            case "2": iniciarSesion(request,response);
            break;
        }
        
        
        }
        catch(Exception e){
            response.sendRedirect("registro.jsp?mensaje="+e.getMessage());
        }         
        
    }
    
    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException{
        String usuario = request.getParameter("usuario").trim();
        String password = request.getParameter("password").trim();
        if(usuario.isEmpty()||password.isEmpty()){
            response.sendRedirect("sesionM.jsp?mensaje=Complete todos los campos");
        }else{
            Medico m = new Medico();
            m.setUsuario(usuario);
            m.setPassword(password);
            if(m.iniciarSesion()){
                HttpSession sesion = request.getSession();
                sesion.setAttribute("medico", m);
                response.sendRedirect("intranetMedico.jsp");
            }else{
                response.sendRedirect("sesionM.jsp?mensaje=credenciales incorrectas");
            }
    }
    }
    
    private void ingresar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException{
        String usuario = request.getParameter("usuario").trim();        
        String password = request.getParameter("password").trim();
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();        
        String especialidad = request.getParameter("especialidad").trim();
        if(usuario.isEmpty()||nombre.isEmpty()||apellido.isEmpty()||password.isEmpty()||especialidad.isEmpty()){
            response.sendRedirect("registroMedico.jsp?mensaje=Complete todos los campos");
        }else{
        Medico m = new Medico(usuario,password,nombre,apellido,especialidad);
        response.sendRedirect("registroMedico.jsp?mensaje="+m.registrar());
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
