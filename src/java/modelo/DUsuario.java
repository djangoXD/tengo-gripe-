/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import clases.CUsuario;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.codec.digest.DigestUtils;
import org.bson.types.ObjectId;

/**
 *
 * @author Dennys
 */
public class DUsuario implements Operaciones{
      private String database;
    private String tabla;
    private String url;

    public DUsuario() {
       ADcon gg=new ADcon();
        this.database=gg.getDatabase();
        this.tabla="usuario";
        this.url=gg.getUrl();
     }

    public DUsuario(String database, String tabla, String url) {
        this.database = database;
        this.tabla = tabla;
        this.url = url;
    }
   
    
    @Override
    public String insertar(Object o) {
        
        CUsuario x=(CUsuario)o;       
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
               if(i==2){
                   datos.append(x.clave[i],DigestUtils.md5Hex(x.valor[i]));
               }
               else{
                   datos.append(x.clave[i], x.valor[i]);
               }
           }          
           coll.insert(datos);      
                       ObjectId id = (ObjectId)datos.get( "_id" );
            res=id.toString();

        return res;
       }

    @Override
    public String eliminar(Object o) {
        CUsuario x=(CUsuario)o;
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
        CUsuario x=(CUsuario)o;
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
               if(i==2){
                   datos.put(x.clave[i],DigestUtils.md5Hex(x.valor[i]));
               }
               else{
                   datos.put(x.clave[i], x.valor[i]);
               }            }            
           coll.update(id1,datos);
        return res;
    }

    @Override
    public ArrayList consultar() {
        String res="";
        CUsuario x=new CUsuario();
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
                    
                    datos.add(new CUsuario(k));                                           
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
    public CUsuario buscar_id(String id){
        String res="";
        CUsuario x=new CUsuario();
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
        DBObject id1 = new BasicDBObject("_id",new ObjectId( id ));

        DBCursor cursor=coll.find(id1);
        try{
            while(cursor.hasNext()){               
                       String k[]=new String[x.clave.length];
  
                BasicDBObject agg=(BasicDBObject)cursor.next();  
                    for(int i=0;i<x.n;i++)
                        k[i]=( agg.get(x.clave[i])!=null)?agg.get(x.clave[i]).toString():"";
                    
                    datos.add(new CUsuario(k));                                           
            }
        } finally{
            cursor.close();
        }                  
        return (CUsuario) datos.get(0);
    }
    public ArrayList verifiar(String id,String con){
            String res="";
        CUsuario x=new CUsuario();
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
        DBObject id1 = new BasicDBObject("usuario",id ).append("contrasena",DigestUtils.md5Hex(con));

        DBCursor cursor=coll.find(id1);
        try{
            while(cursor.hasNext()){               
                       String k[]=new String[x.clave.length];
  
                BasicDBObject agg=(BasicDBObject)cursor.next();  
                    for(int i=0;i<x.n;i++)
                        k[i]=( agg.get(x.clave[i])!=null)?agg.get(x.clave[i]).toString():"";
                    
                    datos.add(new CUsuario(k));                                           
            }
        } finally{
            cursor.close();
        }                  
        return datos;
    } 
    public ArrayList existe(String id,int num){
        String res="";
        CUsuario x=new CUsuario();
        MongoClient mongo=null;
        try{
             mongo=new MongoClient(url,27017);
           }
         catch(Exception err){
             res=("Error");            
         }
        DB db=mongo.getDB(database);
        DBCollection coll=db.getCollection(tabla);
        DBObject id1 = new BasicDBObject(x.clave[num],id );
        DBCursor cursor=coll.find(id1);
        ArrayList datos=new ArrayList();
        try{
            while(cursor.hasNext()){               
                       String k[]=new String[x.clave.length];
  
                BasicDBObject agg=(BasicDBObject)cursor.next();  
                    for(int i=0;i<x.n;i++)
                        k[i]=( agg.get(x.clave[i])!=null)?agg.get(x.clave[i]).toString():"";
                    
                    datos.add(new CUsuario(k));                                           
            }
        } finally{
            cursor.close();
        }                  
        return datos;
    }
}
