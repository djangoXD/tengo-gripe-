<%@page import="modelo.DPersonas"%>
<%@page import="clases.CCliente"%>
<%@page import="modelo.DCliente"%>
<%@page import="modelo.DImagen"%>
<%@page import="clases.CVendedores"%>
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
    CPersonas per_vend = (CPersonas) request.getAttribute("per_vend");
    CUsuario usu_vend = (CUsuario) request.getAttribute("usu_vend");;
    CVendedores vend = (CVendedores) request.getAttribute("vend");
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
            alert(data[7]);
            alert(data[0]);
            $.post('carrito2', {
                cantidad: data[7],
                sum: 1,
                id_articulo: data[0]
            }, function (responseText) {
                $('#tablainfo').html(responseText);
            });
            var total = 0;
        }); 
        $('#dni_cliente').on('change', function () {
            $.post('buscar_cliente', {
                dni: $(this).val()
            }, function (responseText) {
                $('#cliente').html(responseText);
            });
            var total = 0;
        });


    });
    function limpiar() {
        $.post('carrito2', {
            cler: "desaprobado",
        }, function (responseText) {
            $('#tablainfo').html(responseText);
        });
    }
    ;
    function venta() {
        $.post('carrito2', {
            venta: "aprovado",
            id_admi: $('#idadmi').val(),
            id_prov: $('#idprov').val()
        }, function (responseText) {
            $('#mensaje').html(responseText);
        });
    }
    ;

</script>
<div class="container-fluid">
    <div class="col-lg-6">
        <div class="row">
            <div class="col-lg-6 col-md-6">

                <div class="card">
                    <div class="content ">

                        <div class="author">
                            <img class="avatar border-white" src="gg.jsp?imagen=<%=per_vend.valor[2]%>" alt="..."/>
                            <h4 class="title">
                                <%=usu_vend%><br />                                 
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
                                <p class="description text-left"><%=per_vend.valor[1]%> " <%=per_vend.valor[2]%> "</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">NOMBRES :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_vend.valor[3]%></p>                                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">APELLIDOS :</p>                                                    
                            </div>
                            <div class="col-xs-7">
                                <p class="description text-left"><%=per_vend.valor[4]%></p>                                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="card">
                    <div class="content ">
                        <div class="author">
                            <img class="avatar border-white" src="gg.jsp?imagen=<%=per_vend.valor[2]%>" alt="..."/>
                            <h4 class="title">
                                <%=usu_vend%><br />                                 
                            </h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-5">
                                <p class="description text-left">DOCUMENTO :</p>                                                    
                            </div>
                            <div class="col-xs-7">  
                                <input list="browsers" id="dni_cliente">
                                <datalist id="browsers">
                                    <%

                                        ArrayList<CCliente> k = new DCliente().consultar();
                                        for (CCliente x : k) {
                                            CPersonas pers = (CPersonas) new DPersonas().existe(x.valor[0], 9).get(0);
                                    %>
                                    <option value="<%=pers.valor[2]%>">FF</option>                                                                           
                                    <%
                                        }
                                    %>

                                </datalist>
                                <p class="description text-left"><%=per_vend.valor[1]%> " <%=per_vend.valor[2]%> "</p>
                            </div>
                            <div id="cliente">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <p class="description text-left">NOMBRES :</p>                                                    
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" id="nombre_cliente">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-5">
                                        <p class="description text-left">APELLIDOS :</p>                                                    
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" id="apellidos_cliente">
                                    </div>
                                </div>                                
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
        <div class="col-lg-12 col-md-12">
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

                                <input type="hidden"  id="idadmi" value="<%=per_vend.valor[9]%>">
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
    <div class="col-lg-6">
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
                                <th>Imagen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DArticulo d1 = new DArticulo();
                                ArrayList<CArticulo> datos = d1.consultar();
                                int n = new CArticulo().n;
                                for (CArticulo p : datos) {
                                    out.print("<tr>");
                                    for (int i = 0; i < n - 1; i++) {
                                        out.print("<td>" + p.valor[i] + "</td>");
                                    }
                                    CCategoria cat1 = new DCategoria().buscar_id(p.valor[n - 1]);
                                    out.print("<td>" + cat1.toString() + "</td>");
                                    if (new DImagen().existe(p.valor[0])) {
                            %>
                        <td>
                            <img name="warren" width="80" height="80" src="gg.jsp?imagen=<%=p.valor[0]%>">
                        </td>
                        <%
                            } else {%>
                        <td>
                            <img name="warren" width="80" height="80" src="images/gg.png">
                        </td>
                        <%}

                                out.print("</tr>");
                            }
                        %>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>                          
    </div>
