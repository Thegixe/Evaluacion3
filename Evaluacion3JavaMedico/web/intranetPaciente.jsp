<%-- 
    Document   : intranetPaciente
    Created on : 27-jun-2020, 18:30:18
    Author     : TheGixe
--%>

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
        
        <h2>Registrar Jugador</h2>
        <form action ="ControlJugador" method="post">
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
                    <td><input type="text" name="idPaciente" value=""/></td>
                    
                    <% try{
                    Posicion posicion = new Posicion(); 
                    ArrayList<Posicion> posiciones = posicion.obtenerPosiciones(); 
                    %>
                <td>
                    <select name="idPosicion">
                        <% for(Posicion po:posiciones){%>
                        <option value="<%=po.getIdPosicion()%>"> 
                            <%= po.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                    
                    <td><input type="text" name="fecha" value=""/></td>                    
                    <td><input type="text" name="hora" value=""/></td>                    
                    <td><input type="text" name="causa" value=""/></td>
                    
                    
                    <% try{
                    Posicion posicion = new Posicion(); 
                    ArrayList<Posicion> posiciones = posicion.obtenerPosiciones(); 
                    %>
                <td>
                    <select name="idPosicion">
                        <% for(Posicion po:posiciones){%>
                        <option value="<%=po.getIdPosicion()%>"> 
                            <%= po.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                            
                    <td><input type="text" name="sueldo" value=""/></td>        
                            
                    
                    <% try{
                    Equipo equipo = new Equipo(); 
                    ArrayList<Equipo> equipos = equipo.obtenerEquipos(); 
                    %>
                <td>
                    <select name="idEquipo">
                        <% for(Equipo eq:equipos){%>
                        <option value="<%=eq.getIdEquipo()%>"> 
                            <%= eq.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                            
                    
                    
                            
                    <td><input type="submit" value="Agregar" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="accion" value="1"/>
        </form>
        <a href="intranet.jsp">Volver</a>
        
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
    </center>
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
