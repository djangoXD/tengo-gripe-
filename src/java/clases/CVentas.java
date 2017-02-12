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
public class CVentas {
    public String clave[]={
    "_id",
    "fecha_hora",
    "tipo",
    "id_vendedor",
    "id_personal_reparto",
    "id_cliente",
            };

    public int n=6;
    public String valor[];
    
    public CVentas(){        
        valor=new String[n];
    }
    public CVentas(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[0]+" "+valor[1];
    }

}
