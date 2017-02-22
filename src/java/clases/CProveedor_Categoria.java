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
public class CProveedor_Categoria {
    public String clave[]={
    "_id",
    "idproveedor",
    "idcategoria"
            };

    public int n=3;
    public String valor[];
    
    public CProveedor_Categoria(){        
        valor=new String[n];
    }
    public CProveedor_Categoria(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return "P_C: "+valor[1]+" "+valor[2];
    }
}
