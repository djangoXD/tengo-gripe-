
<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<style type="text/css">
  p { color: black; font-family: Verdana; }
  .sampletext {
    background-color: #9494b8;
}
</style>
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
                document.getElementById("dm1").value=data[0];
                document.getElementById("dm2").value=data[1];
                document.getElementById("dm3").value=data[2];
                document.getElementById("dm4").value=data[3];
                document.getElementById("dm5").value=data[4];
                document.getElementById("dm6").value=data[5];
                document.getElementById("dm7").value=data[6];
                document.getElementById("dm8").value=data[7];
                document.getElementById("dm9").value=data[8];
                $('#modal_modificar').modal('show');
            } );
    } );

</script>


    <h1> Mantenimiento Persona</h1>       
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
						<th>Nombres</th>
						<th>Apellidos</th>
                                                <th>Fecha de los dias Nacimiento</th>
						<th>Direccion</th>
                                                <th>Tipo<br>Documento</th>
                                                <th>Nro<br>Documento</th>
						<th>Email</th>
						<th>Sexo</th>
                                                <th>d</th>
					</tr>
				</thead>
				<tbody>
                <%
                    DPersona dp=new DPersona();
                    ArrayList<CPersona> datos=dp.consultar();
                for(CPersona p: datos){
                    %>
                                    <tr>                                        
                                        <td > <%=p.getId()%></td>
                                        <td> <%=p.getNombre()%></td>
                                        <td> <%=p.getApellidos()%></td>
                                        <td> <%=p.getFecha_nacimiento()%></td>
                                        <td> <%=p.getDireccion()%></td>
                                        <td> <%=p.getTipo_documento()%></td>
                                        <td> <%=p.getNro_documento()%></td>
                                        <td> <%=p.getEmail()%></td>
                                        <td> <%=p.getSexo()%></td>                                       
                                        <td><button>dd</button></td>
                                    </tr>

                <%
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
        <form method="post" action="PersonaController">          
            <div class="modal-body">
                    <input class="form-control" type="text" id="d2" name="d2" placeholder="NOMBRE">
                    <input class="form-control" type="text" id="d3" name="d3" placeholder="APELLIDOS">
                    <input class="form-control" type="text" id="d4" name="d4" placeholder="FECHA NACIMIENTO">
                    <input class="form-control" type="text" id="d5" name="d5" placeholder="DIRECCION">
                    <input class="form-control" type="text" id="d6" name="d6" placeholder="TIPO DOCUMENTO">
                    <input class="form-control" type="text" id="d7" name="d7" placeholder="NRO DOCUMENTO">
                    <input class="form-control" type="text" id="d8" name="d8" placeholder="CORREO">
                    <input class="form-control" type="text" id="d9" name="d9" placeholder="SEXO">
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
        <form method="post" action="PersonaController">
          
            <div class="modal-body">   

                    <label  class="col-md-5" for="dm1">ID</label>
                    <input class="sampletext" type="text" id="dm1" name="d1" placeholder="ID" readonly="readonly"><br>
                    <label class="col-md-5"  for="dm2">NOMBRES</label>
                      <input   type="text" id="dm2" name="d2" placeholder="NOMBRE"><br>
                    <label class="col-md-5" for="dm3">APELLIDOS</label>
                      <input  type="text" id="dm3" name="d3" placeholder="APELLIDOS"><br>
                    <label class="col-md-5" for="dm4">FECHA NACIMIENTO</label>
                      <input  type="text" id="dm4" name="d4" placeholder="FECHA NACIMIENTO"><br>
                    <label class="col-md-5" for="dm5">DIRECCION</label>
                      <input  type="text" id="dm5" name="d5" placeholder="DIRECCION"><br>
                    <label class="col-md-5" for="dm6">TIPO DOCUMENTO</label>
                      <input  type="text" id="dm6" name="d6" placeholder="TIPO DOCUMENTO"><br>
                    <label class="col-md-5" for="dm7">NRO DOCUMENTO</label>
                      <input  type="text" id="dm7" name="d7" placeholder="NRO DOCUMENTO"><br>
                    <label class="col-md-5" for="dm8">CORREO</label>
                      <input  type="text" id="dm8" name="d8" placeholder="CORREO"><br>
                    <label class="col-md-5" for="dm9">EMAIL</label>
                      <input  type="text" id="dm9" name="d9" placeholder="SEXO"><br>  
            </div>
            <div class="modal-footer">
              <button  type="text" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button  type="submit" class="btn btn-primary" name="modificar" >Modificar</button>            
              <button  type="submit" class="btn btn-danger" name="eliminar">Eliminar</button>            
            </div>
        </form>
    </div>
  </div>
</div>