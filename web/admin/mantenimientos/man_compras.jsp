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
                document.getElementById("com3").value=data[3];
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
                                                <th>Id Proveedor</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DCompras compc=new DCompras();
                    ArrayList<CCompras> con_datos=compc.consultar();
                    CCompras compc1=new CCompras();
                for(CCompras p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<compc1.n;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
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
                      <span class="input-group-addon">Id Proveedor</span>
                      <input type="text" class="form-control" name="id_proveedor" id="idcom3" required/>
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
                      <span class="input-group-addon">Id Proveedor</span>
                      <input type="text" class="form-control" name="id_proveedor" id="com3" required/>
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
                                			
