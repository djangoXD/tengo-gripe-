/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import clases.CPersona;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author WARREN
 */
public class DPersona implements Operaciones{
    Database db=new Database();
    @Override
    public String insertar(Object o) {
        
        CPersona p=(CPersona)o;
        String sql="insert into persona values(?,?,?,?,?,?,?,?,?)";
        db.con();
        PreparedStatement pst;
        String res="";
        try{
            pst=(PreparedStatement) db.conexion.prepareStatement(sql);
            pst.setString(1, p.getId());            
            pst.setString(2, p.getNombre());
            pst.setString(3, p.getApellidos());
            pst.setString(4, p.getFecha_nacimiento());
            pst.setString(5, p.getDireccion());
            pst.setString(6, p.getTipo_documento());
            pst.setString(7, p.getNro_documento());
            pst.setString(8, p.getEmail());
            pst.setString(8, p.getSexo());
            int filas=pst.executeUpdate();
            res="Se Registraron "+ filas + "nuevo elemento";
        } catch (SQLException ex) {
            Logger.getLogger(DPersona.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    @Override
    public String eliminar(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String modificar(Object o) {
  CPersona p=(CPersona)o;
        String sql="update persona set nombres=?,apellidos=?,fecha )";
        Connection con;
        PreparedStatement pst;
        String res="";
        try{
            pst=(PreparedStatement) db.conexion.prepareStatement(sql);
            pst.setString(1, p.getId());            
            pst.setString(2, p.getNombre());
            pst.setString(3, p.getApellidos());
            pst.setString(4, p.getFecha_nacimiento());
            pst.setString(5, p.getDireccion());
            pst.setString(6, p.getTipo_documento());
            pst.setString(7, p.getNro_documento());
            pst.setString(8, p.getEmail());
            pst.setString(8, p.getSexo());
            int filas=pst.executeUpdate();
            res="Se Registraron "+ filas + "nuevo elemento";
        } catch (SQLException ex) {
            Logger.getLogger(DPersona.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    @Override
    public ArrayList consultar() {
        String sql="select*from persona";
        
        ArrayList datos=new ArrayList();
        Database con=new Database();
        con.con();

        try {
            PreparedStatement st=(PreparedStatement) con.conexion.prepareStatement(sql);
            String res="";
            ResultSet rs;
            
            rs = st.executeQuery();
                while(rs.next()){
                datos.add(new CPersona(
                        rs.getString("id"),
                        rs.getString("nombre"),
                        rs.getString("apellidos"),
                        rs.getString("fecha_nacimiento"),
                        rs.getString("direccion"),
                        rs.getString("tipo_documento"),
                        rs.getString("nro_documento"),
                        rs.getString("email"),
                        rs.getString("sexo")
                ));
                con.descon();
                }
        } catch (SQLException ex) {
            Logger.getLogger(DPersona.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
    
   

    @Override
    public List<?> filtrar(String campo, String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
