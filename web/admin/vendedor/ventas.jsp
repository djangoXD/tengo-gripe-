<%@page import="modelo.DAdministradores"%>
<%@page import="modelo.DCategoria"%>
<%@page import="clases.CCategoria"%>
<%@page import="clases.CArticulo"%>
<%@page import="modelo.DArticulo"%>
<%@page import="clases.CProveedores"%>
<%@page import="modelo.DProveedores"%>
<%@page import="clases.CDirecciones"%>
<%@page import="clases.CContacto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CAdministradores"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CUsuario"%>
<%
    CPersonas per_admi = (CPersonas) request.getAttribute("per_admi");
    CUsuario usu_admi = (CUsuario) request.getAttribute("usu_admi");;
    out.println(per_admi);
    CPersonas per_prov = (CPersonas) request.getAttribute("per_prov");
    CUsuario usu_prov = (CUsuario) request.getAttribute("usu_prov");
    CProveedores prov = (CProveedores) request.getAttribute("prov");
%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function () {
        var table = $('#example').DataTable({
            "columnDefs": [
                {
                    "targets": [0],
                    "visible": false,
                    "searchable": true
                },
                {
                    "targets": [2],
                    "visible": false,
                    "searchable": true
                },
                {
                    "targets": [5],
                    "visible": false,
                    "searchable": true
                }, {
                    "targets": [6],
                    "visible": false,
                    "searchable": true
                },
            ]
        });
        var table2 = $('#articulos').DataTable();
        $('#example tbody').on('click', 'tr', function () {
            var data = table.row(this).data();
            $.post('carrito2', {
                cantidad: data[7],
                sum: 1,
                id_articulo: data[0]
            }, function (responseText) {
                $('#tablainfo').html(responseText);
            });
            var total = 0;
        });


    });
    function limpiar(){
            $.post('carrito2', {
                cler: "desaprobado",
            }, function (responseText) {
                $('#tablainfo').html(responseText);
            });        
    };
    function venta(){
            $.post('carrito2', {
                venta: "aprovado",
                id_admi: $('#idadmi').val(),
                id_prov:$('#idprov').val()
            }, function (responseText) {
                $('#mensaje').html(responseText);
            });        
    };

</script>
<div class="container-fluid">
    <div class="col-lg-6">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="card">
                    <div class="content ">
                        <div class="author">
                            <img class="avatar border-white" src="gg.jsp?imagen=<%=per_admi.valor[2]%>" alt="..."/>
                            <h4 class="title">
                                <%=usu_admi%><br />                                 
                            </h4>
                        </div>
                        <p class="description text-center">
                            "Alpaca Fuxion"
                        </p>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">DOCUMENTO :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_admi.valor[1]%> " <%=per_admi.valor[2]%> "</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">NOMBRES :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_admi.valor[3]%></p>                                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">APELLIDOS :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_admi.valor[4]%></p>                                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="card">
                    <div class="content ">
                        <div class="author">
                            <img class="avatar border-white" src="gg.jsp?imagen=<%=per_prov.valor[2]%>" alt="..."/>
                            <h4 class="title">
                                <%=usu_prov%><br />                                 
                            </h4>
                        </div>
                        <p class="description text-center">
                            "Alpaca Fuxion"
                        </p>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">DOCUMENTO :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_prov.valor[1]%> " <%=per_prov.valor[2]%> "</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">NOMBRES :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_prov.valor[3]%></p>                                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">APELLIDOS :</p>                                        
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_prov.valor[4]%></p>                                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">RUC :</p>                                        
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=prov.valor[1]%></p>                                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">RAZON SOCIAL :</p>                                        
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=prov.valor[2]%></p>                                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12">

            <div class="card">
                <div class="header">
                    <h4 class="title">Lista de Articulos</h4>
                </div>
                <br><br>
                <div class="dataTable_wrapper table-responsive">
                    <table id="example" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Costo Unitario</th>
                                <th>Stock</th>
                                <th>Material</th>
                                <th>Categoria</th>
                                <th>cantidad</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                DArticulo d1 = new DArticulo();
                                ArrayList<CArticulo> datos = d1.consultar();
                                int n = new CArticulo().n;
                                for (CArticulo p : datos) {
                                    out.print("<tr>");

                                    for (int i = 0; i < n; i++) {
                                        out.print("<td>" + p.valor[i] + "</td>");
                                    }
                                    out.print("<td>1</td>");

                                    out.print("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <div class="col-lg-6 col-md-5">
        <div class="card">
            <div class="header">
                <h4 class="title">Articulos A Comprar</h4>
            </div>
            <div class="content ">
                <div class="author">
                    <div class="dataTable_wrapper table-responsive">
                        <table id="articulos" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Catidad</th>
                                    <th>Concepto</th>
                                    <th>Costo Unitario</th>
                                    <th>Costo</th>
                                </tr>
                            </thead>
                            <tbody id="tablainfo">

                            </tbody>
                        </table>
                        <div>

                            <input type="hidden"  id="idprov" value="<%=prov.valor[0]%>">
                            <input type="hidden"  id="idadmi" value="<%=per_admi.valor[9]%>">
                            <button class="btn btn-primary" onclick="venta()">Realizar venta</button>
                            <button class="btn btn-danger" onclick="limpiar()">Limpiar</button>
                        </div>
                        <div id="mensaje">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
