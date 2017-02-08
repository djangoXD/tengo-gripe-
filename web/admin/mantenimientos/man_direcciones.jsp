<%@page import="clases.CDirecciones"%>
<%@page import="modelo.DDirecciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>

<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#direcciones').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#direcciones tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("dir0").value=data[0];
                document.getElementById("dir1").value=data[1];
                document.getElementById("dir2").value=data[2];
                document.getElementById("dir3").value=data[3];
                document.getElementById("dir4").value=data[4];
                document.getElementById("dir5").value=data[5];
                $('#modal_modificar_direcciones').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Direcciones</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_direcciones">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="direcciones" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Ubigeo</th>
						<th>Direccion</th>	
                                                <th>Referencia</th>
                                                <th>Codigo Postal</th>
                                                <th>Id Persona</tr>
					</tr>
				</thead>
				<tbody>
                <%
                    DDirecciones direcc=new DDirecciones();
                    ArrayList<CDirecciones> con_datos=direcc.consultar();
                    CDirecciones direcc1=new CDirecciones();
                for(CDirecciones p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<direcc1.n;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }
                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_direcciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="DireccionesController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Ubigeo</span>
                      <input type="text" class="form-control" name="ubigeo" id="iddir1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Direccion</span>
                      <input type="text" class="form-control" name="direccion" id="iddir2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Referencia</span>
                      <input type="text" class="form-control" name="referencia" id="iddir3" required/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Codigo Postal</span>
                      <input type="text" class="form-control" name="codigo_postal" id="iddir4" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Id Persona</span>
                      <input type="text" class="form-control" name="id_persona" id="iddir5" required/>
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


<div class="modal fade" id="modal_modificar_direcciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="DireccionesController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="dir0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Ubigeo</span>
                      <input type="text" class="form-control" name="ubigeo" id="dir1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Direccion</span>
                      <input type="text" class="form-control" name="direccion" id="dir2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Referencia</span>
                      <input type="text" class="form-control" name="referencia" id="dir3" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Codigo Postal</span>
                      <input type="text" class="form-control" name="codigo_postal" id="dir4" required/>
                    </div>
                  </div>
             <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Id Persona</span>
                      <input type="text" class="form-control" name="id_persona" id="dir5" required/>
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
                                			