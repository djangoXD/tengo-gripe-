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
public class CDirecciones {
    public String clave[]={
    "_id",
    "ubigeo",
    "direccion",
    "referencia",
    "codigo_postal",
    "id_persona"
            };
    public int n=6;
        public String valor[];
    
    public CDirecciones(){        
        valor=new String[n];
    }
    public CDirecciones(String Valor[]){
        this.valor=Valor;
    }
    
}
