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
public class CArticulo {
    public String clave[]={
    "_id",
    "nombre",
    "descripcion",
    "costo",
    "imagen"
            };

    public int n=5;
    public String valor[];
    
    public CArticulo(){        
        valor=new String[5];
    }
    public CArticulo(String Valor[]){
        this.valor=Valor;
    }

}
