<%-- 
    Document   : atender
    Created on : 02-jul-2020, 19:23:10
    Author     : TheGixe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if(session.getAttribute("medico")!=null){ 
      %>
        
    <body>
     <center>
        
         <h2>hola</h2>
     </center>      
    </body>
    
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
