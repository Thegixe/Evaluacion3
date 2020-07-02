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
public class Reserva {
    
    private String idReserva; 
    private Paciente paciente; 
    private Medico medico; 
    private String fecha; 
    private String hora; 
    private String causa;    
    private Estado estado;    
    private Conexion conexion;

    public Reserva() throws ClassNotFoundException, SQLException {        
     conexion = new Conexion();
     paciente = new Paciente();
     medico = new Medico();
     estado = new Estado();
    }

    public Reserva(String idReserva, Paciente paciente, Medico medico, String fecha, String hora, String causa, Estado estado) throws ClassNotFoundException, SQLException {
        this.idReserva = idReserva;
        this.paciente = paciente;
        this.medico = medico;
        this.fecha = fecha;
        this.hora = hora;
        this.causa = causa;
        this.estado = estado;
        conexion = new Conexion();
    }

    public String getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(String idReserva) {
        this.idReserva = idReserva;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getCausa() {
        return causa;
    }

    public void setCausa(String causa) {
        this.causa = causa;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public String registrar() throws SQLException{
        if(validarReserva()){
            return "Id ya existe";
        }else{
        String sentencia = "insert into reserva values('"+idReserva+"','"+paciente.getUsuario()+"','"+medico.getUsuario()+"','"+fecha+"','"+hora+"','"+causa+"','"+estado.getIdEstado()+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Reserva registrada";
        }else{
            return "No se pudo registrar la Reserva";
        }
        }
    }
    
    public boolean validarReserva() throws SQLException{
        String sentencia = "select * from reserva where idReserva='"+idReserva+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Reserva> obtenerReservasXIdPaciente(String idPaciente) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from reserva where idPaciente='"+idPaciente+"'";
        ArrayList<Reserva> reservas = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            reservas.add(new Reserva(rs.getString("idReserva"),paciente.obtenerPaciente(rs.getString("idPaciente")),medico.obtenerMedico(rs.getString("idMedico")),rs.getString("fecha"),
                    rs.getString("hora"),rs.getString("causa"),estado.obtenerEstado(rs.getString("idEstado"))));
        }
        return reservas;
    }
    
    public ArrayList<Reserva> obtenerReservasXIdMedico(String idMedico) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from reserva where idMedico='"+idMedico+"'";
        ArrayList<Reserva> reservas = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            reservas.add(new Reserva(rs.getString("idReserva"),paciente.obtenerPaciente(rs.getString("idPaciente")),medico.obtenerMedico(rs.getString("idMedico")),rs.getString("fecha"),
                    rs.getString("hora"),rs.getString("causa"),estado.obtenerEstado(rs.getString("idEstado"))));
        }
        return reservas;
    }
    
    
    public ArrayList<Reserva> obtenerReservas() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from reserva order by idReserva";
        ArrayList<Reserva> reservas = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            reservas.add(new Reserva(rs.getString("idReserva"),paciente.obtenerPaciente(rs.getString("idPaciente")),medico.obtenerMedico(rs.getString("idMedico")),rs.getString("fecha"),
                    rs.getString("hora"),rs.getString("causa"),estado.obtenerEstado(rs.getString("idEstado"))));
        }
        return reservas;
    }
    
    public Reserva obtenerReserva(String idReserva) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from reserva where idReserva='"+idReserva+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Reserva r = new Reserva();
        if(rs.next()){
            r.setIdReserva(rs.getString("idReserva"));
            r.setPaciente(paciente.obtenerPaciente(rs.getString("idPaciente")));
            r.setMedico(medico.obtenerMedico(rs.getString("idMedico")));
            r.setFecha(rs.getString("fecha"));
            r.setHora(rs.getString("hora"));
            r.setCausa(rs.getString("causa"));
            r.setEstado(estado.obtenerEstado(rs.getString("idEstado")));
                     
        }
        return r;
    }
    
    
    public String aceptar() throws SQLException{
        if(validarReserva()){
            String sentencia = "update reserva set idEstado = '"+estado.getIdEstado()+"'"
                    
                    + "where idReserva = '"+idReserva+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Reserva aceptada";
        }else{
            return "No se pudo aceptar la reserva";
        }
        }else{
            return "La reserva no existe";
        }
    }

    
    
    
    
    
    
    
    
    
    
}
