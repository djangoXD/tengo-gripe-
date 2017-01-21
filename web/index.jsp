<%@page import="java.util.ArrayList"%>
<%@page import="clases.CPersona"%>
<%@page import="modelo.DPersona"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/ico" >
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
	<title>Responsive example - Bootstrap styling</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.bootstrap.css">
	

</head>
<body>
    	<script type="text/javascript" language="javascript" src="js/jquery.js">	</script>
	<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.bootstrap.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.responsive.js">	</script>
	<script type="text/javascript" language="javascript" src="js/responsive.bootstrap.js"></script>
	
        <script type="text/javascript" language="javascript" class="init">	
$(document).ready(function() {
	$('#example').DataTable();
} );
	</script>

    <h1>shddhsdhshdhs   </h1>
    <div class="panel panel-body"> 
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
					</tr>
				</thead>
				<tbody>
                <%
                    DPersona dp=new DPersona();
                    ArrayList<CPersona> datos=dp.consultar();
                for(CPersona p: datos){
                    %>
                                    <tr>
                                        <td> <%=p.getId()%></td>
                                        <td> <%=p.getNombre()%></td>
                                        <td> <%=p.getApellidos()%></td>
                                        <td> <%=p.getFecha_nacimiento()%></td>
                                        <td> <%=p.getDireccion()%></td>
                                        <td> <%=p.getTipo_documento()%></td>
                                        <td> <%=p.getNro_documento()%></td>
                                        <td> <%=p.getEmail()%></td>
                                        <td> <%=p.getSexo()%></td>
                                    </tr>

                <%
                }
                %>
				</tbody>
			</table>	
                                                </div>

                     </div>
</body>
</html>