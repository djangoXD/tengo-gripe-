/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CContacto;
import clases.CDirecciones;
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
import modelo.DContacto;
import modelo.DDirecciones;
import modelo.DPersona;
import modelo.DPersonas;
import modelo.DProveedores;
import modelo.DUsuario;

/**
 *
 * @author WARREN
 */
public class VProveedorController extends HttpServlet {

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
            String id_usuario="";
            if(request.getParameter("saveDireccion")!=null){
                CDirecciones cp=new CDirecciones();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    new DDirecciones().modificar(cp);                                
                    id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("delDireccion")!=null){
                CDirecciones cp=new CDirecciones();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    new DDirecciones().eliminar(cp);                                
                    id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("insertDireccion")!=null){
                CDirecciones cp=new CDirecciones();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    new DDirecciones().insertar(cp);                                
                    id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("actPersona")!=null){
                CPersonas cp=new CPersonas();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                
                    new DPersonas().modificar(cp);                                
                    id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("actUser")!=null){
                CUsuario cp=new CUsuario();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    cp.valor[3]="PROVEEDOR";                
                    new DUsuario().modificar(cp);                                
                    id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("insertContacto")!=null){
                System.out.println(request.getParameter("insertContacto"));
                CContacto cp=new CContacto();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    new DContacto().insertar(cp);                                
                   id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("modContacto")!=null){
                CContacto cp=new CContacto();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    new DContacto().modificar(cp);                                
                   id_usuario=request.getParameter("id_usuario");
            }else
            if(request.getParameter("delContacto")!=null){
                CContacto cp=new CContacto();
                for(int i=0;i<cp.clave.length;i++)
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                    out.print( new DContacto().eliminar(cp));                                
                    id_usuario=request.getParameter("id_usuario");
    
            }else{
                id_usuario=request.getParameter("waren").toString().substring(1,25); 
            }
                CUsuario usu=new DUsuario().buscar_id(id_usuario);
                CPersonas per=(CPersonas) new DPersonas().existe(usu.valor[0],8).get(0);            
                CProveedores pro=(CProveedores) new DProveedores().buscar_id(per.valor[9]);
                ArrayList con= new DContacto().existe(per.valor[0], 3);
                ArrayList dir= new DDirecciones().existe(per.valor[0], 5);

            
                request.setAttribute("per", per);
                request.setAttribute("usu", usu);
                request.setAttribute("pro", pro);
                request.setAttribute("con", con);
                request.setAttribute("dir", dir);
            
                request.getRequestDispatcher("proveedor/head.jsp").include(request, response);
                request.getRequestDispatcher("proveedor/siderbar.jsp").include(request, response);
                request.getRequestDispatcher("proveedor/main_panel.jsp").include(request, response);
                request.getRequestDispatcher("proveedor/perfil.jsp").include(request, response); 
                request.getRequestDispatcher("proveedor/abajo.jsp").include(request, response);
    

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
