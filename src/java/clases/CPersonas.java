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
public class CPersonas {
    public String clave[]={
    "_id",
    "tipo_documento",
    "nro_documento",
    "nombres",
    "apellidos",
    "fecha_nacimiento",
    "sexo",
    "email",
    "foto"
            };

    public int n=9;
    public String valor[];
    
    public CPersonas(){        
        valor=new String[n];
    }
    public CPersonas(String Valor[]){
        this.valor=Valor;
    }

}
