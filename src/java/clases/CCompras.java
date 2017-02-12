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
public class CCompras {
    public String clave[]={
    "_id",
    "fecha_compra",
    "fecha_entrega",
    "id_proveedor",
    "id_administrador"
            };

    public int n=5;
    public String valor[];
    
    public CCompras(){        
        valor=new String[n];
    }
    public CCompras(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[0];
    }
    
}
