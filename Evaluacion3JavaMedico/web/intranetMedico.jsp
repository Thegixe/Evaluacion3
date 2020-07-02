<%-- 
    Document   : intranetMedico
    Created on : 27-jun-2020, 19:24:19
    Author     : TheGixe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Reserva"%>
<%@page import="modelos.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>intranet medico</title>
    </head>
    <% if(session.getAttribute("medico")!=null){ 
        Medico m =(Medico) session.getAttribute("medico");%>
    <body>
        
        <h1>Bienvenido <%= m.getNombre()+" "+m.getApellido() %></h1>
        
        
        
        
        <h2>Reservas realizadas</h2>
        
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
                
                <% ArrayList<Reserva> reservas = new Reserva().obtenerReservasXIdPaciente(m.getUsuario());
               
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
               
                <td><a href="aceptarR?idReserva=<%=r.getIdReserva()%>">
                        <input type="button" value="Aceptar" />
                    </a>
                        </td>
                        <td>
                    <a href="rechazarR?idReserva=<%=r.getIdReserva()%>">
                        <input type="button" value="Rechazar" />
                    </a>
                </td>
                
            </tr>
            <% } %>
            
            </table>                 
        
        
        
        
        
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
