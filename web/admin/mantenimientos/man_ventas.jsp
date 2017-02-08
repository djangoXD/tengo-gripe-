
<%@page import="modelo.DCliente"%>
<%@page import="clases.CCliente"%>
<%@page import="modelo.DPersonal_reparto"%>
<%@page import="clases.CPersonal_reparto"%>
<%@page import="modelo.DVendedores"%>
<%@page import="clases.CVendedores"%>
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CVentas"%>
<%@page import="modelo.DVentas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#ventas').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#ventas tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("con0").value=data[0];
                document.getElementById("con1").value=data[1];
                document.getElementById("con2").value=data[2];

                $('#modal_modificar_ventas').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Ventas</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_ventas">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="ventas" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Tipo Ventas</th>
						<th>Numero</th>	
                                                <th>Vendedor</th>
                                                <th>Reparto</th>
                                                <th>Cliente</th>
                                                
					</tr>
				</thead>
				<tbody>
                <%
                    DVentas contac=new DVentas();
                    ArrayList<CVentas> con_datos=contac.consultar();
                    int n =new CVentas().n;
                for(CVentas p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<n-3;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
                   
                   CVendedores tmp1=new DVendedores().buscar_id(p.valor[n-3]);
                   out.print("<td>"+tmp1.toString()+"</td>");

                   CPersonal_reparto tmp2=new DPersonal_reparto().buscar_id(p.valor[n-2]);
                   out.print("<td>"+tmp2.toString()+"</td>");

                   CCliente tmp3=new DCliente().buscar_id(p.valor[n-1]);
                   out.print("<td>"+tmp3.toString()+"</td>");

                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_ventas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="VentasController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Hora</span>
                      <input type="text" class="form-control" name="fecha_hora" id="idcon1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Tipo</span>
                      <input type="text" class="form-control" name="tipo" id="idcon2" required/>
                    </div>
                  </div>

                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Vendedor</span>
                          <select class="form-control" name="id_vendedor" id="idcon3" required>
                              <%
                              ArrayList<CVendedores> datos_vendedores=new DVendedores().consultar();
                              for(CVendedores x:datos_vendedores){
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
                          <span class="input-group-addon">Personal Reparto</span>
                          <select class="form-control" name="id_personal_reparto" id="idcon4" required>
                              <%
                              ArrayList<CPersonal_reparto> datos_personal_reparto=new DPersonal_reparto().consultar();
                              for(CPersonal_reparto x:datos_personal_reparto){
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
                          <span class="input-group-addon">Cliente</span>
                          <select class="form-control" name="id_cliente" id="idcon5" required>
                              <%
                              ArrayList<CCliente> datos_cliente=new DCliente().consultar();
                              for(CCliente x:datos_cliente){
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


<div class="modal fade" id="modal_modificar_ventas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="VentasController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="con0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Tipo Ventas</span>
                      <input type="text" class="form-control" name="tipo_ventas" id="con1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Numero</span>
                      <input type="text" class="form-control" name="numero" id="con2" required/>
                    </div>
                  </div>
                                       <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Vendedor</span>
                          <select class="form-control" name="id_vendedor" id="idcon3" required>
                              <%
                             datos_vendedores=new DVendedores().consultar();
                              for(CVendedores x:datos_vendedores){
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
                          <span class="input-group-addon">Personal Reparto</span>
                          <select class="form-control" name="id_personal_reparto" id="idcon4" required>
                              <%
                              datos_personal_reparto=new DPersonal_reparto().consultar();
                              for(CPersonal_reparto x:datos_personal_reparto){
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
                          <span class="input-group-addon">Cliente</span>
                          <select class="form-control" name="id_cliente" id="idcon5" required>
                              <%
                              datos_cliente=new DCliente().consultar();
                              for(CCliente x:datos_cliente){
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
                                			