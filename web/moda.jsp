<%-- 
    Document   : moda
    Created on : 20-feb-2017, 17:42:50
    Author     : Alexsandra CB
--%>
<%@page import="clases.CArticulo"%>
<%@page import="modelo.DArticulo"%>
<%@page import="modelo.DImagen"%>
<%@page import="modelo.DCategoria"%>
<%@page import="clases.CCategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Moda</title>
    </head>
    <body>
        <!-- short codes -->
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
                <!--probando probando-->
                
                <!--probando probando-->
		<!-- //End-slider-script -->
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
					<div class="banner-info3">
						<div class="baner-w6text">
							<h3>La Mejor Calidad en Alpaca</h3>
						</div>
					</div>
				</li>
				<li>
					<div class="banner-info4">
						<div class="baner-w6text">
							<h3>La Mejor Calidad en Alpaca</h3>
						</div>
					</div>
				</li>
				<li>
					<div class="banner-info5">
						<div class="baner-w6text">
							<h3>La Mejor Calidad en Alpaca</h3>
						</div>
					</div>
				</li>
			</ul>
		</div>
        </div>
        <br>
	<div class="banner-bottom-grids">
        </div>
        <!--fotos-->
        <%
            String res=request.getParameter("warren");
            String id_moda=request.getParameter("moda");
                    DArticulo d1=new DArticulo();
                    ArrayList<CArticulo> DATOS2=new DArticulo().existe(id_moda, 6);

                        for(CArticulo d: DATOS2)out.println(d);
                    ArrayList<CArticulo> datos=d1.consultar();
                    int  n=new CArticulo().n;
                    int aux=0;
                    int total=0;

                    for(CArticulo p: datos){
                        CCategoria cat1=new DCategoria().buscar_id(p.valor[n-1]);
                        total++;
                    }
                    int count=0;
                    
                    for(CArticulo p: datos){
                        CCategoria cat1=new DCategoria().buscar_id(p.valor[n-1]);
                        if(count==0)
                        {
                            %>
                            <div class="container">
                            <%
                        }
                        if(count%4==0 && count!=0){
                            aux=0;
                            %>
                            <div class="clearfix"> </div>
                            </div><br>
                            <div class="container">
                           <%
                        }
                        %>
                        <div class="col-md-3 banner-bottom-grid">
                            <%
                            if(aux==0)
                            {
                                %>
                            <div class="banner-bottom-grd w3-agile-back">
                        <%
                            }else{
                            %>
                                <div class="banner-bottom-grd w3-agile-back<%=aux%>">
                            <%
                            }
                        if(new DImagen().existe(p.valor[0])){
                        %>
                                        <img src="gg.jsp?imagen=<%=p.valor[0]%>" class="img-no-padding img-responsive">
                                        <%
                        }else{%>
                                        <img src="images/gg.png" class="img-no-padding img-responsive">
                                    <%}
                        %>
                                <div class="clearfix"></div>
                            </div>
                            <p class="w3ltext"><%=p.valor[1]%></p>
                            <%
                                int auxx=0;
                                    if(aux==0)
                                    {
                                        auxx=4;
                                    }
                                    if(aux==1)
                                    {
                                        auxx=1;
                                    }
                                    if(aux==2)
                                    {
                                        auxx=2;
                                    }
                                    if(aux==3)
                                    {
                                        auxx=3;
                                    }
                                 %>
                                    <div class="more more<%=auxx%>">
                                    <a href="single.html">S/.<%=p.valor[3]%></a>
                            </div>
                        </div>
                                    <%
                        aux++;
                        count++;
                        if(count==total)
                        {
                            %>
                            </div><br>
                            <%
                        }                 
                }
                %>
	<!-- //short-codes --> 
    </body>
</html>
