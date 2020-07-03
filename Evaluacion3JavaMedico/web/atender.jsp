<%-- 
    Document   : atender
    Created on : 02-jul-2020, 19:23:10
    Author     : TheGixe
--%>

<%@page import="modelos.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if(session.getAttribute("medico")!=null){ 
        String idReserva = request.getParameter("idReserva").trim();
      Reserva r = new Reserva().obtenerReserva(idReserva);
      %>
        
    <body>
     <center>
        
         <h1> Registrar Atencion</h1>
         <form action ="ControlAtencion" method="post">
             
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Paciente</td>
                    <td>Causa</td>
                    <td>Medico</td>
                    <td>Fecha</td>
                    <td>Hora</td>
                    <td>Diagnostico</td>
                    <td>Receta</td>
                    
                </tr>
                <tr>
                
                    <td><input type="text" name="idAtencion" value=""/></td> 
                    
                     <td><select name="idPaciente">
                            <option value="<%= r.getPaciente().getUsuario()%>">
                            <%=r.getPaciente().getNombre()+" "+r.getPaciente().getApellido()%>
                            </option>
                        </select>
                    </td>
                    
                    <td><input type="text" name="causa" value="<%= r.getCausa()%>" readonly="true"/></td>  
                    
                    <td><select name="idMedico">
                            <option value="<%= r.getMedico().getUsuario()%>">
                            <%=r.getMedico().getNombre()+" "+r.getMedico().getApellido()%>
                            </option>
                        </select>
                    </td>
                    
                    <td><input type="date" name="fecha" value="<%= r.getFecha()%>" readonly="true"/></td>                    
                    <td><input type="time" name="hora" value="<%= r.getHora()%>" readonly="true"/></td>                    
                    <td><input type="text" name="diagnostico" value=""/></td>                   
                    <td><input type="text" name="receta" value=""/></td>   
                    
                    <td><input type="submit" value="Registrar atención" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="idReserva" value="<%= r.getIdReserva()%>" />        
            <input type="hidden" name="accion" value="1"/>
        </form>
         
        <br>
         <table> 
            <tr>
                <td>
                    <a href="atenderPaciente.jsp">
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
