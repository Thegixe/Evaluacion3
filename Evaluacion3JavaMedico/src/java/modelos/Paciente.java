/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Paciente {
    
    private String usuario;
    private String password;
    private String nombre;
    private String apellido;
    private String rut;
    private Conexion conexion;

    public Paciente() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Paciente(String usuario, String password, String nombre, String apellido, String rut) throws ClassNotFoundException, SQLException {
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
        this.rut = rut;
        conexion = new Conexion();
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String especialidad) {
        this.rut = rut;
    }
    
    public String registrar() throws SQLException{
        if(validarPaciente()){
            return "El paciente ya existe";
        }else{
        String sentencia = "insert into paciente values('"+usuario+"','"+password+"',"
                + "'"+nombre+"','"+apellido+"','"+rut+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Paciente registrado";
        }else{
            return "No se pudo registrar el paciente";
        }
        }
    }
    public boolean validarPaciente() throws SQLException{
        String sentencia = "select * from paciente where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    public boolean iniciarSesion() throws SQLException{
        String sentencia = "select * from paciente where usuario ='"+usuario+"' "
                + " and password = '"+password+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        boolean respuesta = false;
        if(rs.next()){
            respuesta = true;
            setNombre(rs.getString("nombre"));
            setApellido(rs.getString("apellido"));
            setRut(rs.getString("rut"));
        }
        return respuesta;
    }
    
    public Paciente obtenerPaciente(String usuario) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from paciente where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Paciente p = new Paciente();
        if(rs.next()){
            p.setUsuario(rs.getString("usuario"));
            p.setPassword(rs.getString("password"));
            p.setNombre(rs.getString("nombre"));
            p.setApellido(rs.getString("apellido"));
            p.setRut(rs.getString("rut"));          
        }
        return p;
    }
    
    public ArrayList<Paciente> obtenerPacientes() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from paciente order by usuario";
        ArrayList<Paciente> paciente = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            paciente.add(new Paciente(rs.getString("usuario"),rs.getString("password"),rs.getString("nombre"),
            rs.getString("apellido"),rs.getString("rut")));
        }
        return paciente;
    }
    
}
