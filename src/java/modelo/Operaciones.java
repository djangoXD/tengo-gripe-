/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author WARREN
 */
public interface Operaciones {
    public String insertar(Object o);
    public String eliminar(Object o);
    public String modificar(Object o);
    public List<?> consultar();
    public List<?> filtrar(String campo,String criterio);
    
}
