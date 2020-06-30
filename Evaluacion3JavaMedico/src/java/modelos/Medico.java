/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author TheGixe
 */
public class Medico {
    
    private String usuario;
    private String password;
    private String nombre;
    private String apellido;
    private String especialidad;
    private Conexion conexion;

    public Medico() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Medico(String usuario, String password, String nombre, String apellido, String especialidad) throws ClassNotFoundException, SQLException {
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
        this.especialidad = especialidad;
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

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public String registrar() throws SQLException{
        if(validarMedico()){
            return "El usuario ya existe";
        }else{
        String sentencia = "insert into medico values('"+usuario+"','"+password+"',"
                + "'"+nombre+"','"+apellido+"','"+especialidad+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "medico registrado";
        }else{
            return "No se pudo registrar el medico";
        }
        }
    }
    public boolean validarMedico() throws SQLException{
        String sentencia = "select * from medico where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    public boolean iniciarSesion() throws SQLException{
        String sentencia = "select * from medico where usuario ='"+usuario+"' "
                + " and password = '"+password+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        boolean respuesta = false;
        if(rs.next()){
            respuesta = true;
            setNombre(rs.getString("nombre"));
            setApellido(rs.getString("apellido"));
            setEspecialidad(rs.getString("especialidad"));
        }
        return respuesta;
    }
    
    public Medico obtenerMedico(String usuario) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from medico where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Medico m = new Medico();
        if(rs.next()){
            m.setUsuario(rs.getString("usuario"));
            m.setPassword(rs.getString("password"));
            m.setNombre(rs.getString("nombre"));
            m.setApellido(rs.getString("apellido"));
            m.setEspecialidad(rs.getString("especialidad"));          
        }
        return m;
    }
    
     public ArrayList<Medico> obtenerMedicos() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from medico order by usuario";
        ArrayList<Medico> medico = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            medico.add(new Medico(rs.getString("usuario"),rs.getString("password"),rs.getString("nombre"),
            rs.getString("apellido"),rs.getString("especialidad")));
        }
        return medico;
    }
    
    
    
}
