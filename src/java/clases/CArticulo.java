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
    "stok",
    "material",
    "categoria"
            };

    public int n=7;
    public String valor[];
    
    public CArticulo(){        
        valor=new String[n];
    }
    public CArticulo(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[0]+" "+valor[1]+" "+valor[2]+" "+valor[3]+" "+valor[4]+" "+valor[5];
    }

}
