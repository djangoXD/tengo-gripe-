/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CDirecciones;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DDirecciones;

/**
 *
 * @author Dennys
 */
@WebServlet(name = "DireccionesController", urlPatterns = {"/admin/DireccionesController"})
public class DireccionesController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           //response.setStatus(307); //this makes the redirection keep your requesting method as is.
           //response.addHeader("Location", "usuarios.jsp");
           DDirecciones dp=new DDirecciones();
           CDirecciones cp=new CDirecciones();
           String res="";
           RequestDispatcher rd=null;
            try{
                for(int i=0;i<cp.clave.length;i++){
                    cp.valor[i]=request.getParameter(cp.clave[i]);

                }
                if(request.getParameter("insertar")!=null){
                    res=dp.insertar(cp);
//                    out.println(res);
                }else
                if(request.getParameter("modificar")!=null){
                    res=dp.modificar(cp);
  //                  out.println(res);
                }else
                if(request.getParameter("eliminar")!=null){
                    res=dp.eliminar(cp);
    //                out.println(res);
                }
                request.getRequestDispatcher("arriba.jsp").include(request, response);
                request.getRequestDispatcher("mantenimientos/man_direcciones.jsp").include(request, response); 
                request.getRequestDispatcher("abajo.jsp").include(request, response);
            }catch(Exception e){}
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
