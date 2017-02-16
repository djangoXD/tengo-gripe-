<%@page import="clases.CProveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DUsuario"%>
<%@page import="clases.CUsuario"%>
<%@ page session="true" %>
<%
    String usuario = "";
    String clave = "";
 
    if (request.getParameter("usuario") != null) 
        usuario = request.getParameter("usuario");
    
    if (request.getParameter("clave") != null) 
        clave = request.getParameter("clave");
    
   ArrayList <CUsuario> aux=    new DUsuario().verifiar(usuario, clave);
    if (aux.size()!=0) {
        CUsuario usu=aux.get(0);
        HttpSession sesionOk = request.getSession();
        if(usu.valor[3].compareTo("ADMI")==0){            
           response.sendRedirect("../admin/VAdminController?waren='"+usu.valor[0]+"'");
        }else
        if(usu.valor[3].compareTo("CLIENTE")==0){
            response.sendRedirect("http://www.lineadecodigo.com/");
        }else
        if(usu.valor[3].compareTo("PROVEEDOR")==0){
            response.sendRedirect("../admin/VProveedorController?waren='"+usu.valor[0]+"'");
        }else
        if(usu.valor[3].compareTo("VENDEDOR")==0){
            response.sendRedirect("http://www.lineadecodigo.com/");
        }else
        if(usu.valor[3].compareTo("PERSONAL_REPARTO")==0){
            response.sendRedirect("http://www.lineadecodigo.com/");
        }else{
            out.println(usu.valor[3]);
        }
        
} else {
                    response.sendRedirect("../index.html");
    }

%>
