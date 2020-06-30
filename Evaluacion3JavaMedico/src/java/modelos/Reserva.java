/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.SQLException;

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

    

    
    
    
    
    
    
    
    
    
    
}
