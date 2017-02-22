<%-- 
    Document   : menu.jsp
    Created on : 20-feb-2017, 17:05:47
    Author     : Alexsandra CB
--%>
<%@page import="modelo.DCategoria"%>
<%@page import="clases.CCategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <script>
        function enviar(){
                alert("dd");
            $.post('cargar_moda', {
                moda: $('#idmoda').val(),
            }, function (responseText) {
                $('#contenido2').html(responseText);
            });
            
        }
    </script>

          <%
          ArrayList<CCategoria> datos_categoria=new DCategoria().consultar();
          for(CCategoria x:datos_categoria){
              %>
              <li class="hvr-bounce-to-bottom"><a href="#" id="idmoda" onclick="enviar()"> <%=x.toString()%></a></li>
              <%
          }
          %>
