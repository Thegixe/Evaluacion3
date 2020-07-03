<%-- 
    Document   : atenderPaciente
    Created on : 02-jul-2020, 19:42:29
    Author     : TheGixe
--%>

<%@page import="modelos.Atencion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Reserva"%>
<%@page import="modelos.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <% if(session.getAttribute("medico")!=null){ 
        Medico m =(Medico) session.getAttribute("medico");%>
    <body>
    <center>
        
        <h2>Reservas</h2>
        
        <table border="1"  >
                <tr boder ="2">
                    <td>ID</td>
                    <td>Paciente</td>
                    <td>Medico</td>
                    <td>Fecha</td>
                    <td>Hora</td>
                    <td>Causa</td>
                    <td>Estado de Reserva</td>
                    
                </tr>
                
                <% ArrayList<Reserva> reservas = new Reserva().obtenerReservasXIdEstado(m.getUsuario());
               
            for(Reserva r:reservas){
            %>
            <tr border="1">
                <td><%= r.getIdReserva()%></td>
                <td><%= r.getPaciente().getNombre()+" "+r.getPaciente().getApellido()%></td>
                <td><%= r.getMedico().getNombre()+" "+r.getMedico().getApellido()%></td>
                <td><%= r.getFecha()%></td>
                <td><%= r.getHora()%></td>
                <td><%= r.getCausa()%></td>
                <td><%= r.getEstado().getDescripcion() %></td>
                
                <td>
                    <a href="atender.jsp?idReserva=<%= r.getIdReserva()%>">
                        <input type="button" value="Atender"/>
                    </a>
                </td>
                
                 </tr>
            <% } %>
            
            </table> 
            
            <br>
            <br>
            <h2>Atenciones realizadas</h2>
        
        <table border="1"  >
                <tr boder ="2">
                    <td>ID</td>
                    <td>Paciente</td>
                    <td>Medico</td>
                    <td>Fecha</td>
                    <td>Hora</td>
                    <td>Diagnostico</td>
                    <td>Receta</td>
                    
                </tr>
                
                <% ArrayList<Atencion> atenciones = new Atencion().obtenerAtencionesXIdMedico(m.getUsuario());
               
            for(Atencion a:atenciones){
            %>
            <tr border="1">
                <td><%= a.getIdAtencion()%></td>
                <td><%= a.getPaciente().getNombre()+" "+a.getPaciente().getApellido()%></td>
                <td><%= a.getMedico().getNombre()+" "+a.getMedico().getApellido()%></td>
                <td><%= a.getFecha()%></td>
                <td><%= a.getHora()%></td>
                <td><%= a.getDiagnostico()%></td>
                <td><%= a.getReceta()%></td>
                
                 </tr>
            <% } %>            
            </table> 
            
            <br>
            
        <table> 
            <tr>
                <td>
                    <a href="intranetMedico.jsp">
                        <input type="button" value="Volver"/>
                    </a>
                </td>
            </tr>
        </table>  
        
        
        
        
    </center>        
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
    
</html>
