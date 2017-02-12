<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.MongoClient"%>
<form name="formulario" method="post" action="ImagenesController" enctype="multipart/form-data">
    <input type="file"  name ="archivo" multiple="true">
    <input type="text" name="a1" >
    <input type="text" name="a2" >
    <input type="text" name="a3" >
    <input type="text" name="a4" >
    <button type="submit"> proces</button>
</form>
<img src="Imagengg" name="logo" width="100" height="100" style="display:none;">
<img src="gg.jsp">

<script>
    function cargar(elemento){
        alert("ff");
        var file=elemento.files[0];
        document.formulario.action=ImagenesController;
        document.formulario.submit();
     }
</script>
        