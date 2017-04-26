<%-- 
    Document   : registo
    Created on : 29/10/2016, 12:21:11 AM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>PicMe</title>
	<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="css/STYLE.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Raleway|Baloo+Paaji" rel="stylesheet">
	<link rel="icon" href="IMG/PICKME.ico">
        
        <script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
        <!--script type="text/javascript" src="js/login-new_JS.js" ></script-->
        <script type="text/javascript" src="js/verFoto_JS.js" ></script>
</head>
<body>
	<div id ="cuadro">
            
	<form id = "new_u_" action = "nuevousuario" method = "POST" enctype="multipart/form-data">
            
		<h2>Complete los siguientes campos</h2>
			
                    <div class = "labelus">
			<h3 class = "labelus2">Correo: </h3><br>
			<h3 class = "labelus2">Contraseña: </h3><br>
			<h3 class = "labelus2">Nombre: </h3><br>
			<h3 class = "labelus2">Nombre de usuario: </h3><br>
			<h3 class = "labelus2">Fecha de Nacimiento: </h3><br>
			<h3 class = "labelus2">Genero: </h3><br>
			<h3 class = "labelus2">Ciudad: </h3><br>
			<h3 class = "labelus2">Pregunta de seguridad: </h3><br>
			<h3 class = "labelus2">Respuesta: </h3><br>
                        <h3 class = "labelus2">Foto de perfil: </h3><br>
                        <h3 class = "labelus2">Foto de portada: </h3><br>
                    </div>
                    <div class = "textos">
			<input type="email"     name="correo" id="correo" class = "campos" placeholder="Correo"><br>
			<input type="password"  name="contra" id="contra" class = "campos" placeholder="Contraseña"><br>	
			<input type="text"      name="nombre" id="nombre" class = "campos" placeholder="Nombre"><br>	
			<input type="text"      name="usuario" id="usuario" class = "campos" placeholder="Usuario"><br>			
			<input type="date"      name="FeNac" id="FeNac" class = "campos" class="fecha_nac"><br>

			<input type ="radio"  name= "genero"  id= "genero" value="1" class = "losR" checked="checked">Hombre
  			<input type ="radio"  name= "genero"  id= "genero" value="2"  class = "losR" >Mujer<br>
                        
			<select class = "cd" name = "ciudades" id = "ciudades">
  				<option class = "op" name= "ciudad" value="1">Monterrey</option>
  				<option class = "op" name= "ciudad" value="2">San Nicolás de los Garza</option>
                                <option class = "op" name= "ciudad" value="3">General Escobedo</option>
                                <option class = "op" name= "ciudad" value="4">Guadalupe</option>
			</select>
                        
			<select class = "pregs" name = "preguntas" id = "pregunta">
  				<option class = "op" name= "pregunta" value="1">¿Cómo se llamó mi primera mascota?</option>
  				<option class = "op" name= "pregunta" value="2">¿Ciudad natal de mi madre?</option>
  				<option class = "op" name= "pregunta" value="3">¿Ciudad natal de mi padre?</option>
  				<option class = "op" name= "pregunta" value="4">¿Deporte favorito?</option>
                                <option class = "op" name= "pregunta" value="5">¿A cuanto está el plátano Chiapas?</option>
			</select>					
			<input type="text" name="resp" id="respuesta" class = "campos" placeholder="Respuesta"><br>
                                           
                        <label for="imgP" class="fotoP">Elegir foto</label><br>
                        <input type="file"  name="imgP" id="imgP" class ="archivos" accept="image/*" onchange="verFotoP(event)" ><br>
                                                
                        <label for="imgC" class="fotoP">Elegir foto</label><br>
                        <input type="file"  name="imgC" id="imgC" class ="archivos" accept="image/*" onchange="verFotoC(event)"><br>
                                                
			<input type="text" name="tipo"  id="tipo" class = "oculto" value = "true">
			<input type="text" name="privado" id="privado" class = "oculto" value = "false">
                        <input type="text" name="acerca" id="acerca" class = "oculto" value = "Nada aun...">
                      
                    </div>
                    <div class = "weaPosi">
                        <div class = "preview">
                            <img id="perfil" class = "perfil" src="IMG/imgprofileD.png" alt="tu foto" />
                            <img id="portada" class = "portada" src="IMG/imgcoverD.png" alt="tu foto" />
                        </div>
                    </div>

                <button  id="llenar" title="Finalizar Registro">Confirmar Datos</button>
	</form>

	<div id= "logo_NU">
		<img height =200 width= 210 src = "IMG/nube.png"/><br>
		<img height =150 width= 250 src = "IMG/PICME_F1.png"/><br>
		<div id="back_login">
		¿Ya eres parte de la familia? entonces ... <a href= "index.jsp">Inicia sesión</a><br>
		</div>
	</div>
	
	</div>
	<footer id = "copy">
		&copy 2016 PicMe All rights reserved
	</footer>
</body>
</html>