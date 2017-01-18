package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List.*;
import clases.CPersona;
import modelo.DPersona;
import java.util.ArrayList;

public final class VPersona_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            DPersona dp=new DPersona();
            ArrayList<CPersona> datos=new ArrayList();
        
      out.write("\n");
      out.write("        <form name=\"fpersona\" method=\"POST\" action=\"PersonaController\">\n");
      out.write("            <input type=\"text\" name=\"id\" placeholder=\"id\" ><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" placeholder=\"nombre\" ><br>\n");
      out.write("            <input type=\"text\" name=\"apellidos\" placeholder=\"apellidos\" ><br>\n");
      out.write("            <input type=\"text\" name=\"fecha_nacimiento\" placeholder=\"fecha_nacimiento\" ><br>\n");
      out.write("            <input type=\"text\" name=\"direccion\" placeholder=\"direccion\" ><br>\n");
      out.write("            <input type=\"text\" name=\"tipo_documento\" placeholder=\"tipo_documento\" ><br>\n");
      out.write("            <input type=\"text\" name=\"nro_documento\" placeholder=\"nro_documento\" ><br>\n");
      out.write("            <input type=\"text\" name=\"email\" placeholder=\"email\" ><br>\n");
      out.write("            <input type=\"text\" name=\"sexo\" placeholder=\"sexo\" ><br>\n");
      out.write("            <input type=\"submit\" name=\"insertar\" value=\"insertar\">     \n");
      out.write("            <input type=\"submit\" value=\"eliminar\">     \n");
      out.write("            <input type=\"submit\" value=\"modificar\">     \n");
      out.write("            <table border =\"1px\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>id</td>\n");
      out.write("                    <td>nombres</td>\n");
      out.write("                    <td>apellidos</td>\n");
      out.write("                    <td>fecha_nacimieto</td>\n");
      out.write("                    <td>direccion</td>\n");
      out.write("                    <td>tipo_documento</td>\n");
      out.write("                    <td>nro_documento</td>\n");
      out.write("                    <td>email</td>\n");
      out.write("                    <td>sexo</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    ");

                        datos=dp.consultar();
                        for(CPersona p: datos){
                            
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(p.getId());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getNombre());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getApellidos());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getFecha_nacimiento());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getDireccion());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getTipo_documento());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getNro_documento());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getEmail());
      out.write("</td>                   \n");
      out.write("                    <td>");
      out.print(p.getSexo());
      out.write("</td>                   \n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
