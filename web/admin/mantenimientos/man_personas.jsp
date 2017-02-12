
<%@page import="modelo.DImagen"%>
<%@page import="clases.CPersonas"%>
<%@page import="modelo.DPersonas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<script type="text/javascript" language="javascript" class="init">

    $(document).ready(function() {
        var table = $('#personas').DataTable( {
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
         ]
    } );


        $('#personas tbody').on('click', 'tr', function () {
                var data = table.row( this ).data();
                document.getElementById("per0").value=data[0];
                document.getElementById("per1").value=data[1];
                document.getElementById("per2").value=data[2];
                document.getElementById("per3").value=data[3];
                document.getElementById("per4").value=data[4];
                document.getElementById("per5").value=data[5];
                document.getElementById("per6").value=data[6];
                document.getElementById("per7").value=data[7];

                $('#modal_modificar_persona').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Personas</h1>
    <div class="panel panel-body">
        <div class="btn-group">
            <button id="insertar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_insertar_persona">
                Insertar
            </button>
        </div><br><br>
                    <div class="dataTable_wrapper table-responsive">
			<table id="personas" class="table table-striped table-bordered table-hover table-condensed dt-responsive nowrap" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Tipo Documento</th>
						<th>Nro Documento</th>
                                                <th>Nombres</th>
						<th>Apellidos</th>
						<th>Fecha Nacimiento</th>
						<th>Sexo</th>
						<th>Email</th>
						<th>Foto</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DPersonas d1=new DPersonas();
                    ArrayList<CPersonas> datos=d1.consultar();
                    CPersonas x=new CPersonas();
                    DImagen imagen=new DImagen();
                for(CPersonas p: datos){
                   out.print("<tr>");
                   for(int i=0;i<x.n;i++){
                      out.print("<td>"+p.valor[i]+"</td>");
                   } 
                   if(imagen.existe(p.valor[2])){
                   %>
                                <td>
                                    <img name="warren" width="80" height="80" src="gg.jsp?imagen=<%=p.valor[2]%>">
                                </td>
                                    <%
                    }else{%>
                                <td>
                                    <img name="warren" width="80" height="80" src="images/gg.png">
                                </td>  
                                <%} 

                   out.print("</tr>");                   
                }
                %>
				</tbody>
			</table>
                        </div>

                     </div>

<div class="modal fade" id="modal_insertar_persona" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="PersonasController" enctype="multipart/form-data">
            <div class="modal-body">
                 <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Tipo Documento</span>
                      <select class="form-control" name="tipo_documento" id="con3" required>
                              <option value="DNI"> DNI</option>
                              <option value="VISA"> VISA </option>
                              <option value="OTROS"> OTROS</option>
                      </select>

                    </div>
                  </div>       
                 
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nro Documento</span>
                      <input type="text" class="form-control" name="nro_documento" id="idper2" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nombres</span>
                      <input type="text" class="form-control" name="nombres" id="idper3"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Apellidos</span>
                      <input type="text" class="form-control" name="apellidos" id="idper4"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Nacimiento</span>
                      <input type="date" class="form-control" name="fecha_nacimiento" id="idper5"/>
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Tipo Documento</span>
                      <select class="form-control" name="sexo" id="idper6" required>
                              <option value="FEMENINO"> FEMENINO</option>
                              <option value="MASCULINO">MASCULINO </option>
                              <option value="HIBRIDO"> HIBRIDO</option>
                      </select>

                    </div>
                  </div>       
 

                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Email</span>
                      <input type="text" class="form-control" name="email" id="idper7"/>
                    </div>
                  </div>1
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Foto</span>
                      <input type="file" class="form-control" name="foto" id="files"/>
                    </div>
                  </div>       
                  <output id="list"></output>
        
        <script>
		  function archivo(evt) {
			var files = evt.target.files; 
			for (var i = 0,f = files[i]; i<5; i++) {
			  if (!f.type.match('image.*')) continue;			 		
			  var reader = new FileReader();		
			  reader.onload = (function(theFile) {
				return function(e) {
        				 document.getElementById("list").innerHTML = ['<img class="img-rounded" alt="Cinque Terre" width="304" height="236"  src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');

				};
			  })(f);		
			  reader.readAsDataURL(f);
			}
		  }
		
		  document.getElementById('files').addEventListener('change', archivo, false);
        	</script>
            </div>
            <div class="modal-footer">
              <button  type="text" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button  type="submit" class="btn btn-primary" name="insertar">Insertar</button>
            </div>
        </form>
    </div>
  </div>
</div>


<div class="modal fade" id="modal_modificar_persona" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="PersonasController" enctype="multipart/form-data">

          <div class="modal-body">

            <input type="text" class="form-control hide" name="_id" id="per0" required/>

                    <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Tipo Documento</span>
                      <input type="text" class="form-control" name="tipo_documento" id="per1" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nro Documento</span>
                      <input type="text" class="form-control" name="nro_documento" id="per2" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Nombres</span>
                      <input type="text" class="form-control" name="nombres" id="per3"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Apellidos</span>
                      <input type="text" class="form-control" name="apellidos" id="per4"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Fecha Nacimiento</span>
                      <input type="text" class="form-control" name="fecha_nacimiento" id="per5"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Sexo</span>
                      <input type="text" class="form-control" name="sexo" id="per6"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Email</span>
                      <input type="text" class="form-control" name="email" id="per7"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">Foto</span>
                      <input type="file" class="form-control" name="foto" id="per7"/>
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
                                			