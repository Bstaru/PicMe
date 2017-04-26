<%-- 
    Document   : configuracion
    Created on : 30/10/2016, 09:56:26 PM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import ="Controlador.Conexion" %>

<%    
    HttpSession objsesion = request.getSession(false);    
    String email = (String)objsesion.getAttribute("correo");
   
    if(email.equals("")){
        response.sendRedirect("index.jsp");
    }
    Conexion conn =  new Conexion();
    CallableStatement proc = null;
    ResultSet rs = null;

    String sql = "{ call readData(?) }";
    proc= conn.getCon().prepareCall(sql);
    proc.setString(1, email);
    rs = proc.executeQuery();
%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/custombox.min.css">
<head>
	<title>PicMe</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="css/CONFIG_STYLE.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway|Baloo+Paaji" rel="stylesheet">
	<link rel="icon" href="IMG\PICKME.ico">

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script src="js/custombox.min.js"></script>
	<script src="js/legacy.min.js"></script>
	<script src="js/custombox.min.js"></script>
        <script src="js/checkbox_JS.js"></script>

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


	<div class = "content">
            <form id = "editarUsuario" action = "editar" method = "POST" enctype="multipart/form-data" >
		<div class = "cuadro">

		<div class = "privado">
                    
                        <% while(rs.next()){ %>
                        <input type="text" name="idu"  id="idu" class = "oculto" value = "<%=rs.getString("idUser")%>" >
                      
			<div class = "cosa">
                            <h2>Cuenta privada</h2>
			</div>
			<div class ="switchu">
                       
			<div class="onoffswitch">
                            
                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" value="1" >
                        
    			<label class="onoffswitch-label" for="myonoffswitch">
       			<span class="onoffswitch-inner"></span>
       			<span class="onoffswitch-switch"></span>
   			</label>
			</div>

			</div>
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de coreo</h2>
			</div>
			<input type="email" id="mail" name = "correo" required placeholder = "<%=rs.getString("email")%>">
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de contraseña</h2>
			</div>
			<input type="password" id="password" name = "contra" placeholder = "Contraseña">
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de nombre</h2>
			</div>
			<input type="text" id="nombre" name = "nombre" placeholder = "<%=rs.getString("title")%>">
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de nombre de usuario</h2>
			</div>
			<input type="text" id="nombreUsuario" name = "usuario" placeholder = "<%=rs.getString("usernm")%>">
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de fecha de nacimiento</h2>
			</div>
			<input type="date" id="fechN" name = "fecha" placeholder = "<%=rs.getString("fechn")%>">
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de genero</h2>
			</div>
			<input type ="radio"  name= "genero" value="1" class = "losR" >Hombre
  			<input type ="radio"  name= "genero" value="2"  class = "losR" >Mujer
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de ciudad</h2>
			</div>
			<select class = "cd" name = "ciudades" >
  				<option class = "op" name= "ciudad" value="1">Monterrey</option>
  				<option class = "op" name= "ciudad" value="2">San Nicolás de los Garza</option>
                                <option class = "op" name= "ciudad" value="3">General Escobedo</option>
                                <option class = "op" name= "ciudad" value="4">Guadalupe</option>
			</select>
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de pregunta</h2>
			</div>
			<select class = "pregs" name = "preguntas">
  				<option class = "op" name= "pregunta" value="1">¿Cómo se llamó mi primera mascota?</option>
  				<option class = "op" name= "pregunta" value="2">¿Ciudad natal de mi madre?</option>
  				<option class = "op" name= "pregunta" value="3">¿Ciudad natal de mi padre?</option>
  				<option class = "op" name= "pregunta" value="4">¿Deporte favorito?</option>
                                <option class = "op" name= "pregunta" value="5">¿A cuanto está el plátano Chiapas?</option>
			</select>	
		</div><hr width ="85%">

		<div class = "privado">
			<div class = "cosa">
				<h2>Cambio de respuesta</h2>
			</div>
			<input type="text" name="resp" class = "campos" placeholder = "<%=rs.getString("rcveryanswer")%>">
                          
                        
		</div><hr width ="85%">

		<div class  = "botonjej">
			<button class = "btnok" >Guardar Cambios</button>
                        <% } %>
		</div>

		</div>
            </form>
	</div>

	<br><br><br><br><br>
</body>
<div class = "cosasmagicas" id="try"  style="display: none;">
		<div class = "notificacionmagica">
			<div class = "cosaa"> 
			 <h2>Notificaciones</h2>
			 <table border="0.5">
				 <tr> 
				 	<td><img src="IMG/karahue.png" class ="imgNoti"></td>
				 	<td> "USUARIO"</td>
				 	<td> Comento tu foto </td>
				 </tr>
			 </div>
		 </div>
 </div>
</html>		
		