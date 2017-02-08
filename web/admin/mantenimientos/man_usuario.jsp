
<%@page import="modelo.DPersonas"%>
<%@page import="clases.CPersonas"%>
<%@page import="clases.CUsuario"%>
<%@page import="modelo.DUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>

<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#usuario').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#usuario tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("usu0").value=data[0];
                document.getElementById("usu1").value=data[1];
                document.getElementById("usu2").value=data[2];
                document.getElementById("usu3").value=data[3];
                $('#modal_modificar_usuario').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Usuario</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_usuario">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="usuario" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Usuario</th>
						<th>Contraseña</th>	
                                                <th>Permisos</th>
                                                <th>Id Persona</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DUsuario usuarc=new DUsuario();
                    ArrayList<CUsuario> con_datos=usuarc.consultar();
                    int n =new CUsuario().n;
                for(CUsuario p: con_datos){
                   out.print("<tr>");
                   for(int i=0;i<n-1;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   }                   
                       CPersonas per1=new DPersonas().buscar_id(p.valor[n-1]);
                       out.print("<td>"+per1.toString()+"</td>");
                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_usuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="UsuarioController">
            <div class="modal-body">

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Usuario</span>
                      <input type="text" class="form-control" name="usuario" id="idusu1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Contraseña</span>
                      <input type="text" class="form-control" name="contraseña" id="idusu2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Permisos</span>
                      <input type="text" class="form-control" name="permisos" id="idusu3" required/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Id Persona</span>
                      <select class="form-control" name="id_persona" id="idusu4" required>
                          <%
                          ArrayList<CPersonas> datos_personas=new DPersonas().consultar();
                          for(CPersonas x:datos_personas){
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


<div class="modal fade" id="modal_modificar_usuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="UsuarioController">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="usu0" required/>

                    
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Usuario</span>
                      <input type="text" class="form-control" name="usuario" id="usu1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Contraseña</span>
                      <input type="text" class="form-control" name="contraseña" id="usu2" required/>
                    </div>
                  </div>
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Permisos</span>
                      <input type="text" class="form-control" name="permisos" id="usu3" required/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Id Persona</span>
                      <select class="form-control" name="id_persona" id="idusu4" required>
                          <%
                          datos_personas=new DPersonas().consultar();
                          for(CPersonas x:datos_personas){
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
                                			