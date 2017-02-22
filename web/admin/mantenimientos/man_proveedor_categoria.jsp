

<%@page import="modelo.DCategoria"%>
<%@page import="clases.CCategoria"%>
<%@page import="modelo.DProveedores"%>
<%@page import="clases.CProveedores"%>
<%@page import="clases.CProveedor_Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DProveedor_Categoria"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#proveedor_categoria').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#proveedor_categoria tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("pc0").value=data[0];

                $('#modal_modificar_proveedor_categoria').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Proveedor - Cateroria</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_proveedor_categoria">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="proveedor_categoria" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Proveedor</th>
						<th>Categoria</th>	                                                
					</tr>
				</thead>
				<tbody>
                <%
                    DProveedor_Categoria contac=new DProveedor_Categoria();
                    ArrayList<CProveedor_Categoria> con_datos=contac.consultar();
                    int n =new CProveedor_Categoria().n;
                for(CProveedor_Categoria p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<n-2;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
                    CProveedores ven1=new DProveedores().buscar_id(p.valor[n-2]);
                    out.print("<td>"+ven1.toString()+"</td>");
                    CCategoria art1=new DCategoria().buscar_id(p.valor[n-1]);
                    out.print("<td>"+art1.toString()+"</td>");
                    
                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_proveedor_categoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ProveedorCategoriaController">
            <div class="modal-body">
                   
                       
                     <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Proveedor</span>
                          <select class="form-control" name="id_proveedor" id="idpc1" required>
                              <%
                              ArrayList<CProveedores> datos_prov=new DProveedores().consultar();
                              for(CProveedores x:datos_prov ){   
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
                          <span class="input-group-addon">Categoria</span>
                          <select class="form-control" name="id_categoria" id="idpc1" required>
                              <%
                              ArrayList<CCategoria> datos_cat=new DCategoria().consultar();
                              for(CCategoria x:datos_cat){
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


<div class="modal fade" id="modal_modificar_proveedor_categoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ProveedorCategoriaController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="pc0" required/>

                <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Proveedor</span>
                          <select class="form-control" name="id_compras" id="idpc1" required>
                              <%
                               datos_prov=new DProveedores().consultar();
                              for(CProveedores x:datos_prov ){
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
                          <span class="input-group-addon">Categoria</span>
                          <select class="form-control" name="id_articulo" id="idpc2" required>
                              <%
                               datos_cat=new DCategoria().consultar();
                              for(CCategoria x:datos_cat){
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
