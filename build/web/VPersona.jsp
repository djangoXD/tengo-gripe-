<%-- 
    Document   : VPersona
    Created on : 18/01/2017, 05:48:25 AM
    Author     : WARREN
--%>

<%@page import="java.util.List.*"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <%
            DPersona dp=new DPersona();
            ArrayList<CPersona> datos=new ArrayList();
        %>
        <form name="fpersona" method="POST" action="PersonaController">
            <input class="form-control" type="text" name="id" placeholder="id" ><br>
            <input type="text" name="nombre" placeholder="nombre" ><br>
            <input type="text" name="apellidos" placeholder="apellidos" ><br>
            <input type="text" name="fecha_nacimiento" placeholder="fecha_nacimiento" ><br>
            <input type="text" name="direccion" placeholder="direccion" ><br>
            <input type="text" name="tipo_documento" placeholder="tipo_documento" ><br>
            <input type="text" name="nro_documento" placeholder="nro_documento" ><br>
            <input type="text" name="email" placeholder="email" ><br>
            <input type="text" name="sexo" placeholder="sexo" ><br>
            <input type="submit" name="insertar" value="insertar">     
            <input type="submit" value="eliminar">     
            <input type="submit" value="modificar">     
            <table border ="1px">
                <tr>
                    <td>id</td>
                    <td>nombres</td>
                    <td>apellidos</td>
                    <td>fecha_nacimieto</td>
                    <td>direccion</td>
                    <td>tipo_documento</td>
                    <td>nro_documento</td>
                    <td>email</td>
                    <td>sexo</td>
                </tr>
                <tr>
                    
                </tr>
            </table>
        </form>
    </body>
</html>
