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
    "id_usuario",
    "id_entidad"
            };

    public int n=10;
    public String valor[];
    
    public CPersonas(){     
        
        valor=new String[n];
    }
    public CPersonas(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[2]+" "+valor[3]+" "+valor[4];
    }
    
}
