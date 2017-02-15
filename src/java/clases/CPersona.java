/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author WARREN
 */
   
public class CPersona {
    String id;
    String nombre;
    String apellidos;
    String fecha_nacimiento;
    String direccion;
    String tipo_documento;
    String nro_documento;
    String email;
    String sexo;
    // <editor-fold desc="Constuctores">  
    public CPersona() {
    }

    public CPersona(String id, String nombre, String apellidos, String fecha_nacimiento, String direccion, String tipo_documento, String nro_documento, String email, String sexo) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fecha_nacimiento = fecha_nacimiento;
        this.direccion = direccion;
        this.tipo_documento = tipo_documento;
        this.nro_documento = nro_documento;
        this.email = email;
        this.sexo = sexo;
    }

    

    public String getNombre() {
        return nombre;
    }
     // </editor-fold>  
    // <editor-fold desc="get-set"> 

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getApellidos() {
        return apellidos;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public String getNro_documento() {
        return nro_documento;
    }

    public String getEmail() {
        return email;
    }

    public String getSexo() {
        return sexo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public void setNro_documento(String nro_documento) {
        this.nro_documento = nro_documento;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    // </editor-fold>  

    @Override
    public String toString() {
        return "CPersona{" + "id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fecha_nacimiento=" + fecha_nacimiento + ", direccion=" + direccion + ", tipo_documento=" + tipo_documento + ", nro_documento=" + nro_documento + ", email=" + email + ", sexo=" + sexo + '}';
    }
}
