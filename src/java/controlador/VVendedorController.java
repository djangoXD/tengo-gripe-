/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CVendedores;
import clases.CPersonas;
import clases.CUsuario;
import clases.CVendedores;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DVendedores;
import modelo.DContacto;
import modelo.DDirecciones;
import modelo.DPersonas;
import modelo.DUsuario;

/**
 *
 * @author WARREN
 */
public class VVendedorController extends HttpServlet {
    CUsuario usu;
    CPersonas per;
    CVendedores vend;
    ArrayList con, dir;
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
                        String error = "bueno";
            try {
                if (request.getParameter("waren") != null) {
                    String id_usuario = request.getParameter("waren").toString().substring(1, 25);
                    usu = new DUsuario().buscar_id(id_usuario);
                    per = (CPersonas) new DPersonas().existe(usu.valor[0], 8).get(0);
                    vend = (CVendedores) new DVendedores().buscar_id(per.valor[9]);
                    con = new DContacto().existe(per.valor[0], 3);
                    dir = new DDirecciones().existe(per.valor[0], 5);

                    request.setAttribute("per_vend", per);
                    request.setAttribute("usu_vend", usu);
                    request.setAttribute("vend", vend);
                    request.setAttribute("con", con);
                    request.setAttribute("dir", dir);
                    request.getRequestDispatcher("vendedor/head.jsp").include(request, response);
                    request.getRequestDispatcher("vendedor/siderbar.jsp").include(request, response);
                    request.getRequestDispatcher("vendedor/main_panel.jsp").include(request, response);
                    request.getRequestDispatcher("vendedor/perfil.jsp").include(request, response);
                    request.getRequestDispatcher("vendedor/abajo.jsp").include(request, response);
                }else if(request.getParameter("yes")!=null){
                    String val=request.getParameter("yes");
                    request.setAttribute("per_vend", per);
                    request.setAttribute("usu_vend", usu);
                    request.setAttribute("vend", vend);
                    request.setAttribute("con", con);
                    request.setAttribute("dir", dir);
                    if(val.compareTo("perfil")==0)
                    request.getRequestDispatcher("vend/perfil.jsp").include(request, response);

                }
            } catch (Exception e) {
                out.println(e.getMessage());
                out.println(error);
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
