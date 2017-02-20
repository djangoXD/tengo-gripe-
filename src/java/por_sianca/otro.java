/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package por_sianca;

import clases.CAdministradores;
import clases.CPersonas;
import clases.CProveedores;
import clases.CUsuario;
import java.util.ArrayList;
import modelo.DAdministradores;
import modelo.DCliente;
import modelo.DContacto;
import modelo.DPersonas;
import modelo.DProveedores;
import modelo.DUsuario;
import modelo.DVendedores;
/**
 *
 * @author WARREN
 */
public class otro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
                String val="58a9ba3bba2c565788bf465a 58a9ba27ba2c565788bf4641";
                String pro_user[]=val.split(" ");
                
                CUsuario usu_admi=new DUsuario().buscar_id(pro_user[1]);
                CPersonas per_admi=(CPersonas) new DPersonas().existe(usu_admi.valor[0],8).get(0);            

                CProveedores prov=(CProveedores) new DProveedores().buscar_id(pro_user[0]);    
                CPersonas per_prov=(CPersonas) new DPersonas().existe(prov.valor[0],9).get(0);            
    
    }

                
    
}
