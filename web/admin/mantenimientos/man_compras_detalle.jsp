
<%@page import="modelo.DCompras"%>
<%@page import="clases.CCompras"%>
<%@page import="clases.CCliente"%>
<%@page import="modelo.DArticulo"%>
<%@page import="clases.CArticulo"%>
<%@page import="modelo.DVentas"%>
<%@page import="clases.CVentas"%>
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CCompras_detalle"%>
<%@page import="modelo.DCompras_detalle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#compras_detalle').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#compras_detalle tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("con0").value=data[0];
                document.getElementById("con1").value=data[1];
                document.getElementById("con2").value=data[2];

                $('#modal_modificar_compras_detalle').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Compras_detalle</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_compras_detalle">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="compras_detalle" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Costo</th>
						<th>Cantidad</th>	
                                                <th>Id Compra</th>	
                                                <th>Articulo</th>	
                                                
					</tr>
				</thead>
				<tbody>
                <%
                    DCompras_detalle contac=new DCompras_detalle();
                    ArrayList<CCompras_detalle> con_datos=contac.consultar();
                    int n =new CCompras_detalle().n;
                for(CCompras_detalle p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<n-2;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
                    CCompras ven1=new DCompras().buscar_id(p.valor[n-2]);
                    out.print("<td>"+ven1.toString()+"</td>");
                    CArticulo art1=new DArticulo().buscar_id(p.valor[n-1]);
                    out.print("<td>"+art1.toString()+"</td>");
                    
                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_compras_detalle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="Compras_detalleController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Cantidad</span>
                      <input type="text" class="form-control" name="cantidad" id="idcon1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Costo</span>
                      <input type="text" class="form-control" name="costo" id="idcon2" required/>
                    </div>
                  </div>
                   
                       
                     <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Compras</span>
                          <select class="form-control" name="id_compras" id="idcon5" required>
                              <%
                              ArrayList<CCompras> datos_compras=new DCompras().consultar();
                              for(CCompras x:datos_compras ){   
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
                          <span class="input-group-addon">Articulo</span>
                          <select class="form-control" name="id_articulo" id="idcon5" required>
                              <%
                              ArrayList<CArticulo> datos_articulo=new DArticulo().consultar();
                              for(CArticulo x:datos_articulo){
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


<div class="modal fade" id="modal_modificar_compras_detalle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="Compras_detalleController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="con0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Cantidad</span>
                      <input type="text" class="form-control" name="cantidad" id="con1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="costo" id="con2" required/>
                    </div>
                  </div>

                                 <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Compras</span>
                          <select class="form-control" name="id_compras" id="idcon5" required>
                              <%
                               datos_compras=new DCompras().consultar();
                              for(CCompras x:datos_compras ){
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
                          <span class="input-group-addon">Articulo</span>
                          <select class="form-control" name="id_articulo" id="idcon5" required>
                              <%
                               datos_articulo=new DArticulo().consultar();
                              for(CArticulo x:datos_articulo){
                                  %>
                                  <option value="<%=x.valor[0]%>"> <%=x.toString()%></option>
                              <%
                              }
                              %>
                          </select>
            
            <div class="modal-footer">
              <button  type="text" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button  type="submit" class="btn btn-primary" name="modificar" >Modificar</button>
              <button  type="submit" class="btn btn-danger" name="eliminar">Eliminar</button>
            </div>
    </div>
                    </form>

  </div>
</div>
                                			