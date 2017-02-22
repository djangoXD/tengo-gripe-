<%@page import="modelo.DImagen"%>
<%@page import="modelo.ADcon"%>
<%@page import="com.mongodb.DB"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.MongoClient"%>1
<script>
    

</script>
<%
                ADcon f=new ADcon();
                DImagen gG=new DImagen();
            MongoClient mCliente = new MongoClient(f.getUrl(), 27017);
            
            DB db = mCliente.getDB(f.getDatabase());
            GridFS fsArchivo = new GridFS(db, "arcGrande");
            String nomArchivo = request.getParameter("imagen");            
 
            GridFSDBFile imgPmostrar = fsArchivo.findOne(nomArchivo);
            response.setContentType("image/jpg");
            OutputStream salida = response.getOutputStream();
            imgPmostrar.writeTo(salida);
            salida.flush();
            salida.close();  
%>