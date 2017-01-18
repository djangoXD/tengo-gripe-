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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        \r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            DPersona dp=new DPersona();
            ArrayList<CPersona> datos=new ArrayList();
        
      out.write("\r\n");
      out.write("        <form name=\"fpersona\" method=\"POST\" action=\"PersonaController\">\r\n");
      out.write("            <input class=\"form-control\" type=\"text\" name=\"id\" placeholder=\"id\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"nombre\" placeholder=\"nombre\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"apellidos\" placeholder=\"apellidos\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"fecha_nacimiento\" placeholder=\"fecha_nacimiento\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"direccion\" placeholder=\"direccion\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"tipo_documento\" placeholder=\"tipo_documento\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"nro_documento\" placeholder=\"nro_documento\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"email\" placeholder=\"email\" ><br>\r\n");
      out.write("            <input type=\"text\" name=\"sexo\" placeholder=\"sexo\" ><br>\r\n");
      out.write("            <input type=\"submit\" name=\"insertar\" value=\"insertar\">     \r\n");
      out.write("            <input type=\"submit\" value=\"eliminar\">     \r\n");
      out.write("            <input type=\"submit\" value=\"modificar\">     \r\n");
      out.write("            <table border =\"1px\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>id</td>\r\n");
      out.write("                    <td>nombres</td>\r\n");
      out.write("                    <td>apellidos</td>\r\n");
      out.write("                    <td>fecha_nacimieto</td>\r\n");
      out.write("                    <td>direccion</td>\r\n");
      out.write("                    <td>tipo_documento</td>\r\n");
      out.write("                    <td>nro_documento</td>\r\n");
      out.write("                    <td>email</td>\r\n");
      out.write("                    <td>sexo</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    \r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
