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
    "contraseña",
    "permisos",
    "id_persona"
            };

    public int n=5;
    public String valor[];
    
    public CUsuario(){        
        valor=new String[n];
    }
    public CUsuario(String Valor[]){
        this.valor=Valor;
    }
    
}
