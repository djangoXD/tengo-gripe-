/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.CPersona;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import modelo.DPersona;

/**
 *
 * @author WARREN
 */
public class PersonaController extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//           response.setStatus(307); //this makes the redirection keep your requesting method as is.
//           response.addHeader("Location", "prueba.jsp");
           DPersona dp=new DPersona();
           CPersona cp=new CPersona();
           String res="";
           RequestDispatcher rd=null;
            try{
                cp.setId(request.getParameter("d1"));
                cp.setNombre(request.getParameter("d2"));
                cp.setApellidos(request.getParameter("d3"));
                cp.setFecha_nacimiento(request.getParameter("d4"));
                cp.setDireccion(request.getParameter("d5"));
                cp.setTipo_documento(request.getParameter("d6"));
                cp.setNro_documento(request.getParameter("d7"));
                cp.setEmail(request.getParameter("d8"));
                cp.setSexo(request.getParameter("d9"));
                out.println(request.getParameter("insertar")+"-<br>");
                out.println(request.getParameter("modificar")+"-<br>");
                out.println(request.getParameter("eliminar")+"-<br>");
                if(request.getParameter("insertar")!=null){                   
                    res=dp.insertar(cp);                  
                    out.println(res);
                }else 
                if(request.getParameter("modificar")!=null){                   
                    res=dp.modificar(cp);                  
                    out.println(res);
                }else 
                if(request.getParameter("eliminar")!=null){                   
                    res=dp.eliminar(cp);                  
                    out.println(res);
                }
                out.println();
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
