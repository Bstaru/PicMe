
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

 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<link href="css/HOME_STYLE.css" rel="stylesheet">
	<script src = "js/scroll.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Raleway|Baloo+Paaji" rel="stylesheet">
	<link rel="icon" href="IMG\PICKME.ico">

        <script src="js/custombox.min.js"></script>
	<script src="js/legacy.min.js"></script>
	<script src="js/custombox.min.js"></script>     
        <script src="js/verFotoPost_JS.js"></script>
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

        
	<div class= "todo">
		<div class="derecha der">	
			<div class = "portada">
                            
                            <%                               
                                while(rs.next()){
                            %>
                            <input type="text" name="idu"  id="idu" class = "oculto" value = "<%=rs.getString("idUser")%>" >
					<img class = "cover" src="LeerImagenCov?idUser=<%=rs.getString("idUser")%>" alt="">				
					<img class = "picture" src="LeerImagen?idUser=<%=rs.getString("idUser")%>" alt="">
					<h1>
                                            <a href="profile.jsp"><%=rs.getString("usernm")%> </a>
					</h1>
                                        
			</div>
			
			<div class = "seguidores" >
				<table id = "cont_seg" align = "center">
					<tr>
						<td >SEGUIDORES</td>
						<td >SIGUIENDO</td>
					</tr>
					<tr>
						<td>cantidad</td>
						<td>cantidad </td>
					</tr>
				</table>
			</div>	
		</div>
	</div>
	</div>
        
        <form name = "nuevoP" id = "nuevoP"  action = "nuevoPost" method="POST" enctype="multipart/form-data">          
	<div class ="new_post">
			<div class = "nuevo">
				<div class = "nuevo_post">
                                        <input type="text" name="idu"  id="idu" style ="display: none" value = "<%=rs.getString("idUser")%>" >
					<textarea rows="4" name = "cuerpo" cols ="" class = "postjej" placeholder = "¿Qué descubriste?..."></textarea>
                                        
					<label for="file-upload" id = "nuevopostfoto "class="custom-file-upload">Subir foto</label>
					<input id="file-upload" name = "imgPost" type="file" accept="image/*" onchange="verFotoPost(event)"/>                                        
                                        <img class = "subirFotoPost"  id ="subir-foto" src = "">                                    
                                                                                
                                        <button  class="Publicar"id="Publicar">Publicar</button>
				</div>
			</div>	
	</div>
        </form>

	<div class = "lugarFecha">
            <form action="home.jsp" method="GET" class="search-form" id="lugarjej">
                <input type="date" name="FechaB" id="FechaB" class="fechaB"><br>
                <div class = "lugarbtnFechaB"><button  id="okFechaBr" class = "lugarbtnFecha">Ok</button></div>
            </form>
        </div>
	<div class="posts">
            <%        
            // rows  
            
    String iduu = rs.getString("idUser");    
    Integer idu = Integer.parseInt(iduu.trim());    
    
    
    CallableStatement proc2 = null;
    ResultSet rs2 = null;
    String sql2 = "{ call readAllPost() }";
    proc2= conn.getCon().prepareCall(sql2);    
    //proc2.setInt(1, idu);
   
    rs2= proc2.executeQuery();
            while( rs2.next()){
            %>
            <section>
               
		<div class = "contenido" id="contenido">
                    
                        <input type="text" name="idu"  id="idu" style ="display: none" value = "<%=rs2.getString("idPost")%>" >
			<div class = "perma2">
				<a href=""><%=rs2.getString("postdate")%></a>
				<a >20 likes</a>
				<div class = "botones">
					<div class = "likedivv">
						<div class = "like">
							<img src="IMG\heart2.png">
							</div>
					</div>
				</div>
                                
			</div>
                         <div class = "vermas" id = "vermas" name = "seemore">                           
                                                          
				<button  id ="btnReportPu">Reportar</button>
			</div>
			<div>
                            <form name = "subirImgs" id = "subirImgs"  action = "imagenPost" method="POST" enctype="multipart/form-data">
			<img style = "min-width:600px;"src="imagenPost?idPost=<%=rs2.getString("idPost")%>" class = "center"></form>
			</div>
				
			<div class = "caption">
				<ul class  = "u_caption u_caption2">
					<li class="cosa1">
						<h2>
							<a class = "ref_nombreU" title = "bstaru95" href="profile_2.jsp?usuarioB=<%=rs2.getString("usernm")%>"> <%=rs2.getString("usernm")%> </a>
						<span>
						<%=rs2.getString("post_body")%>
						</span>
						</h2></li>
					<li class = "cosa1">ekisde comentario</li>
					<li class = "cosa1">ekisde comentario</li>
					<li class = "cosa1">ekisde comentario</li>
					<li class = "cosa1">ekisde comentario</li>
				</ul>
				 
                        <hr>
				<section class = "coment1">
					<div class = "inComent"><input value="Añade un comentario..." onfocus="if(this.value=='Añade un comentario...')this.value='';" 
                                                                       onblur="if(this.value=='')this.value='Añade un comentario...';"></div>		
					
                                        <div class = "okComent"><button id ="masOp" class ="masOp">Comentar</button></div>
				</section>
			</div>
			<div class = "tagss">
				<a href="">#tag</a>
				<a href="">#tag</a>
				<a href="">#tag</a>
				<a href="">#tag</a>
				<a href="">#tag</a>
				<a href="">#tag</a>
			</div>    
                        
		</div>
          
            </section>
            <%                               
            }
        }
            %>
        </div>
        


<div class = "c">
<a href="#" class="cd-top"><img src="go_top.png"></a>

</div>
<script src = "js/topRight.js"></script>
	
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