/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CArticulo;
import clases.CCarrito;
import clases.CVentas;
import clases.CVentas_detalle;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DArticulo;
import modelo.DVentas;
import modelo.DVentas_detalle;

/**
 *
 * @author WARREN
 */
public class carrito3 extends HttpServlet {
ArrayList<CCarrito>ventas=new ArrayList<CCarrito>();
     void verficar(CCarrito c,int k){
                    for(CCarrito x:ventas){
                        if(x.id_articulo.compareTo(c.id_articulo)==0){
                            x.cantidad+=(c.cantidad*k);
                            return;
                        }
                        
                    }     
            ventas.add(c);       
     }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
               String error="";
            try{
              if(request.getParameter("id_articulo")!=null){

                    int cantidad=Integer.parseInt( request.getParameter("cantidad"));
                    int sum=Integer.parseInt( request.getParameter("sum"));
                    String producto=request.getParameter("id_articulo");
                    CCarrito carrito=new CCarrito(cantidad,producto);
                    verficar(carrito,sum);
 
                    int total=0;
                    for(CCarrito x:ventas){
                            out.println("<tr>");
                            CArticulo ar=new DArticulo().buscar_id(x.id_articulo);
                            int costt=Integer.parseInt(ar.valor[3]);
                            out.println("<td>"+x.cantidad+"</td>");			
                            out.println("<td>"+ar.valor[2]+"</td>");			
                            out.println("<td>"+ar.valor[3]+"</td>");			
                            out.println("<td>"+x.cantidad*costt+"</td>");			
                            out.println("</tr>");
                            total+=x.cantidad*costt;
                    }
                            out.println("<tr>");
                            out.println("<td></td>");			
                            out.println("<td></td>");			
                            out.println("<td>total:</td>");			
                            out.println("<td>"+total+"</td>");			
                            out.println("</tr>");
                          
              }
              if(request.getParameter("venta")!=null){
                  
                String id_cliente=request.getParameter("id_cliente");
                String id_vendedor=request.getParameter("id_vendedor");
                CVentas venta=new CVentas();
                venta.valor[1]=new Date().toString();
                venta.valor[2]="1";
                venta.valor[3]=id_vendedor;
                venta.valor[4]="";
                venta.valor[5]=id_cliente;
                String id_venta=new DVentas().insertar(venta);
                for(CCarrito x:ventas){
                    CVentas_detalle cd=new CVentas_detalle();
                    CArticulo ar=new DArticulo().buscar_id(x.id_articulo);
                    cd.valor[1]=String.valueOf( x.cantidad);
                    cd.valor[2]=ar.valor[3];
                    cd.valor[3]=id_venta;
                    cd.valor[4]=ar.valor[0];                   
                    new DVentas_detalle().insertar(cd);

                }
                                    out.print("completado");
                ventas.clear();
              }
              if(request.getParameter("cler")!=null){              
                ventas.clear();
       
              }

            }catch(Exception e){
                out.println(e.getMessage());
            }                    
     }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
