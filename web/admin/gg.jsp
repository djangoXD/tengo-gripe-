<%@page import="com.mongodb.DB"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.MongoClient"%>
<%
            MongoClient mCliente = new MongoClient("127.0.0.1", 27017);
            
            DB db = mCliente.getDB("ferreteria");
            GridFS fsArchivo = new GridFS(db, "arcGrande");
            String nomArchivo = request.getParameter("imagen");            
 
            GridFSDBFile imgPmostrar = fsArchivo.findOne(nomArchivo);
            response.setContentType("image/jpg");
            OutputStream salida = response.getOutputStream();
            imgPmostrar.writeTo(salida);
            salida.flush();
            salida.close();  
%>