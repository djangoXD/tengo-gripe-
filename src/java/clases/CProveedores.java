/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Dennys
 */
public class CProveedores {
    public String clave[]={
    "_id",
    "ruc",
    "razon_social",
    "descripcion",
    "id_persona"
            };

    public int n=5;
    public String valor[];
    
    public CProveedores(){        
        valor=new String[n];
    }
    public CProveedores(String Valor[]){
        this.valor=Valor;
    }
    
}
