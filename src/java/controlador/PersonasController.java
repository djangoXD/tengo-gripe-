/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CImagen;
import clases.CPersonas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DImagen;
import modelo.DPersonas;

/**
 *
 * @author WARREN
 */
@MultipartConfig
public class PersonasController extends HttpServlet {

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
//      response.setStatus(307); //this makes the redirection keep your requesting method as is.
//      response.addHeader("Location", "usuarios.jsp");
           DPersonas dp=new DPersonas();
           CPersonas cp=new CPersonas();

           CImagen ci=new CImagen();
           DImagen di=new DImagen();
           String res="";
           RequestDispatcher rd=null;
            try{
                for(int i=0;i<cp.clave.length;i++){
                    cp.valor[i]=request.getParameter(cp.clave[i]);
                }
                if(request.getParameter("insertar")!=null){
                    ci.imagen=request.getPart("foto").getInputStream();
                    ci.nombre=cp.valor[2];
                    ci.prioridad="1";
                    ci.tipo="Persona";
                    di.insertar(ci);
                    res=dp.insertar(cp);

                }else
                if(request.getParameter("modificar")!=null){
                    CPersonas x=new DPersonas().buscar_id(cp.valor[0]);
                    cp.valor[8]=x.valor[8];
                    cp.valor[9]=x.valor[9];
                    res=dp.modificar(cp);

                    ci.imagen=request.getPart("foto").getInputStream();
                    ci.nombre=cp.valor[2];
                    ci.prioridad="1";
                    ci.tipo="Persona";
                    if(di.existe(ci.nombre))di.eliminar(ci);
                    di.insertar(ci);

  //                  out.println(res);
                }else
                if(request.getParameter("eliminar")!=null){
                    res=dp.eliminar(cp);
                   if(di.existe(ci.nombre))di.eliminar(ci);
    //                out.println(res);
                }
                request.getRequestDispatcher("arriba.jsp").include(request, response);
                request.getRequestDispatcher("mantenimientos/man_personas.jsp").include(request, response);
                request.getRequestDispatcher("abajo.jsp").include(request, response);
        }catch(Exception e){

        }}
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
