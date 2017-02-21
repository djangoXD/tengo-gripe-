<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Administrador</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">

                <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.bootstrap.css">

	<script type="text/javascript" language="javascript" src="js/jquery.js">	</script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.bootstrap.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.responsive.js">	</script>
	<script type="text/javascript" language="javascript" src="js/responsive.bootstrap.js"></script>

        <link href="css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <script src="js/fileinput.min.js" type="text/javascript"></script>

</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    Alpaca Fuxion
                </a>
            </div>

            <ul class="nav">
                    <li>
                        <a id="reportes" href="#">
                            <i class="ti-panel"></i>
                            <p>Reportes</p>
                        </a>
                    </li>
                <li class="active">
                    <a href="usuarios.html">
                        <i class="ti-user"></i>
                        <p>Perfil de Usuario</p>
                    </a>
                </li>
                <li>

                       <a onclick="mos_man()">
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
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_proveedor_categoria.jsp');">Proveedor Categoria</a></li>


                        </ul>
                    </div>
                </li>
                <li>
                    <a href="javascript:Carga('pedido.jsp', 'info');">
                        <i class="ti-text"></i>
                        <p>Hacer pedido</p>
                    </a>
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

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Bienvenido</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>Stats</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">4</p>
									<p>Notificaciones</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notificacion 1</a></li>
                                <li><a href="#">Notificacion 2</a></li>
                                <li><a href="#">Notificacion 3</a></li>
                                <li><a href="#">Notificacion 4</a></li>
                              </ul>
                        </li>
			<li>
                            <a href="#">
				<i class="ti-settings"></i>
				<p>Comfiguracion</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content" id="info">
