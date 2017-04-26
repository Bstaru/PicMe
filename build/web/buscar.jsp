<%-- 
    Document   : buscar
    Created on : 30/10/2016, 09:56:57 PM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.io.InputStream"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import ="Controlador.Conexion" %>
<%
        Conexion conn =  new Conexion();
        CallableStatement proc = null;
        ResultSet rs = null;

         String usuario =  request.getParameter("q");
         
         String consulta = "{ call buscar(?) }";
         proc = conn.getCon().prepareCall(consulta);
         proc.setString(1, usuario); 
         rs = proc.executeQuery();
        %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/custombox.min.css"> 	
<head>
	<title>PicMe</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="css/SEARCH_STYLE.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Raleway|Baloo+Paaji" rel="stylesheet">
	<link rel="icon" href="IMG\PICKME.ico">
	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script src="js/custombox.min.js"></script>
	<script src="js/legacy.min.js"></script>
	<script src="js/custombox.min.js"></script>

	<script>
	    $(function() {
	        $('#notificacion').on('click', function( e ) {
	            Custombox.open({
	                target: '#try',
	                effect: 'fadein'
	            });
	            e.preventDefault();
	        });
	    });
	</script>

		<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#hide").click(function(){
    $("#try").hide();
  });
  $("#show").click(function(){
    $("#try").show();
  });
});
</script>

</head>

<body>
	<div class = "header">
	<div class = "headercontainer">

		<div class ="buscarWea">
			<div class = "buscarjej">
				<form action="buscar.jsp" method="GET" class="search-form">
					<input type="text" name="q" placeholder="Buscar..." class = "searchjej">
                                        <button  class="button"id="btnBus">Buscar</button>
					
				</form>
			</div>	
		</div>
		<div class = "logoo">
				<a href = "home.jsp"><img class = "logojej"src="IMG\PICMEa.png"></a>
		</div>
		<table id = "navi">
				<tr>

				<td class = "sprite-admin"> <a href="admin.jsp"> <img src="IMG\admin.png"></a> </td>
				<td class = "sprite-home"><a href = "home.jsp"><img src="IMG\home.png"></a></td>
				<td class = "sprite-home"><a href = "profile.jsp"><img src="IMG\u.png"></a></td>
				<td class = "sprite-bell" id="notificacion" ><img src="IMG\bell.png"></td>
				<td class = "sprite-config"><a href = "configuracion.jsp"><img src="IMG\config.png"></a></td>
				<td class = "sprite-exit"><a href = "index.jsp"><img src="IMG\exit.png"></a></td>

				</tr>
		</table>	
		</div>
	</div>
        
	<div class = "cuadro">
		<div class = "relleno">
			<div class = "titulo">
				<h2>Búsqueda...  </h2>
			</div>
			<div class ="resultados">
				<ul class = "re">
                                        <%                               
                                        while(rs.next()){
                                            
                                        String cosa = rs.getString("usernm");
                                            if (cosa != ""){
                                        %>
					<li class = "cosa1">
                                            <img src="LeerImagen?idUser=<%=rs.getString("idUser")%>" class = "imagenusuario" id = "">
                                            <h3 class ="elnombre"><%=rs.getString("usernm")%></h3>
                                            <h3 class ="lacd">Ciudad: <%=rs.getString("nomCiudad")%></h3>
                                        
                                        <%  } 
                                            else{
                                        %>
                                            <img src="IMG/imgprofileD.png" class = "imagenusuario" id = "">
                                            <h3 class ="elnombre">No se encontró usuario</h3>
                                        </li>
                                        <%      }    
                                           }          %>
				</ul>
		</div>
	</div>
		<div class = "cosasmagicas" id="try"  style="display: none;">
		<div class = "notificacionmagica">
			<div class = "cosa"> <h2>Notificaciones</h2>
			 <table border="0.5">
				 <tr> 
				 	<td><img src="IMG/karahue.png"></td>
				 	<td> "nombre del usuario"</td>
				 	<td> Comento tu foto </td>
				 </tr>
			 </table>
			 </div>
		 </div>
 </div>

</body>
</html>