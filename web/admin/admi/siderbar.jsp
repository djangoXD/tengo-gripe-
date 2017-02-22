<%@page import="modelo.DProveedores"%>
<%@page import="clases.CProveedores"%>
<%@page import="clases.CVendedores"%>
<%@page import="modelo.DVendedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CUsuario"%>

<%
    CUsuario user = (CUsuario) request.getAttribute("usu_admi");;    
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

                <a onclick="mos_man('mantenimientos')">
                    <i class="ti-view-list-alt"></i>
                    Mantenimientos
                    <span class="caret"></span>
                </a>
                <div class="panel panel-warning " id="mantenimientos" style="display: none">
                    <ul >
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_usuario.jsp');">Usuario</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_personas.jsp');">Persona</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_contacto.jsp');">Contactos</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_direcciones.jsp');">Direcciones</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_proveedores.jsp');">Proveedores</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_administradores.jsp');">Administradores</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_articulo.jsp');">Articulo</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_categoria.jsp');">Categoria</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_cliente.jsp');">Clientes</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_compras_detalle.jsp');">Compras Detalle</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_compras.jsp');">Compras</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_ventas_detalle.jsp');">Ventas Detalle</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_ventas.jsp');">Ventas</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_personal_reparto.jsp');">Personal Reparto</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_vendedores.jsp');">Vendedores</a></li>
                        <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_proveedor_categoria.jsp');">Proveedor_Categoria</a></li>
                    </ul>
                </div>
            </li>    
            <li>
                <input type="hidden"  name="id_usuario" value="<%=user.valor[0]%>"> 
                <a onclick="mos_man('pedido')">
                    <i class="ti-text"></i>
                    <p>Hacer pedido</p>
                </a>
                <div class="panel panel-warning " id="pedido" style="display: none">
                    <ul >
                        <%
                            ArrayList<CProveedores> datos=new DProveedores().consultar();
                            for(CProveedores v:datos){
                                String val=v.valor[0]+" "+user.valor[0];
                        %>
                        <li><a id="man_per" href="VComprasAdmin?val=<%=val%>"><%=v%></a></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </li>
            <li>
                <a href="javascript:Carga('venta.jsp', 'info');">
                    <i class="ti-bell"></i>
                    <p>Realizar Venta</p>
                </a>
            </li>
            <li>
                <a href="javascript:Carga('producto.jsp', 'info');">
                    <i class="ti-pencil-alt2"></i>
                    <p>Mis Productos</p>
                </a>
            </li>
            <li>
                <a href="javascript:Carga('mapa.jsp', 'info');">
                    <i class="ti-map"></i>
                    <p>Mapa</p>
                </a>
            </li>
            <li class="active-pro">
                <a href="javascript:Carga('material.jsp', 'info');">
                    <i class="ti-export"></i>
                    <p>Mis Materiales</p>
                </a>
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