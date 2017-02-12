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
                    
                      <div class="dropdown">
                        <a class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" >
                            <i class="ti-view-list-alt"></i>
                            Mantenimientos
                          <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_personas.jsp');">Persona</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_contacto.jsp');">Contactos</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_usuario.jsp');">Usuario</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_direcciones.jsp');">Direcciones</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_proveedores.jsp');">Proveedores</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_compras.jsp');">Compras</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_administradores.jsp');">Administradores</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_direcciones.jsp');">Direcciones</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_administradores.jsp');">Administradores</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_compras.jsp');">Compras</a></li>
                          <li><a id="man_per" href="#" onclick="$('#info').load('mantenimientos/man_administradores.jsp');">Administradores</a></li>

                          <li role="separator" class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                          <li>

                          </li>
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
									<p>Notificaciónes</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notificación 1</a></li>
                                <li><a href="#">Notificación 2</a></li>
                                <li><a href="#">Notificación 3</a></li>
                                <li><a href="#">Notificación 4</a></li>
                              </ul>
                        </li>
			<li>
                            <a href="#">
				<i class="ti-settings"></i>
				<p>Comfiguración</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content" id="info">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="image">
                                <img src="assets/img/background.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <img class="avatar border-white" src="assets/img/faces/face-2.jpg" alt="..."/>
                                  <h4 class="title">Chet Faker<br />
                                     <a href="#"><small>@chetfaker</small></a>
                                  </h4>
                                </div>
                                <p class="description text-center">
                                    "Alpaca Fuxion"
                                </p>
                            </div>
                            <hr>
                            <div class="text-center">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-1">
                                        <h5>12<br /><small>Archivos</small></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>2<br /><small>Pedidos</small></h5>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>24<br /><small>Ventas</small></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Equipo</h4>
                            </div>
                            <div class="content">
                                <ul class="list-unstyled team-members">
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        Claudia
                                                        <br />
                                                        <span class="text-muted"><small>Offline</small></span>
                                                    </div>

                                                    <div class="col-xs-3 text-right">
                                                        <button class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></button>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="assets/img/faces/face-1.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        Dennys
                                                        <br />
                                                        <span class="text-success"><small>Available</small></span>
                                                    </div>

                                                    <div class="col-xs-3 text-right">
                                                        <button class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></button>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="assets/img/faces/face-3.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        Lucho
                                                        <br />
                                                        <span class="text-danger"><small>Busy</small></span>
                                                    </div>

                                                    <div class="col-xs-3 text-right">
                                                        <button class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></button>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Editar Perfil</h4>
                            </div>
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Compañia</label>
                                                <input type="text" class="form-control border-input" disabled placeholder="Company" value="Creative Code Inc.">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Usuario</label>
                                                <input type="text" class="form-control border-input" placeholder="Username" value="michael23">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email</label>
                                                <input type="email" class="form-control border-input" placeholder="Email">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nombres</label>
                                                <input type="text" class="form-control border-input" placeholder="Nombres" value="Chet">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Apellidos</label>
                                                <input type="text" class="form-control border-input" placeholder="Apellidos" value="Faker">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Direccion</label>
                                                <input type="text" class="form-control border-input" placeholder="Direccion" value="Av. Sol">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Ciudad</label>
                                                <input type="text" class="form-control border-input" placeholder="Ciudad" value="Cusco">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Pais</label>
                                                <input type="text" class="form-control border-input" placeholder="Pais" value="Perú">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Codigo postal</label>
                                                <input type="number" class="form-control border-input" placeholder="Codigo Zip">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Cargo</label>
                                                <input type="text" class="form-control border-input" placeholder="Cargo" value="cargo o función">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Guardar</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


                        
</body>

    <!--   Core JS Files   -->


	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
                                
</html>
