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
public class CUsuario {
public String clave[]={
    "_id",
    "usuario",
    "contrasena",
    "permisos"
            };

    public int n=4;
    public String valor[];

    public CUsuario(){
        valor=new String[n];
    }
    public CUsuario(String Valor[]){
        this.valor=Valor;
    }

    @Override
    public String toString() {
        return valor[1]+" "+valor[3];
    }


}
