/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CPersonas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DPersonas;

/**
 *
 * @author WARREN
 */
public class buscar_cliente extends HttpServlet {

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
            try {
                /* TODO output your page here. You may use following sample code. */
                String dni = request.getParameter("dni");

                ArrayList k = new DPersonas().existe(dni, 2);
                String nombre = "";
                String apellidos = "";
                if (k.size() != 0) {
                    CPersonas per = (CPersonas) k.get(0);
                    nombre = per.valor[3];
                    apellidos = per.valor[4];
                }
                String res = "<div class=\"row\">\n"
                        + "                                    <div class=\"col-xs-5\">\n"
                        + "                                        <p class=\"description text-left\">NOMBRES :</p>                                                    \n"
                        + "                                    </div>\n"
                        + "                                    <div class=\"col-xs-7\">\n"
                        + "                                        <input class=\"form-control\" id=\"nombre_cliente\" value='" + nombre + "'>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                                <div class=\"row\">\n"
                        + "                                    <div class=\"col-xs-5\">\n"
                        + "                                        <p class=\"description text-left\">APELLIDOS :</p>                                                    \n"
                        + "                                    </div>\n"
                        + "                                    <div class=\"col-xs-7\">\n"
                        + "                                        <input class=\"form-control\" id=\"apellidos_cliente\" value='" + apellidos + "'>\n"
                        + "                                    </div>\n"
                        + "                                </div>                                \n"
                        + "";
                out.println(res);
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
