
<%@page import="modelo.DCategoria"%>
<%@page import="clases.CCategoria"%>
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CArticulo"%>
<%@page import="modelo.DArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#example').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#example tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("dm0").value=data[0];
                document.getElementById("dm1").value=data[1];
                document.getElementById("dm2").value=data[2];
                document.getElementById("dm3").value=data[3];
                document.getElementById("dm4").value=data[4];
                document.getElementById("dm5").value=data[5];
                $('#modal_modificar').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Articulo</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button id="insertar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar">
                Insertar
            </button>
        </div><br><br>
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
					</tr>
				</thead>
				<tbody>
                <%
                    DArticulo d1=new DArticulo();
                    ArrayList<CArticulo> datos=d1.consultar();
                    int  n=new CArticulo().n;
                for(CArticulo p: datos){
                   out.print("<tr>");
                   for(int i=0;i<n-1;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
                   CCategoria cat1=new DCategoria().buscar_id(p.valor[n-1]);
                   out.print("<td>"+cat1.toString()+"</td>");

                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ArticuloController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nombre</span>
                      <input type="text" class="form-control" name="nombre" id="d1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="descripcion" id="d2" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Costo Unitario</span>
                      <input type="text" class="form-control" name="costo" id="d3"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Stock</span>
                      <input type="text" class="form-control" name="stok" id="d3"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Material</span>
                      <input type="text" class="form-control" name="material" id="d3"/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Categoria</span>
                      <select class="form-control" name="categoria" id="con4" required>
                          <%
                          ArrayList<CCategoria> datos_categoria=new DCategoria().consultar();
                          for(CCategoria x:datos_categoria){
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


<div class="modal fade" id="modal_modificar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ArticuloController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="dm0" required/>

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nombre</span>
                      <input type="text" class="form-control" name="nombre" id="dm1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="descripcion" id="dm2" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Costo Unitario</span>
                      <input type="text" class="form-control" name="costo" id="dm3"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Stock</span>
                      <input type="text" class="form-control" name="stok" id="dm4"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Material</span>
                      <input type="text" class="form-control" name="material" id="dm5"/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Categoria</span>
                      <select class="form-control" name="categoria" id="con4" required>
                          <%
                         datos_categoria=new DCategoria().consultar();
                          for(CCategoria x:datos_categoria){
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
                                			