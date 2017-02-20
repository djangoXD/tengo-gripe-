/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CAdministradores;
import clases.CCliente;
import clases.CPersonas;
import clases.CUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DAdministradores;
import modelo.DCliente;
import modelo.DContacto;
import modelo.DDirecciones;
import modelo.DPersonas;
import modelo.DUsuario;

/**
 *
 * @author WARREN
 */
public class VClienteController extends HttpServlet {
    CUsuario usu;
    CPersonas per;
    CCliente cliente;
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
            String error = "";
            try {
                if (request.getParameter("waren") != null) {
                    String id_usuario = request.getParameter("waren");
                    usu = new DUsuario().buscar_id(id_usuario);
                    per = (CPersonas) new DPersonas().existe(usu.valor[0], 8).get(0);
                    cliente =(CCliente)new DCliente().buscar_id(per.valor[9]);
                    con = new DContacto().existe(per.valor[0], 3);
                    dir = new DDirecciones().existe(per.valor[0], 5);
                    
                    request.setAttribute("per_admi", per);
                    request.setAttribute("usu_admi", usu);
                    request.setAttribute("admi", cliente);
                    request.setAttribute("con", con);
                    request.setAttribute("dir", dir);
                    
                    request.getRequestDispatcher("cliente/head.jsp").include(request, response);
                    request.getRequestDispatcher("cliente/siderbar.jsp").include(request, response);
                    request.getRequestDispatcher("cliente/main_panel.jsp").include(request, response);
                    request.getRequestDispatcher("cliente/perfil.jsp").include(request, response);
                    request.getRequestDispatcher("cliente/abajo.jsp").include(request, response);
                }
            } catch (Exception e) {
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
