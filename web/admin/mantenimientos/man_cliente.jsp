
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CCliente"%>
<%@page import="modelo.DCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#cliente').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#cliente tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("con0").value=data[0];
                document.getElementById("con1").value=data[1];
                $('#modal_modificar_cliente').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Cliente</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_cliente">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="cliente" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DCliente contac=new DCliente();
                    ArrayList<CCliente> con_datos=contac.consultar();
                    int n =new CCliente().n;
                for(CCliente p: con_datos){
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

<div class="modal fade" id="modal_insertar_cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ClienteController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Estado</span>
                      <input type="text" class="form-control" name="estado" id="idcon1" required/>
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


<div class="modal fade" id="modal_modificar_cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="ClienteController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="con0" required/>


                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Estado</span>
                      <input type="text" class="form-control" name="estado" id="con1" required/>
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
