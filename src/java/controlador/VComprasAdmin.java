    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CAdministradores;
import clases.CPersonas;
import clases.CProveedores;
import clases.CUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DAdministradores;
import modelo.DContacto;
import modelo.DDirecciones;
import modelo.DPersonas;
import modelo.DProveedores;
import modelo.DUsuario;

/**
 *
 * @author WARREN
 */
public class VComprasAdmin extends HttpServlet {

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
                String val=request.getParameter("val").toString(); 
                String pro_user[]=val.split(" ");
                
                CUsuario usu_admi=new DUsuario().buscar_id(pro_user[1]);
                CPersonas per_admi=(CPersonas) new DPersonas().existe(usu_admi.valor[0],8).get(0);            

                CProveedores prov=(CProveedores) new DProveedores().buscar_id(pro_user[0]);    
                CPersonas per_prov=(CPersonas) new DPersonas().existe(prov.valor[0],9).get(0);            
                CUsuario usu_prov=new DUsuario().buscar_id(per_prov.valor[8]);                
                
                request.setAttribute("usu_admi", usu_admi);
                request.setAttribute("per_admi", per_admi);
                request.setAttribute("usu_prov", usu_prov);
                request.setAttribute("per_prov", per_prov);
                request.setAttribute("prov", prov);

    
                request.getRequestDispatcher("admi/head.jsp").include(request, response);
                request.getRequestDispatcher("admi/siderbar.jsp").include(request, response);
                request.getRequestDispatcher("admi/main_panel.jsp").include(request, response);
                request.getRequestDispatcher("admi/compras.jsp").include(request, response); 
                request.getRequestDispatcher("admi/abajo.jsp").include(request, response);
            }catch(Exception e){
                out.print(e.getMessage()+"<br>");
                out.print(e.getCause()+"<br>");
                out.print(error);
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
