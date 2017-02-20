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
public class CCategoria {
    public String clave[]={
    "_id",
    "nombre",
    "descripcion"
            };

    public int n=3;
    public String valor[];
    
    public CCategoria(){        
        valor=new String[n];
    }
    public CCategoria(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[1];
    }

    
}
