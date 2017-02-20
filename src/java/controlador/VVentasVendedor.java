/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CCliente;
import clases.CPersonas;
import clases.CCliente;
import clases.CUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DPersonas;
import modelo.DCliente;
import modelo.DUsuario;

/**
 *
 * @author WARREN
 */
public class VVentasVendedor extends HttpServlet {

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
                
                CUsuario usu_vend=new DUsuario().buscar_id(pro_user[1]);
                CPersonas per_vend=(CPersonas) new DPersonas().existe(usu_vend.valor[0],8).get(0);            
                CCliente cliente=(CCliente) new DCliente().buscar_id(pro_user[0]);    
                CPersonas per_client=(CPersonas) new DPersonas().existe(cliente.valor[0],9).get(0);            
                CUsuario usu_client=new DUsuario().buscar_id(per_client.valor[8]);                
                out.println(usu_vend);
                out.println(per_vend);
                out.println(cliente);
                out.println(per_client);
                out.println(usu_client);
                
                request.setAttribute("usu_admi", usu_vend);
                request.setAttribute("per_admi", per_vend);
                request.setAttribute("usu_prov", usu_client);
                request.setAttribute("per_prov", per_client);
                request.setAttribute("prov", cliente);

    
                request.getRequestDispatcher("vendedor/head.jsp").include(request, response);
                request.getRequestDispatcher("vendedor/siderbar.jsp").include(request, response);
                request.getRequestDispatcher("vendedor/main_panel.jsp").include(request, response);
                request.getRequestDispatcher("vendedor/ventas.jsp").include(request, response); 
                request.getRequestDispatcher("vendedor/abajo.jsp").include(request, response);
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
