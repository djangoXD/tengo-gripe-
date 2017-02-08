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
public class CPersonal_reparto {
        public String clave[]={
    "_id",
    "estado",
    "id_persona",
        };

    public int n=3;
    public String valor[];
    
    public CPersonal_reparto(){        
        valor=new String[n];
    }
    public CPersonal_reparto(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return (new DPersonas().buscar_id(valor[n-1])).toString();
    }
    
}
