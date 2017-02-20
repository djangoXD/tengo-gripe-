<%@page import="modelo.DCliente"%>
<%@page import="clases.CCliente"%>
<%@page import="modelo.DProveedores"%>
<%@page import="clases.CProveedores"%>
<%@page import="clases.CVendedores"%>
<%@page import="modelo.DVendedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CUsuario"%>

<%
    CUsuario user = (CUsuario) request.getAttribute("usu_vend");;    
%>


<div class="sidebar" data-background-color="white" data-active-color="danger">
    <div class="sidebar-wrapper">   
        <div class="logo">  
            <a href="#" class="simple-text">Alpaca Fuxion</a>
        </div>
        <ul class="nav">
            <li>
                <a id="reportes" href="#">
                    <i class="ti-panel"></i>
                    <p>Reportes</p>
                </a>
            </li>

            <li class="active">
                <a href="#" onclick="cargarp('perfil');">
                    <i class="ti-user"></i>
                    <p>Perfil de Usuario <%=user%></p>
                </a>
                
            </li>
            <li>
                <a href="javascript:Carga('venta.jsp', 'info');">
                    <i class="ti-bell"></i>
                    <p>Realizar Venta</p>
                </a>
            </li>
            <li>
                <input type="hidden"  name="id_usuario" value="<%=user.valor[0]%>"> 
                <a onclick="mos_man('ventass')">
                    <i class="ti-text"></i>
                    <p>Realizar Venta</p>
                </a>
                <div class="panel panel-warning " id="ventass" >
                    <ul >
                        <%

                            ArrayList<CCliente> datos=new DCliente().consultar();
                            for(CCliente v:datos){
                                String val=v.valor[0]+" "+user.valor[0];
                        %>
                        <li><a id="man_per" href="VVentasVendedor?val=<%=val%>"><%=v%></a></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>
                    <script type="text/javascript" language="javascript" >
    function cargarp(value){
            $.post('VAdminController', {
                yes: value
            }, function (responseText) {
                $('#info').html(responseText);
            });        
    };    
</script>
                    <div id="gginfo"></div>