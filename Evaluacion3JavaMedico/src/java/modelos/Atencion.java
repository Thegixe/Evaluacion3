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
public class Atencion {    
    private String idAtencion; 
    private Paciente paciente; 
    private Medico medico; 
    private String fecha; 
    private String hora; 
    private String diagnostico;    
    private String receta;    
    private Conexion conexion;

    public Atencion() throws ClassNotFoundException, SQLException {
     conexion = new Conexion();
     paciente = new Paciente();
     medico = new Medico();
    }

    public Atencion(String idAtencion, Paciente paciente, Medico medico, String fecha, String hora, String diagnostico, String receta) throws ClassNotFoundException, SQLException {
        this.idAtencion = idAtencion;
        this.paciente = paciente;
        this.medico = medico;
        this.fecha = fecha;
        this.hora = hora;
        this.diagnostico = diagnostico;
        this.receta = receta;
        conexion = new Conexion();
    }

    public String getIdAtencion() {
        return idAtencion;
    }

    public void setIdAtencion(String idAtencion) {
        this.idAtencion = idAtencion;
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

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getReceta() {
        return receta;
    }

    public void setReceta(String receta) {
        this.receta = receta;
    }
    
    
    
    
    
    
    
    
    
    
}
