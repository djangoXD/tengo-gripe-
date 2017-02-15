/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import modelo.DPersona;
import modelo.DPersonas;

/**
 *
 * @author WARREN
 */
public class CVendedores {
        public String clave[]={
    "_id",
    "estado"
        };

    public int n=2;
    public String valor[];

    public CVendedores(){
        valor=new String[n];
    }
    public CVendedores(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return (new DPersonas().buscar_id(valor[n-1])).toString();
    }

}
