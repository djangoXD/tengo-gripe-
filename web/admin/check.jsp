<%@page import="modelo.DUsuario"%>
<%@page import="clases.CUsuario"%>
<%@ page session="true" %>
<%
    String usuario = "";
    String clave = "";
 
    if (request.getParameter("usuario") != null) {
        usuario = request.getParameter("usuario");
    }
    if (request.getParameter("clave") != null) {
        clave = request.getParameter("clave");
    }
        
    if (new DUsuario().verifiar(usuario, clave)) {
        HttpSession sesionOk = request.getSession();

%>
<jsp:forward page="../admin/prueba.jsp" />
<%

} else {
%>
<jsp:forward page="../index.html">
    <jsp:param name="error" value="Usuario y/o clave incorrectos.<br>Vuelve a intentarlo."/>
</jsp:forward>
<%    }
%>
