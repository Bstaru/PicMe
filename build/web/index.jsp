<%-- 
    Document   : index
    Created on : 29/10/2016, 12:11:03 AM
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
	<link rel="icon" href="IMG\PICKME.ico">
        
        <script src = "js/main.js"></script>
        <script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
        <script type="text/javascript" src="js/login-new_JS.js" ></script>   
	
</head>
<body>

<div id ="cuadro">
	
	<h1> <img height =300 width= 500 src = "IMG/PICME_F1.png"/></h1>
	<div id = "login">
            
	<form id = "formuLog" name = "formLogin" action="iniciar" method="POST">

            <table id = "tabla" align = "center">
            <tr>
                <td><img height =30 width= 30 src = "IMG/u.png"/></td>
                <td><input type="email" name="correo" id="mail" required placeholder = " Correo Electrónico"></td>
                <td><img class = "flechita1" /></td>
            </tr>
            <tr>
            	<td><img height =30 width= 30 src = "IMG/contraseña.png"/></td>
                 <td><input type="password" name = "contra" id= "password" required placeholder = " Contraseña"></td>
                 <td><img class = "flechita2" /></td>
            </tr>
            <tr>
                <td colspan="2"><hr></td><br>
            </tr>
            </table>

		<table  align = "center">
			<tr>
                            <td>
                                <button type="button" id="btnlogin" value="Iniciar Sesión">Iniciar Sesión </button>
                            </td>
			</tr>				
		</table>
	</form>
		<br><a href= "registro.jsp" id="new_u">Nuevo usuario</a><br>
	</div>
</div>

	<footer id = "copy">
		&copy 2016 PicMe All rights reserved
	</footer>
</body>
</html>
