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
        CImagen g=new CImagen();
        DImagen gd=new DImagen();
        g.nombre=null;

        System.out.println(        gd.existe("454d"));
    }
    
}

