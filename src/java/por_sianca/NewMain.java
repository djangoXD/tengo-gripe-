/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package por_sianca;

import clases.CCategoria;
import clases.CArticulo;
import clases.CVendedores;
import java.util.ArrayList;
import modelo.DCategoria;
import modelo.DArticulo;
import modelo.DVendedores;

/**
 *
 * @author WARREN
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
                ArrayList <CVendedores> cv=new DVendedores().consultar();
                for(CVendedores x:cv)System.out.println(x);
    }
    
}

