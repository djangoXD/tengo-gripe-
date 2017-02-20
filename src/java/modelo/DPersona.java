/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import clases.CPersona;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;
import java.util.ArrayList;
import java.util.List;
import org.bson.types.ObjectId;

/**
 *
 * @author WARREN
 */
public class DPersona implements Operaciones{
    private String database="ferreteri";
    private String tabla="person";
    private String url="127.0.0.1";
    @Override
    public String insertar(Object o) {
        
        CPersona p=(CPersona)o;       
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
           datos.append("nombre",p.getNombre());
           datos.append("apellidos", p.getApellidos());
           datos.append("fecha_nacimiento", p.getFecha_nacimiento());
           datos.append("direccion",p.getDireccion());
           datos.append("tipo_documento", p.getTipo_documento());
           datos.append("nro_documento", p.getNro_documento());
           datos.append("email",p.getEmail());
           datos.append("sexo", p.getSexo());
          
             coll.insert(datos,new WriteConcern());
             ObjectId id = (ObjectId)datos.get( "_id" );
        mongo.close();
        return id.toString();
    }

    @Override
    public String eliminar(Object o) {
        CPersona p=(CPersona)o;
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
           fin.put("_id",new ObjectId( p.getId()));
           coll.remove(fin);
        mongo.close();
        return res;   
    }

    @Override
    public String modificar(Object o) {
          CPersona p=(CPersona)o;
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

            DBObject id1 = new BasicDBObject("_id",new ObjectId(p.getId()) );
            
            DBObject datos = new BasicDBObject().append("nombre", p.getNombre())
            .append("nombre",p.getNombre())
            .append("apellidos", p.getApellidos())
            .append("fecha_nacimiento", p.getFecha_nacimiento())
            .append("direccion",p.getDireccion())
            .append("tipo_documento", p.getTipo_documento())
            .append("nro_documento", p.getNro_documento())
            .append("email",p.getEmail())
            .append("sexo", p.getSexo());

           coll.update(id1,datos);
        mongo.close();
        return res;
    }

    @Override
    public ArrayList consultar() {
        String res="";
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
                    BasicDBObject agg=(BasicDBObject)cursor.next();
                    String k0=( agg.get("_id")!=null)?agg.get("_id").toString():"";
                    String k1=( agg.get("nombre")!=null)?agg.get("nombre").toString():"";
                    String k2=( agg.get("apellidos")!=null)?agg.get("apellidos").toString():"";
                    String k3=( agg.get("fecha_nacimiento")!=null)?agg.get("fecha_nacimiento").toString():"";
                    String k4=( agg.get("direccion")!=null)?agg.get("direccion").toString():"";
                    String k5=( agg.get("tipo_documento")!=null)?agg.get("tipo_documento").toString():"";
                    String k6=( agg.get("nro_documento")!=null)?agg.get("nro_documento").toString():"";
                    String k7=( agg.get("email")!=null)?agg.get("email").toString():"";
                    String k8=( agg.get("sexo")!=null)?agg.get("sexo").toString():"";                
                    
                    datos.add(new CPersona(k0,k1,k2,k3,k4,k5,k6,k7,k8));
                       
                    
            }
        } finally{
            cursor.close();
        } 
        mongo.close();                 
        return datos;
    }
    
   

    @Override
    public List<?> filtrar(String campo, String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
