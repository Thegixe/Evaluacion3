<%-- 
    Document   : intranetPaciente
    Created on : 27-jun-2020, 18:30:18
    Author     : TheGixe
--%>

<%@page import="modelos.Reserva"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Medico"%>
<%@page import="modelos.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if(session.getAttribute("paciente")!=null){ 
        Paciente p =(Paciente) session.getAttribute("paciente");%>
    <body>
    <center>
        
        <h1>Bienvenido <%= p.getNombre()+" "+p.getApellido() %></h1>
        
        <h2>Reservar hora</h2>
        <form action ="ControlReserva" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Paciente</td>
                    <td>Medico</td>
                    <td>Fecha</td>
                    <td>Hora</td>
                    <td>Causa</td>
                    
                </tr>
                <tr>
                    <td><input type="text" name="idReserva" value=""/></td> 
                    <td><select name="idPaciente">
                            <option value="<%= p.getUsuario()%>">
                            <%= p.getNombre()+" "+p.getApellido() %>
                            </option>
                        </select>
                    </td>
                    
                    <% try{
                    Medico medico = new Medico(); 
                    ArrayList<Medico> medicos = medico.obtenerMedicos(); 
                    %>
                <td>
                    <select name="idMedico">
                        <% for(Medico me:medicos){%>
                        <option value="<%=me.getUsuario()%>"> 
                            <%= me.getNombre()+" "+ me.getApellido()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                    
                    <td><input type="date" name="fecha" value=""/></td>                    
                    <td><input type="time" name="hora" value=""/></td>                    
                    <td><input type="text" name="causa" value=""/></td>   
                    
                    <td><input type="submit" value="Agregar reserva" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="accion" value="1"/>
        </form>
        <table> 
            <tr>
                <td>
                    <a href="SalirP">
                        <input type="button" value="Cerrar Sesion"/>
                    </a>
                </td>
            </tr>
        </table>  
                            
        <br>
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
                
                <% ArrayList<Reserva> reservas = new Reserva().obtenerReservasXIdPaciente(p.getUsuario());
               
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
               
            </tr>
            <% } %>
            
            </table>                 
        
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
    </center>
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
