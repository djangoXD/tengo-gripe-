

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/ico" >
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
	<title>Responsive example - Bootstrap styling</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.bootstrap.css">

	<script type="text/javascript" language="javascript" src="js/jquery.js">	</script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.bootstrap.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.responsive.js">	</script>
	<script type="text/javascript" language="javascript" src="js/responsive.bootstrap.js"></script>

        <link href="css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <script src="js/fileinput.min.js" type="text/javascript"></script>



</head>
 <body>
     <div>
         <%@include file="mantenimientos/man_personas.jsp"%>         
     </div>
     <div>
         <%@include file="mantenimientos/man_usuario.jsp"%>
     </div>

 </body>
</html>
