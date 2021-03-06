<%@page import="modelo.DCategoria"%>
<%@page import="clases.CCategoria"%>
<%@page import="java.util.ArrayList"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Alpaca Fuxion Moda y Más</title>
        <!-- meta-tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Wool Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
              SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //meta-tags -->
        <!-- Custom Theme files -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet"> 			<!-- font-awesome icons -->
        <!-- //Custom Theme files -->
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <!-- web-font -->
        <link href='//fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <!-- //web-font -->
    </head>

    <body>
        <!-- header -->
        <div class="header">
            <div class="container">
                <div class="header-nav">
                    <nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <h1><a class="navbar-brand" href="index.html"><span>A</span>lpaca <span>F</span>uxion</a></h1>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="hvr-bounce-to-bottom active"><a href="index.html">Inicio</a></li>
                                <li><a href="#" class="dropdown-toggle hvr-bounce-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Moda<span class="caret"></span></a>
                                    <ul class="dropdown-menu" id="menu">
                                        <script>
                                            function enviar(h1) {
                                                $.post('cargar_moda', {
                                                    moda: h1,
                                                }, function (responseText) {
                                                    $('#contenido').html(responseText);
                                                });
                                            }
                                        </script>

                                        <%
                                            ArrayList<CCategoria> datos_categoria = new DCategoria().consultar();
                                            for (CCategoria x : datos_categoria) {
                                        %>
                                            <li class="hvr-bounce-to-bottom"><a href="#" id="idmoda" onclick="enviar('<%=x.valor[0]%>')"><%=x.toString()%></div></a></li>
                                            <%
                                                }
                                            %>
                                    </ul>
                                </li>
                                <li class="hvr-bounce-to-bottom"><a href="#" onclick="$('#contenido').load('blog.html');">Conócenos</a></li>
                                <li class="hvr-bounce-to-bottom"><a href="#" onclick="$('#contenido').load('contact.html');">Contactanos</a></li>
                                <li class="hvr-bounce-to-bottom">
                                    <a href="#" data-toggle="modal" data-target="#myModal4">
                                        <span class="glyphicon glyphicon-user">
                                        </span>Inicias sesión
                                    </a>
                                </li>
                            </ul>
                        </div><!-- //navbar-collapse -->
                    </nav>
                </div>
            </div>
        </div>
        <!-- //header -->
        <!-- //modal -->
        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >
            <div class="modal-dialog" role="document">
                <div class="modal-content modal-info">
                    <div class="mymodal">
                        <div class="modal-header">
                            <label><a>Ingrese con su cuenta</a></label>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
                        </div>
                        <div class="modal-body modal-spa">
                            <div class="login-grids">
                                <div class="login-right">
                                    <form method="POST" action="admin/check.jsp">
                                        <div class="collapse navbar-collapse nav-wil">
                                            <label for="text" class="col-md-4 control-label" ><a>Usuario</a></label>
                                            <div class="col-md-6">
                                                <input id="email" type="text" class="form-control" maxlength="50" name="usuario" required autofocus>
                                            </div>
                                        </div><br>
                                        <div class="collapse navbar-collapse nav-wil">
                                            <label for="password" class="col-md-4 control-label"><a>Contraseña</a></label>
                                            <div class="col-md-6">
                                                <input id="password" type="password" class="form-control" name="clave" required>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="sing-in">
                                            <input type="submit" value="Iniciar sesión" >
                                            <input type="submit" value="Registrarse" onclick="this.form.action = 'RegistrarController'">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
        <div id="contenido">
            <!-- banner -->
            <div class="banner">
                <!-- Slider-starts-Here -->
                <script src="js/responsiveslides.min.js"></script>
                <script>
                                                                                                        // You can also use "$(window).load(function() {"
                                                                                                        $(function () {
                                                                                                            // Slideshow 3
                                                                                                            $("#slider3").responsiveSlides({
                                                                                                                auto: true,
                                                                                                                pager: true,
                                                                                                                nav: false,
                                                                                                                speed: 500,
                                                                                                                namespace: "callbacks",
                                                                                                                before: function () {
                                                                                                                    $('.events').append("<li>before event fired.</li>");
                                                                                                                },
                                                                                                                after: function () {
                                                                                                                    $('.events').append("<li>after event fired.</li>");
                                                                                                                }
                                                                                                            });

                                                                                                        });
                </script>
                <!-- //End-slider-script -->
                <div  id="top" class="callbacks_container">
                    <ul class="rslides" id="slider3">
                        <li>
                            <div class="banner-info">
                                <div class="baner-w3text">
                                    <h3>Hola!</h3>
                                    <p>La Mejor Calidad en Alpaca</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info1">
                                <div class="baner-w3text">
                                    <h3>Coleción de Invierno</h3>
                                    <p>Imperdible, descuentos de temporada</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info2">
                                <div class="baner-w3text">
                                    <h3>Be wild</h3>
                                    <p>Nuestra nueva linea juvenil.</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="banner-bottom-grids">
                    <div class="container">
                        <div class="col-md-3 banner-bottom-grid">
                            <div class="banner-bottom-grd w3-agile-back">
                                <img src="images/chompa1.jpg" class="img-no-padding img-responsive">
                                <div class="clearfix"></div>
                            </div>
                            <p class="w3ltext">Colección otoño.</p>
                            <div class="more more4">
                                <a href="single.html">S/.50.00</a>
                            </div>
                        </div>
                        <div class="col-md-3 banner-bottom-grid">
                            <div class="banner-bottom-grd w3-agile-back1">
                                <img src="images/poncho1.jpg" class="img-no-padding img-responsive">
                                <div class="clearfix"> </div>
                            </div>
                            <p class="w3ltext">Nueva temporada.</p>
                            <div class="more more1">
                                <a href="single.html">S/.70.00</a>
                            </div>
                        </div>
                        <div class="col-md-3 banner-bottom-grid">
                            <div class="banner-bottom-grd w3-agile-back2">
                                <img src="images/chompa2.jpg" class="img-no-padding img-responsive">
                                <div class="clearfix"> </div>
                            </div>
                            <p class="w3ltext">Colección invierno.</p>
                            <div class="more more2">
                                <a href="single.html">S/.40.00</a>
                            </div>
                        </div>
                        <div class="col-md-3 banner-bottom-grid">
                            <div class="banner-bottom-grd w3-agile-back3">
                                <img src="images/poncho2.jpg" class="img-no-padding img-responsive">
                                <div class="clearfix"> </div>
                            </div>
                            <p class="w3ltext">Colección invierno.</p>
                            <div class="more more3">
                                <a href="single.html">S/.80.00</a>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //banner -->
            <!-- welcome -->
            <div class="welcome w3-agileits">
                <div class="container">
                    <h2>Bienvenido !</h2>
                    <div class="banner-agileits-w3layouts">
                        <div class="col-md-4 welcome-grid">
                            <img src="images/1.jpg" alt=" " class="img-responsive" />
                        </div>
                        <div class="col-md-8 welcome-grid">
                            <h4>Lo mejor en alpaca y vicuña te espera</h4>
                            <p> En nuestra tienda podras encontrar una diversidad de prendas con diseños
                                tradicionales, con la mejor calidad y una atencion siempre amaple, ademas
                                tambien encontraras accesorios, carteras, aretes y mas; no te lo pierdas;
                                estamos esperando tu visita.</p>
                            <div class="more">
                                <a href="#" onclick="$('#contenido').load('moda.jsp');">Ver</a>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //welcome -->
            <!-- newsletter -->
            <div class="newsletter">
                <div class="container">
                    <div class="get-in-grids">
                        <div class="get-in-grid-left">
                            <p>Preguntar</p>
                        </div>
                        <div class="get-in-grid-right">
                            <form action="#" method="post">
                                <input type="email" name="email" Placeholder="Enter Your Mail..." required="">
                                <input type="submit" value="Subscribe" >
                            </form>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //newsletter -->
            <!-- news -->
            <div class="news">
                <div class="container">
                    <h3>Noticias y Eventos</h3>
                    <p class="news-wthreetext">Actividades nacionales e internacionales de moda en la que la
                        tienda estara presente</p>
                    <div class="news-agileinfo">
                        <div class="col-md-6 news-grid">
                            <div class="col-xs-4 news-grid-left">
                                <p>22nd<span>Sept</span></p>
                            </div>
                            <div class="col-xs-8 news-grid-right">
                                <p>Itaque earum rerum hic tenetur a sapiente
                                    delectus, ut aut reiciendis voluptatibus maiores alias consequatur
                                    aut perferendis doloribus asperiores repellat.</p>
                                <div class="more">
                                    <a href="single.html">Read More</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col-md-6 news-grid">
                            <div class="col-xs-4 news-grid-left">
                                <p>28th<span>Sept</span></p>
                            </div>
                            <div class="col-xs-8 news-grid-right">
                                <p>Itaque earum rerum hic tenetur a sapiente
                                    delectus, ut aut reiciendis voluptatibus maiores alias consequatur
                                    aut perferendis doloribus asperiores repellat.</p>
                                <div class="more">
                                    <a href="single.html">Read More</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="news-agileinfo">
                        <div class="col-md-6 news-grid">
                            <div class="col-xs-4 news-grid-left">
                                <p>11th<span>Oct</span></p>
                            </div>
                            <div class="col-xs-8 news-grid-right">
                                <p>Itaque earum rerum hic tenetur a sapiente
                                    delectus, ut aut reiciendis voluptatibus maiores alias consequatur
                                    aut perferendis doloribus asperiores repellat.</p>
                                <div class="more">
                                    <a href="single.html">Read More</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col-md-6 news-grid">
                            <div class="col-xs-4 news-grid-left">
                                <p>25th<span>Oct</span></p>
                            </div>
                            <div class="col-xs-8 news-grid-right">
                                <p>Itaque earum rerum hic tenetur a sapiente
                                    delectus, ut aut reiciendis voluptatibus maiores alias consequatur
                                    aut perferendis doloribus asperiores repellat.</p>
                                <div class="more">
                                    <a href="single.html">Read More</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //news -->
            <!-- customer -->
            <div class="customer">
                <div class="container">
                    <h3>Comentarios de nustros clientes</h3>
                    <div class="customer-w3layoutsgrids">
                        <ul id="flexiselDemo1">
                            <li>
                                <div class="customer-grid">
                                    <p> Tienen una muy buena atencion, y la roopa es de muy buena calidad
                                        y los diseños me encantas, siempre quedo sadisfecho despues de cada
                                        compra, siempre vuelvo; lo recomiendo siempre, es un lugar a donde
                                        tiene que ir.</p>
                                    <h4>John Smith</h4>
                                </div>
                            </li>
                            <li>
                                <div class="customer-grid">
                                    <p> Siempre encuentro descuentos increible, amo comprar en alpaca fuxion
                                        porque encuentro los modelos que me gustan y con una muy buena calidad,
                                        siempre con una atención amable y oportuna.</p>
                                    <h4>Micheal Robert</h4>
                                </div>
                            </li>
                            <li>
                                <div class="customer-grid">
                                    <p> Me gusta mucho poder ver las nuevas novedades de la tienda atravez de
                                        su sitio web, e ir a comprarlas inmediatamentes, siempre contestan las
                                        llamadas y contestan rapidamente los correos, lo recomiendo.</p>
                                    <h4>Williumson</h4>
                                </div>
                            </li>
                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo1").flexisel({
                                    visibleItems: 3,
                                    animationSpeed: 1000,
                                    autoPlay: true,
                                    autoPlaySpeed: 3000,
                                    pauseOnHover: true,
                                    enableResponsiveBreakpoints: true,
                                    responsiveBreakpoints: {
                                        portrait: {
                                            changePoint: 480,
                                            visibleItems: 1
                                        },
                                        landscape: {
                                            changePoint: 640,
                                            visibleItems: 2
                                        },
                                        tablet: {
                                            changePoint: 768,
                                            visibleItems: 2
                                        }
                                    }
                                });

                            });
                        </script>
                        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                    </div>
                </div>
            </div>
            <!-- //customer -->
        </div>
        <!-- footer -->
        <div class="footer">
            <div class="container">
                <div class="footer-agileitsrow">
                    <div class="col-md-3 footer-grid">
                        <h3>Extras</h3>
                        <p>Si ustede desea algun pedido grande en especial no dude en contactarnos, relizamos ventas al por mayor con increibles descuentos; con una atención de calidad.</p>
                    </div>
                    <div class="col-md-3 footer-grid">
                        <h3>Redes Sociales</h3>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
                            <li><a href="#"><i class="fa fa-google" aria-hidden="true"></i> Google+</a></li>
                            <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i> Dribbble</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-grid">
                        <h3>Info</h3>
                        <ul>
                            <li><a href="index.html">Inicio</a></li>
                            <li><a href="index.html">Moda</a></li>
                            <li><a href="#" onclick="$('#contenido').load('blog.html');">Conócenos</a></li>
                            <li><a href="#" onclick="$('#contenido').load('contact.html');">Contactanos</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-grid">
                        <h3>Contactanos</h3>
                        <p>Estamos a su servicio no dude en consultarnos.</p>
                        <div class="footer-grid-address">
                            <p>Tel.800-255-9999</p>
                            <p>Fax: 1234 568</p>
                            <p>Email: <a class="email-link" href="mailto:alpacafuxion@gmail.com">Example.com</a></p>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //footer -->
        <!-- start-smooth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">


                                                    jQuery(document).ready(function ($) {
                                                        $(".scroll").click(function (event) {
                                                            event.preventDefault();

                                                            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                                                        });
                                                    });
        </script>
        <!-- //end-smooth-scrolling -->
        <!-- smooth-scrolling-of-move-up -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear'
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>
        <!-- //smooth-scrolling-of-move-up -->
        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
    </body>
</html>
