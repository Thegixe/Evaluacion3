<%-- 
    Document   : registroPaciente
    Created on : 27-jun-2020, 17:34:25
    Author     : TheGixe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistroPaciente</title>
    </head>
    <body><center>
        <h1>Registro de Paciente</h1>
        <form action="ControlPaciente" method="post">
            
                <table style="border: 1; ">
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="usuario" /></td>
                    </tr>                    
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" /></td>
                    </tr>
                    <tr>
                        <td>Apellido</td>
                        <td><input type="text" name="apellido" /></td>
                    </tr>
                    <tr>
                        <td>Rut</td>
                        <td><input type="text" name="rut" /></td>
                    </tr>
                    <tr>
                        <td><a href="index.jsp">Volver</a></td>
                        <td><input type="submit" value="Registrar"/></td>
                    </tr>
                    <input type="hidden" name="accion" value="1"/>
                </table>
           <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
        </form>
         </center>
    </body>
</html>