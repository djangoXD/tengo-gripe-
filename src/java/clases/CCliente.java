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
public class CCliente {
        public String clave[]={
    "_id",
    "estado"
        };

    public int n=2;
    public String valor[];

    public CCliente(){
        valor=new String[n];
    }
    public CCliente(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[0]+" "+valor[1];
    }
}
