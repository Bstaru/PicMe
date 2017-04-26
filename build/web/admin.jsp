<%-- 
    Document   : admin
    Created on : 30/10/2016, 09:56:39 PM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="css/custombox.min.css">
<head>
	<title>PicMe</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/ADMIN_STYLE.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway|Baloo+Paaji" rel="stylesheet">
	<link rel="icon" href="IMG\PICKME.ico">

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/alertify.min.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="ccs/alertify.core.css">
	<link rel="stylesheet" href="css/alertify.default.css">
		
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
    
	<div class = "cosas">
		<div class = "pu_contenedor">
			<div class = "cosa"> <h2>USUARIOS</h2>
			 <table border="0.5">
				 <tr> 
				 	<td><img src="IMG/karahue.png" class = "imagenU"></td>
				 	<td> "nombre del usuario"</td>
				 	<td> "descripcion del bloqueo" </td>
				 	<td> <a href="#" class="btn btn-primary" id="simple_prompt">Ver</a></td>
				 </tr>
			 </table>
			 </div>
		</div>
		<div class = "us_contenedor">
			<div class = "cosa"> <h2>PUBLICACIONES</h2>
				 <h3>
					 <table border="1">
						 <tr> 
						 	<td> "Publicacion"</td>
							<td> "nombre del usuario"</td>
						 	<td> "razon de denuncia" </td>
					 		<td> <a href="#" class="btn btn-primary" id="simple_prompt1">Ver</a></td>
						 </tr>
						 <tr> 
						 	<td> "Publicacion"</td>
							<td> "nombre del usuario"</td>
						 	<td> "razon de denuncia" </td>
					 		<td> <a href="#" class="btn btn-primary" id="simple_prompt2">Ver</a></td>
						 </tr>
						 <tr> 
						 	<td> "Publicacion"</td>
							<td> "nombre del usuario"</td>
						 	<td> "razon de denuncia" </td>
					 		<td> <a href="#" class="btn btn-primary" id="simple_prompt3">Ver</a></td>
						 </tr>
						 <tr> 
						 	<td> "Publicacion"</td>
							<td> "nombre del usuario"</td>
						 	<td> "razon de denuncia" </td>
					 		<td> <a href="#" class="btn btn-primary" id="simple_prompt4">Ver</a></td>
						 </tr>
						 <tr> 
						 	<td> "Publicacion"</td>
							<td> "nombre del usuario"</td>
						 	<td> "razon de denuncia" </td>
					 		<td> <a href="#" class="btn btn-primary" id="simple_prompt5">Ver</a></td>
						 </tr>
						 <tr> 
						 	<td> "Publicacion"</td>
							<td> "nombre del usuario"</td>
						 	<td> "razon de denuncia" </td>
					 		<td> <a href="#" class="btn btn-primary" id="simple_prompt6">Ver</a></td>
						 </tr>
				 	 </table>
			 	 </h3>
			 </div>
		</div>
</body>

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

</html>