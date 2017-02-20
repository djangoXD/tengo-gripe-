<%@page import="clases.CDirecciones"%>
<%@page import="clases.CContacto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CCliente"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CUsuario"%>
<%
     CCliente pro=(CCliente)request.getAttribute("admi");
     CPersonas per=(CPersonas)request.getAttribute("per_admi");
     CUsuario usu=(CUsuario)request.getAttribute("usu_admi");;
     ArrayList<CContacto> con=(ArrayList)request.getAttribute("con");;
     ArrayList<CDirecciones> dir=(ArrayList)request.getAttribute("dir");;
 
%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#proveedores').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#proveedores tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("pro0").value=data[0];
                document.getElementById("pro1").value=data[1];
                document.getElementById("pro2").value=data[2];
                document.getElementById("pro3").value=data[3];

                $('#modal_modificar_proveedores').modal('show');
            } );
    } );

</script>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                                <div class="image">
                                <img src="assets/img/background.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <img class="avatar border-white" src="gg.jsp?imagen=<%=per.valor[2]%>" alt="..."/>
                                  <h4 class="title"><%=usu.valor[1]%><br />

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
                                <h4 class="title">Equipo y Contactos</h4>
                            </div>
                            <div class="content">
                                <ul class="list-unstyled team-members">
                                            <li>
                                                <div class="row">
                                                    <form action="VAdminController" method="post">                                                    
                                                        <div class="col-xs-2">
                                                            <div class="avatar">
                                                                <img src="assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <input type="text" class="form-control" name="tipo_contacto"> 
                                                            <br />
                                                            <span class="text-muted"><small>Tipo Contacto</small></span>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <input type="text" class="form-control" name="numero"> 
                                                            <br />
                                                            <span class="text-muted"><small>Numero</small></span>
                                                        </div>
                                                            <input type="hidden"  name="id_persona" value="<%=per.valor[0]%>"> 
                                                            <input type="hidden"  name="id_usuario" value="<%=usu.valor[0]%>"> 


                                                        <div class="col-xs-2 text-right">
                                                            <button class="btn btn-sm btn-primary btn-icon" name="insertContacto"><i class="fa fa-save"></i></button>
                                                            <span class="text-muted"><small>Nuevo</small></span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </li>    
                                    <%
                                        for(CContacto x:con){
                                    %>
                                            <li>
                                                <div class="row">
                                                    <form action="VAdminController" method="post">                                                    
                                                        <div class="col-xs-2">
                                                            <div class="avatar">
                                                                <img src="assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <input type="text" class="form-control" name="tipo_contacto" value="<%=x.valor[1]%>"> 
                                                            <br />
                                                            <span class="text-muted"><small>Tipo Contacto</small></span>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <input type="text" class="form-control" name="numero" value="<%=x.valor[2]%>"> 
                                                            <br />
                                                            <span class="text-muted"><small>Numero</small></span>
                                                        </div>
                                                            <%
                                                            ///es importante este input tipo hide
                                                            %>
                                                            <input type="hidden"  name="id_persona" value="<%=per.valor[0]%>"> 
                                                            <input type="hidden"  name="_id" value="<%=x.valor[0]%>"> 
                                                            <input type="hidden"  name="id_usuario" value="<%=usu.valor[0]%>"> 

                                                        <div class="col-xs-2 text-right">
                                                            <button class="btn btn-sm btn-danger btn-icon" name="delContacto"><i class="fa fa-close"></i></button>
                                                            <span class="text-muted"><small>Quitar</small></span>
                                                            <button class="btn btn-sm btn-success btn-icon" name="modContacto"><i class="fa fa-gears"></i></button>
                                                            <span class="text-muted"><small>Guardar</small></span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </li>
                                            <%
                                            
                                            }%>
                                        </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Editar Usuario</h4>
                            </div>
                            <div class="content">
                                <form action="VAdminController" method="post">
                                    <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Usuario</label>
                                                    <input name="usuario" type="text" class="form-control border-input" placeholder="Username" value="<%=usu.valor[1]%>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Password</label>
                                                    <input name="contrasena" type="password" class="form-control border-input" >
                                                </div>
                                            </div>

                                            <input type="hidden"  name="_id" value="<%=usu.valor[0]%>">           
                                            <input type="hidden"  name="id_usuario" value="<%=usu.valor[0]%>">           

                                            <div class="text-center">
                                                <button name="actUser" type="submit" class="btn btn-info btn-fill btn-wd">Guardar</button>
                                            </div>
                                            <div class="clearfix"></div>
 
                                    </div>

                                </form>                                            
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
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nombres</label>
                                                <input name="nombres" type="text" class="form-control border-input" placeholder="Nombres" value="<%=per.valor[3]%>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Apellidos</label>
                                                <input name="apellidos" type="text" class="form-control border-input" placeholder="Apellidos" value="<%=per.valor[4]%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tipo de Documento</label>
                                                <input name="tipo_documento" type="text" class="form-control border-input" placeholder="Tipo de Documento" value="<%=per.valor[1]%>">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Nro Documento</label>
                                                <input name="nro_documento" type="text" class="form-control border-input" placeholder="Nro Documento" value="<%=per.valor[2]%>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Sexo</label>
                                                <input name="sexo" type="text" class="form-control border-input" placeholder="Sexo" value="<%=per.valor[6]%>">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Fecha de Engendramiento</label>
                                                <input name="fecha_nacimiento" type="text" class="form-control border-input" placeholder="Fecha de nacimiento" value="<%=per.valor[5]%>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input name="email" type="text" class="form-control border-input" placeholder="Email" value="<%=per.valor[7]%>" >
                                            </div>
                                        </div>
                                    </div>

                                    <input type="hidden"  name="_id" value="<%=per.valor[0]%>"> 
                                    <input type="hidden"  name="id_usuario" value="<%=usu.valor[0]%>"> 
                                    <input type="hidden"  name="id_entidad" value="<%=pro.valor[0]%>"> 
                                            
                                    <div class="text-center">
                                        <button name="actPersona" type="submit" class="btn btn-info btn-fill btn-wd">Guardar</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                                           <div class="card">
                            <div class="header">
                                <h4 class="title">Direcciones</h4>
                            </div>
                            <div class="content">
                                <ul class="list-unstyled team-members">
                                    <li>
                                                <form action="VAdminController" method="post" method="post">                                                    
                                                    <div class="row">

                                                            <div class="col-xs-2">
                                                                <div class="avatar">
                                                                    <img src="assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                                </div>
                                                                <div class="col-xs-12">
                                                                    <input  type="text" class="form-control" name="codigo_postal" > 
                                                                    <br />
                                                                    <span class="text-muted"><small>Codigo Postal</small></span>
                                                                </div>

                                                            </div>
                                                            <div class="col-xs-8">
                                                                <div class="col-xs-3">
                                                                    <input  type="text" class="form-control" name="ubigeo" > 
                                                                    <br />
                                                                    <span class="text-muted"><small>Ubigeo</small></span>
                                                                </div>
                                                                <div class="col-xs-9">
                                                                    <input  type="text" class="form-control" name="direccion"> 
                                                                    <br />
                                                                    <span class="text-muted"><small>Direccion</small></span>
                                                                </div>
                                                                <div class="col-xs-12">
                                                                    <textarea type="textarea" class="form-control" name="referencia" >
                                                                    </textarea>
                                                                    <br />
                                                                    <span class="text-muted"><small>Referencia</small></span>
                                                                </div>
                                                            </div>
                                                            <input type="hidden"  name="id_persona" value="<%=per.valor[0]%>"> 
                                                            <input type="hidden"  name="id_usuario" value="<%=usu.valor[0]%>"> 

                                                            <div class="col-xs-2 text-right">
                                                                <div class="col-xs-6">
                                                                    <button class="btn btn-sm btn-primary btn-icon" name="insertDireccion"><i class="fa fa-save"></i></button>
                                                                    <span class="text-muted"><small>Nuevo</small></span>
                                                                </div>

                                                            </div>

                                                    </div>
                                                </form>
                                            </li>
                                    <%
                                        for(CDirecciones x:dir){
                                    %>
                                            <li>
                                                <form action="VAdminController" method="post">                                                    
                                                    <div class="row">

                                                             <div class="col-xs-2">
                                                                <div class="avatar">
                                                                    <img src="assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                                </div>
                                                                <div class="col-xs-12">
                                                                    <input  type="text" class="form-control" name="codigo_postal" value="<%=x.valor[4]%>" > 
                                                                    <br />
                                                                    <span class="text-muted"><small>Codigo Postal</small></span>
                                                                </div>

                                                            </div>
                                                            <div class="col-xs-8">
                                                                <div class="col-xs-3">
                                                                    <input  type="text" class="form-control" name="ubigeo" value="<%=x.valor[1]%>" > 
                                                                    <br />
                                                                    <span class="text-muted"><small>Ubigeo</small></span>
                                                                </div>
                                                                <div class="col-xs-9">
                                                                    <input  type="text" class="form-control" name="direccion" value="<%=x.valor[2]%>"> 
                                                                    <br />
                                                                    <span class="text-muted"><small>Direccion</small></span>
                                                                </div>
                                                                <div class="col-xs-12">
                                                                    <textarea type="textarea" class="form-control" name="referencia"  ><%=x.valor[3]%>
                                                                    </textarea>
                                                                    <br />
                                                                    <span class="text-muted"><small>Referencia</small></span>
                                                                </div>
                                                            </div>
                                                            <input type="hidden"  name="id_persona" value="<%=per.valor[0]%>"> 
                                                            <input type="hidden"  name="id_usuario" value="<%=usu.valor[0]%>"> 
                                                            <input type="hidden"  name="_id" value="<%=x.valor[0]%>"> 

                                                            <div class="col-xs-2 text-right">
                                                                <div class="col-xs-6">
                                                                    <button name="delDireccion"  class="btn btn-sm btn-danger btn-icon"><i class="fa fa-close"></i></button>
                                                                    <span class="text-muted"><small>Quitar</small></span>
                                                                </div>
                                                                <div class="col-xs-6">
                                                                    <button name="saveDireccion" class="btn btn-sm btn-success btn-icon"><i class="fa fa-gears"></i></button>
                                                                    <span class="text-muted"><small>Guardar</small></span>
                                                                </div>
                                                            </div>

                                                    </div>
                                                </form>
                                            </li>
                                            

                                            <%
                                            
                                            }%>
                                            
                                        </ul>
                            </div>
                        </div>  
                    </div>
                </div>                                            
            </div>                                           
            </div>