/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author WARREN
 */
public class Database {
    private String NomClase = "com.mysql.jdbc.Driver";
    private String Servidor = "jdbc:mysql://localhost/";
    private String BaseDatos = "persona";
    private String Usuario = "root";
    private String Password = "amir";
    public Connection conexion;
    private Statement consultaSQL;
    
    private ResultSet rs;
    public Database() {
    }
    public void con(){
        try {
            Class.forName(NomClase);
            String BD = Servidor + BaseDatos;
            conexion = DriverManager.getConnection(BD, Usuario, Password);
            consultaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void descon(){
        try {
            consultaSQL.close();
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
