
<%@page import="modelo.DUsuario"%>
<%@page import="clases.CUsuario"%>
<%@page import="clases.CPersonas"%>
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CProveedores"%>
<%@page import="modelo.DProveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>

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


    <h1> Mantenimiento Proveedores</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_proveedores">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="proveedores" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>RUC</th>
						<th>Razon Social</th>	
                                                <th>Descripcion</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DProveedores provc=new DProveedores();
                    ArrayList<CProveedores> con_datos=provc.consultar();
                    int n=new CProveedores().n;
                for(CProveedores p: con_datos){
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

<div class="modal fade" id="modal_insertar_proveedores" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ProveedoresController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">RUC</span>
                      <input type="text" class="form-control" name="ruc" id="idpro1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Razon Social</span>
                      <input type="text" class="form-control" name="razon_social" id="idpro2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="descripcion" id="idpro3" required/>
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


<div class="modal fade" id="modal_modificar_proveedores" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ProveedoresController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="pro0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">RUC</span>
                      <input type="text" class="form-control" name="ruc" id="pro1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Razon Social</span>
                      <input type="text" class="form-control" name="razon_social" id="pro2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Descripcion</span>
                      <input type="text" class="form-control" name="descripcion" id="pro3" required/>
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
                                			
