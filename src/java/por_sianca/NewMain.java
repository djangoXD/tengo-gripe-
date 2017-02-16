/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package por_sianca;

import clases.CCategoria;
import clases.CArticulo;
import clases.CCompras;
import clases.CCompras_detalle;
import clases.CImagen;
import clases.CProveedores;
import clases.CUsuario;
import clases.CVendedores;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import modelo.DCategoria;
import modelo.DArticulo;
import modelo.DCompras;
import modelo.DImagen;
import modelo.DProveedores;
import modelo.DUsuario;
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
        String fecha[]={"Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado"};
        String medicos[]={"11186321",
"12586321",
"34586321",
"74586321",
"22586321",
"55586321",
"33586321",
"77346321",
"12386321",
"71052032",
"74586345",};
        for(int i=0;i<7;i++){
            for(int j=0;j<48;j++){
                for(int k=0;k<medicos.length;k++){
                    System.out.println("('"
                            + medicos[k]
                            + fecha[i].substring(0,2)
                            +String.format("%02d", j)
                            + "','"
                                    + j
                                    + "','"
                                    + fecha[i]
                                    + "','"
                                            + medicos[k]
                                            + "','"
                                            +Math.round(  Math.random())
                                            + "'"
                                            + "),");
                }
            }
        }    
        System.out.println("hola mundo");
    }
    
}

