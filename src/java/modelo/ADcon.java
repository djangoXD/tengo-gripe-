/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author WARREN
 */
public class ADcon {
    private String database;
    private String tabla;
    private String url;

    public ADcon() {
        this.database="ferreteria";
        this.url="127.0.0.1";
    }

    public String getDatabase() {
        return database;
    }

    public String getTabla() {
        return tabla;
    }

    public String getUrl() {
        return url;
    }
   
}
