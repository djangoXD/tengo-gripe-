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
public class CCompras_detalle {
    public String clave[]={
    "_id",
    "cantidad",
    "costo",
    "id_compras",
    "id_articulo"
            };

    public int n=5;
    public String valor[];
    
    public CCompras_detalle(){        
        valor=new String[n];
    }
    public CCompras_detalle(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[1]+" "+valor[2];
    }

    
}
