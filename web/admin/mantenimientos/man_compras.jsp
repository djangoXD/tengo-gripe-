<%@page import="modelo.DAdministradores"%>
<%@page import="clases.CAdministradores"%>
<%@page import="clases.CPersonas"%>
<%@page import="modelo.DProveedores"%>
<%@page import="clases.CProveedores"%>
<%@page import="clases.CCompras"%>
<%@page import="modelo.DCompras"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>

<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#compras').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#compras tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("com0").value=data[0];
                document.getElementById("com1").value=data[1];
                document.getElementById("com2").value=data[2];
                $('#modal_modificar_compras').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Compras</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_compras">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="compras" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Fecha Compra</th>
						<th>Fecha Entrega</th>	
                                                <th>Proveedor</th>
                                                <th>Administrador</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DCompras compc=new DCompras();
                    ArrayList<CCompras> con_datos=compc.consultar();
                    int n =new CCompras().n;
                for(CCompras p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<n-2;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
                   CProveedores per1=new  DProveedores().buscar_id(p.valor[n-2]);
                   out.print("<td>"+per1.toString()+"</td>");

                   CAdministradores admi1=new DAdministradores().buscar_id(p.valor[n-1]);
                   out.print("<td>"+admi1.toString()+"</td>");

                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_compras" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ComprasController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Compra</span>
                      <input type="text" class="form-control" name="fecha_compra" id="idcom1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Entrega</span>
                      <input type="text" class="form-control" name="fecha_entrega" id="idcom2" required/>
                    </div>
                  </div>    
                 <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Proveedores</span>
                          <select class="form-control" name="id_proveedor" id="idusu4" required>
                              <%
                              ArrayList<CProveedores> datos_proveedores=new DProveedores().consultar();
                              for(CProveedores x:datos_proveedores){
                                  %>
                                  <option value="<%=x.valor[0]%>"> <%=x.toString()%></option>
                              <%
                              }
                              %>
                          </select>

                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Administradores</span>
                          <select class="form-control" name="id_administrador" id="idusu4" required>
                              <%
                              ArrayList<CAdministradores> datos_administradores=new DAdministradores().consultar();
                              for(CAdministradores x:datos_administradores){
                                  %>
                                  <option value="<%=x.valor[0]%>"> <%=x.toString()%></option>
                              <%
                              }
                              %>
                          </select>

                        </div>
                      </div>
                 
            </div>
            <div class="modal-footer">
              <button  type="text" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button  type="submit" class="btn btn-primary" name="insertar">Insertar</button>
            </div>
        </form>
    </div>
  </div>
</div>


<div class="modal fade" id="modal_modificar_compras" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ComprasController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="com0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Compra</span>
                      <input type="text" class="form-control" name="fecha_compra" id="com1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Entrega</span>
                      <input type="text" class="form-control" name="fecha_entrega" id="com2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Proveedores</span>
                          <select class="form-control" name="id_proveedor" id="idusu4" required>
                              <%
                              datos_proveedores=new DProveedores().consultar();
                              for(CProveedores x:datos_proveedores){
                                  %>
                                  <option value="<%=x.valor[0]%>"> <%=x.toString()%></option>
                              <%
                              }
                              %>
                          </select>

                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Administradores</span>
                          <select class="form-control" name="id_administrador" id="idusu4" required>
                              <%
                              datos_administradores=new DAdministradores().consultar();
                              for(CAdministradores x:datos_administradores){
                                  %>
                                  <option value="<%=x.valor[0]%>"> <%=x.toString()%></option>
                              <%
                              }
                              %>
                          </select>

                        </div>
                      </div>
                 
            
            <div class="modal-footer">
              <button  type="text" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button  type="submit" class="btn btn-primary" name="modificar" >Modificar</button>
              <button  type="submit" class="btn btn-danger" name="eliminar">Eliminar</button>
            </div>
    </div>
                    </form>

  </div>
</div>
                                			
