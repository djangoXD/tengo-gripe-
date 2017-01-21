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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min" rel="stylesheet">

  </head>
    <body>
        <%
            DPersona dp=new DPersona();
            ArrayList<CPersona> datos=new ArrayList();
        %>
        <div class="col-md-6">
            <form name="fpersona" method="POST" action="PersonaController">
                <input class="form-control" type="text" name="id" placeholder="id" ><br>
                <input class="form-control" type="text" name="nombre" placeholder="nombre" ><br>
                <input class="form-control" type="text" name="apellidos" placeholder="apellidos" ><br>
                <input class="form-control" type="text" name="fecha_nacimiento" placeholder="fecha_nacimiento" ><br>
                <input class="form-control" type="text" name="direccion" placeholder="direccion" ><br>
                <input class="form-control" type="text" name="tipo_documento" placeholder="tipo_documento" ><br>
                <input class="form-control" type="text" name="nro_documento" placeholder="nro_documento" ><br>
                <input class="form-control" type="text" name="email" placeholder="email" ><br>
                <input class="form-control" type="text" name="sexo" placeholder="sexo" ><br>
                <input class="btn btn-primary" type="submit" name="insertar" value="insertar">     
                <input class="btn btn-danger" type="submit" value="eliminar">     
                <input class="btn btn-success" type="submit" value="modificar">     
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
        </div>
    </body>
</html>
