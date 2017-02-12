/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import modelo.DPersonas;

/**
 *
 * @author WARREN
 */
public class CAdministradores {
        public String clave[]={
    "_id",
    "estado",
    "id_persona",
        };

    public int n=3;
    public String valor[];
    
    public CAdministradores(){        
        valor=new String[n];
    }
    public CAdministradores(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        CPersonas x=new DPersonas().buscar_id(valor[2]);
        return valor[1]+" "+x;
    }
    
}
