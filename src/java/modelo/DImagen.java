/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import clases.CImagen;
import clases.CImagen;
import clases.CImagen;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSInputFile;
import java.util.ArrayList;
import java.util.List;
import org.bson.types.ObjectId;

/**
 *
 * @author Dennys
 */
public class DImagen implements Operaciones{
    private String database;
    private String tabla;
    private String tabla1;
    private String tabla2;
    private String url;
    
    public DImagen() {
        ADcon gg=new ADcon();
        this.database=gg.getDatabase();
        this.tabla="arcGrande";
        this.tabla1="files";
        this.tabla2="chunks";
        this.url=gg.getUrl();
    }

    
    @Override
    public String insertar(Object o) {
        
        CImagen x=(CImagen)o;       
        String res="";
        MongoClient mongo=null;
           try{
                mongo=new MongoClient(url,27017);
              }
            catch(Exception err){
                res=("Error");            
            }           
           DB db=mongo.getDB(database);                      
           
           GridFS fsArchivo = new GridFS(mongo.getDB(database), tabla);  //accediendo a coleccion "archivosGrandes"
            GridFSInputFile gfsarchivo = fsArchivo.createFile(x.imagen);  //creando archivo en BD desde INPUTSTREAM
            gfsarchivo.setFilename(x.nombre);  //colocando el nombre de archivo en base
            gfsarchivo.save();

            DBCollection coll=db.getCollection(tabla+"."+tabla1);            
            DBObject id1 = new BasicDBObject("filename",x.nombre );
            DBObject datos = new BasicDBObject("$set", new BasicDBObject("prioridad", x.prioridad).append("tipo", x.tipo));
            coll.update(id1,datos);

        return res;
       }

    @Override
    public String eliminar(Object o) {
        CImagen x=(CImagen)o;
        String res="";
        MongoClient mongo=null;
           try{
                mongo=new MongoClient(url,27017);
              }
            catch(Exception err){
               res=("Error");            
            }
                     
           DB db=mongo.getDB(database);           
           DBCollection coll=db.getCollection(tabla+"."+tabla1);
           
           BasicDBObject fin = new BasicDBObject();
           fin.put("filename",x.nombre);
           
            GridFS fsArchivo = new GridFS(db, "arcGrande");  //creando coleccion llamada archivosGrandes
            fsArchivo.remove(fin);
        return res;   
    }

    @Override
    public String modificar(Object o) {
        CImagen x=(CImagen)o;
        String res="";
        MongoClient mongo=null;
           try{
                mongo=new MongoClient(url,27017);
              }
            catch(Exception err){
                res=("Error");            
            }
                        
            DB db=mongo.getDB(database);
            DBCollection coll=db.getCollection("arcGrande.files");            
            DBObject id1 = new BasicDBObject("filename",new ObjectId(x.id) );
            DBObject datos = new BasicDBObject("$set", new BasicDBObject("prioridad", x.prioridad).
                    append("tipo", x.tipo)).
                    append("filename",x.nombre);
            coll.update(id1,datos);
           
        return res;
    }

    @Override
    public ArrayList consultar() {
        String res="";
        CImagen x=new CImagen();
        ArrayList datos=new ArrayList();
        MongoClient mongo=null;
        try{
             mongo=new MongoClient(url,27017);
           }
         catch(Exception err){
             res=("Error");            
         }

                DB db = mongo.getDB(database);
                GridFS fsArchivo = new GridFS(db, tabla);  //creando coleccion llamada archivosGrandes
                DBCursor miCursor = fsArchivo.getFileList();
             
                while (miCursor.hasNext()) {
                    x=new CImagen();
                    DBObject dato = miCursor.next();
                    x.id =  dato.get("_id")==null?"":dato.get("_id").toString();
                    x.nombre =  dato.get("filename")==null?"":dato.get("filename").toString();
                    x.tipo =  dato.get("tipo")==null?"":dato.get("tipo").toString();
                    x.prioridad =  dato.get("prioridad")==null?"":dato.get("prioridad").toString();
                    datos.add(x);                    
                }

        return datos;
      }
    public boolean existe(String filename){
            String res="";
        CImagen x=new CImagen();
        ArrayList datos=new ArrayList();
        MongoClient mongo=null;
        try{
             mongo=new MongoClient(url,27017);
           }
         catch(Exception err){
             res=("Error");            
         }
        DB db=mongo.getDB(database);
        DBCollection coll=db.getCollection(tabla+"."+tabla1);
        BasicDBObject dato = new BasicDBObject();
        DBObject id1 = new BasicDBObject("filename",filename );

        DBCursor cursor=coll.find(id1);

        int k=0;
        try{
            while(cursor.hasNext()){k++;cursor.next();}
            
        } finally{
            cursor.close();
        }                 
 

        if(k==0)return false;
        else
            return true;
    }
    @Override
    public List<?> filtrar(String campo, String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
