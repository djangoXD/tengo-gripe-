/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import clases.CPersonal_reparto;
import clases.CPersonal_reparto;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;
import java.util.List;
import org.bson.types.ObjectId;

/**
 *
 * @author WARREN
 */
public class DPersonal_reparto implements Operaciones{
    private String database;
    private String tabla;
    private String url;

    public DPersonal_reparto() {
              ADcon gg=new ADcon();
        this.database=gg.getDatabase();
        this.tabla=gg.getTabla();
        this.url=gg.getUrl();
  }

    public DPersonal_reparto(String database, String tabla, String url) {
        this.database = database;
        this.tabla = "personal_reparto";
        this.url = url;
    }
   
    
    @Override
    public String insertar(Object o) {
        
        CPersonal_reparto x=(CPersonal_reparto)o;       
        String res="";
        MongoClient mongo=null;
           try{
                mongo=new MongoClient(url,27017);
              }
            catch(Exception err){
                res=("Error");            
            }           
           DB db=mongo.getDB(database);                      
           DBCollection coll;
           coll=db.getCollection(tabla);            
           BasicDBObject datos = new BasicDBObject();           
           for(int i=1  ;i<x.n;i++){
               datos.append(x.clave[i], x.valor[i]);
           }          
           coll.insert(datos);      
        return res;
       }

    @Override
    public String eliminar(Object o) {
        CPersonal_reparto x=(CPersonal_reparto)o;
        String res="";
        MongoClient mongo=null;
           try{
                mongo=new MongoClient(url,27017);
              }
            catch(Exception err){
               res=("Error");            
            }
           
           
           DB db=mongo.getDB(database);           
           DBCollection coll=db.getCollection(tabla);

           BasicDBObject fin = new BasicDBObject();
           fin.put("_id",new ObjectId(x.valor[0] ));
           coll.remove(fin);
        return res;   
    }

    @Override
    public String modificar(Object o) {
        CPersonal_reparto x=(CPersonal_reparto)o;
        String res="";
        MongoClient mongo=null;
           try{
                mongo=new MongoClient(url,27017);
              }
            catch(Exception err){
                res=("Error");            
            }
                        
            DB db=mongo.getDB(database);
            DBCollection coll;
            coll=db.getCollection(tabla);

            DBObject id1 = new BasicDBObject("_id",new ObjectId(x.valor[0]) );
            
            DBObject datos = new BasicDBObject();
            for(int i=1;i<x.n;i++){
                datos.put(x.clave[i], x.valor[i]);
            }            
           coll.update(id1,datos);
        return res;
    }

    @Override
    public ArrayList consultar() {
        String res="";
        CPersonal_reparto x=new CPersonal_reparto();
        ArrayList datos=new ArrayList();
        MongoClient mongo=null;
        try{
             mongo=new MongoClient(url,27017);
           }
         catch(Exception err){
             res=("Error");            
         }


        DB db=mongo.getDB(database);


        DBCollection coll=db.getCollection(tabla);
        BasicDBObject dato = new BasicDBObject();
        DBCursor cursor=coll.find();
        try{
            while(cursor.hasNext()){               
                       String k[]=new String[x.clave.length];
  
                BasicDBObject agg=(BasicDBObject)cursor.next();  
                    for(int i=0;i<x.n;i++)
                        k[i]=( agg.get(x.clave[i])!=null)?agg.get(x.clave[i]).toString():"";
                    
                    datos.add(new CPersonal_reparto(k));                                           
            }
        } finally{
            cursor.close();
        }                  
        return datos;
      }

    @Override
    public List<?> filtrar(String campo, String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
        public CPersonal_reparto buscar_id(String id){
        String res="";
        CPersonal_reparto x=new CPersonal_reparto();
        ArrayList datos=new ArrayList();
        MongoClient mongo=null;
        try{
             mongo=new MongoClient(url,27017);
           }
         catch(Exception err){
             res=("Error");            
         }
        DB db=mongo.getDB(database);
        DBCollection coll=db.getCollection(tabla);
        BasicDBObject dato = new BasicDBObject();

        DBObject id1 = new BasicDBObject("_id",new ObjectId(id) );

        DBCursor cursor=coll.find(id1);
        try{
            while(cursor.hasNext()){               
                       String k[]=new String[x.clave.length];
  
                BasicDBObject agg=(BasicDBObject)cursor.next();  
                    for(int i=0;i<x.n;i++)
                        k[i]=( agg.get(x.clave[i])!=null)?agg.get(x.clave[i]).toString():"";
                    
                    datos.add(new CPersonal_reparto(k));                                           
            }
        } finally{
            cursor.close();
        }                  
        if(datos.size()==0)return new CPersonal_reparto();
        return (CPersonal_reparto) datos.get(0);
    }
}
