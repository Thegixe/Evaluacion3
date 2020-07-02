<%-- 
    Document   : aceptar
    Created on : 02-jul-2020, 19:03:15
    Author     : TheGixe
--%>

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
     <center>
        
         <h1>¿Desea aceptar esta reserva?</h1>
         <form action="ControlReserva" method="post">
         <% String idReserva = request.getParameter("idReserva");
               Reserva r = new Reserva().obtenerReserva(idReserva);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idReserva" value="<%= r.getIdReserva()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Paciente</td>
                        <td><input type="text" name="idPaciente" value="<%= r.getPaciente().getNombre()+" "+r.getPaciente().getApellido()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Medico</td>
                        <td><input type="text" name="idMedico" value="<%= r.getMedico().getNombre()+" "+r.getMedico().getApellido()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Fecha</td>
                        <td><input type="text" name="fecha" value="<%= r.getFecha()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Hora</td>
                        <td><input type="text" name="hora" value="<%= r.getHora()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Causa</td>
                        <td><input type="text" name="causa" value="<%= r.getCausa()%>" readonly="true" /></td>
                    </tr>
                    
                    
                    <tr>
                        <td><a href="intranetMedico.jsp">Volver</a></td>
                        <td><input type="submit" value="Aceptar Reserva"/></td>
                    </tr>
                    <input type="hidden" name="accion" value="2"/>
                </table> 
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
        </form>
     </center>
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
