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
public class CContacto {
    public String clave[]={
    "_id",
    "tipo_contacto",
    "numero",
    "id_persona"   
            };

    public int n=4;
    public String valor[];
    
    public CContacto(){        
        valor=new String[n];
    }
    public CContacto(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[1]+" "+valor[2];
    }

    
}
