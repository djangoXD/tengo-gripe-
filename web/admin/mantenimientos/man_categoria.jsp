    
<%@page import="modelo.DProveedores"%>
<%@page import="clases.CProveedores"%>
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CCategoria"%>
<%@page import="modelo.DCategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#categoria').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#categoria tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("con0").value=data[0];
                document.getElementById("con1").value=data[1];
                document.getElementById("con2").value=data[2];

                $('#modal_modificar_categoria').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Categoria</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_categoria">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="categoria" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nombre</th>
                                                <th>Descripcion</th>
                                                <th>Proveedor</th>
                                                
					</tr>
				</thead>
				<tbody>
                <%
                    DCategoria contac=new DCategoria();
                    ArrayList<CCategoria> con_datos=contac.consultar();
                    int n =new CCategoria().n;
                for(CCategoria p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<n;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }

                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_categoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="CategoriaController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nombre</span>
                      <input type="text" class="form-control" name="nombre" id="idcon1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="descripcion" id="idcon2" required/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                        
                      </select>                        
                      <span class="input-group-addon">Proveedor</span>
                      <select class="form-control" name="id_proveedor" id="idcon3" onchange="">
                          <%
                            ArrayList<CProveedores> prov=new DProveedores().consultar();
                            for(CProveedores xx:prov){
                          %>
                            <option value="<%=xx.valor[0]%>"><%=xx.toString()%></option>
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


<div class="modal fade" id="modal_modificar_categoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="CategoriaController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="con0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nombre</span>
                      <input type="text" class="form-control" name="nombre" id="con1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="descripcion" id="con2" required/>
                    </div>
                  </div>
                <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon">Proveedor</span>
                          <input type="text" class="form-control" name="id_proveedor" id="con3" required/>
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
                                			