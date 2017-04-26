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

	<link href="css/PROFILE_STYLE.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Raleway|Baloo+Paaji" rel="stylesheet">
	<link rel="icon" href="IMG\PICKME.ico">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/custombox.min.js"></script>.
	<script src="js/legacy.min.js"></script>
	<script src="js/custombox.min.js"></script>
        <script src="js/editAbout_JS.js"></script>
        <script src="js/follows_JS.js"></script>        
        <script src="js/verFotoPost_JS.js"></script>
         <script src="js/editAbout_JS.js"></script>
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

    <%   
        while(rs.next()){
    %>
    <form name = "subirImgs" id = "subirImgs"  action = "editarPerfil" method="POST" enctype="multipart/form-data">
        <input type="text" name="idu"  id="idu" style ="display: none" value = "<%=rs.getString("idUser")%>" >
	<div class = "PictureCover">
            
		<div class = "PicCoCont">
			<div class = "pico">
				<img class = "cover"  id ="portada" src = "LeerImagenCov?idUser=<%=rs.getString("idUser")%>">
				<div class = "subirFC"  >
                                    
                                 <div class = "ocultoFoto"><label for="subirFotoC"id = "imagenPerfil" class="fotoCoverSubir" ></label>
				<input id="subirFotoC" name="imgC" type="file" accept="image/*" onchange="verFotoC(event)"/></div>                                
                                
				</div>
			</div>
		</div>
	</div>    
	<div class  =  "ProfilePicture">
		<div class = "ProPicCont">
			<div class = "propic">
				<img class = "prop"   id ="perfil" src ="LeerImagen?idUser=<%=rs.getString("idUser")%>">
				<div class = "subirF">
                                    
				  <div class = "ocultoFoto"><label for="subirFotoP" id = "imagenCover"class="fotoPerfilSubir"></label>
				<input id="subirFotoP" name="imgP" type="file" accept="image/*" onchange="verFotoP(event)"/></div>
                                
				</div>
			</div>
		</div>
	</div>
	<div class  =  "Data">
		<div class = "DataCont">
			<div class = "tabladata">
				<div class = "NameU">
					<h1><a href="profile.jsp"><%=rs.getString("usernm")%></a></h1>
				</div>
				<table id= "tabla_jaja" >
					<tr>
                                                <td>Fecha de Nacimiento</td>
                                                <td>Sexo</td>
						<td>Seguidores</td>
						<td>Seguiendo</td>						
						<td>Me gusta</td>
                                                <td>PicMe+</td>
					</tr>
					<tr>
                                                <td><%=rs.getString("fechn")%></td>
                                                <td><%=rs.getString("gender")%></td>
						<td>cantidad</td>
						<td>cantidad</td>
						<td>cantidad</td>
						<td><label for="seguir" id ="imgSeguir" class="seguir dejarseguir" ></label>
                                                    <buttom id="seguir"></buttom></td>
					</tr>
				</table>				
			</div>
			<div class = "Descripcion">
                            
                         <p><%=rs.getString("about")%></p>                                        
                        <div class = "btEd"><button type="button" id="btnEdit">Editar</button></div>
                        
                        <input type ="text"  name="descrip"  id="descrip" class = "oculto" place holder = "<%=rs.getString("about")%> ">
                        <div class = "btOk"><button type="button" id="btnOk" class = "oculto">Ok</button></div>
			</div>
		</div>	
	</div>
    </form>
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
	<div class="posts">
            <%        
            // rows  
            
    String iduu = rs.getString("idUser");    
    Integer idu = Integer.parseInt(iduu.trim());
    
    CallableStatement proc2 = null;
    ResultSet rs2 = null;
    String sql2 = "{ call readPostsU(?) }";
    proc2= conn.getCon().prepareCall(sql2);    
    proc2.setInt(1, idu);
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
			<div>
                            <form name = "subirImgs" id = "subirImgs"  action = "imagenPost" method="POST" enctype="multipart/form-data">
                                <img style = "min-width:600px;"src="imagenPost?idPost=<%=rs2.getString("idPost")%>" class = "center" id="imagenpost">
                            </form>                            
                            <script>
                                
                                var verFotogg = function(event) {
                                    var reader = new FileReader();
                                    reader.onload = function(){
                                      var output = document.getElementById('imagenpost');
                                      output.src = reader.result;
                                    };
                                    reader.readAsDataURL(event.target.files[0]);
                                  };
                                  function VerInputgg(){         
                                        $(".ocultoeditP").css ("display","inline");   
                                  }
                                  $(document).ready(function(){    
                                      $("#btnEditarPu").click(VerInputgg);    
                                  });
                                  function ocultarInputgg(){         
                                        $(".ocultoeditP").css ("display","none");

                                        var des= $("#textoAbout").val();
                                        var picPost= $("#subirFotopost").val();
                                        
                                        if((des!="") && (picPost!="")){     
                                        $("#subirImgsnuevo").submit();
                                          }
                                        else{
                                             alert('Por favor llene todos los campos.');
                                        }
                                  }
                                  $(document).ready(function(){
                                      $("#btnGuardar").click(ocultarInputgg);
                                  });

                            </script>
			</div>
				
			<div class = "caption">
				<ul class  = "u_caption u_caption2">
                                    
                                    <form name = "subirImgsnuevo" id = "subirImgsnuevo"  action = "EditarPost" method="POST" enctype="multipart/form-data">
                                        <input type="text" name="idp"  id="idp" style ="display: none" value = "<%=rs2.getString("idPost")%>" >
                                        <div class = "ocultoeditP" id="posiBotonSubirImg">
                                            <label for="subirFotopost" id = "imagenDpost" class="fotoCoverSubirN" ></label>
                                            <input id="subirFotopost" name="imgPost" type="file" accept="image/*" onchange="verFotogg(event)"/>
                                        </div> 
					<li class="cosa1">
						<h2>
						<a class = "ref_nombreU" title = "bstaru95" href=""><%=rs2.getString("usernm")%></a>
						<span>
						<%=rs2.getString("post_body")%>
						</span>
						</h2>
                                                
                                                <input type="text" class = "ocultoeditP" id="textoAbout" name="textoAbout" place holder="<%=rs2.getString("post_body")%>">
                                                
                                                <button class = "ocultoeditP" id ="btnGuardar">Guardar</button>
                                        </li>
                                    </form>
					<li class = "cosa1">ekisde comentario</li>
					<li class = "cosa1">ekisde comentario</li>
					<li class = "cosa1">ekisde comentario</li>
					<li class = "cosa1">ekisde comentario</li>
				</ul>
				 
                        <hr>
				<section class = "coment1">
					<div class = "inComent"><input value="Añade un comentario..." onfocus="if(this.value=='Añade un comentario...')this.value='';" 
                                                                       onblur="if(this.value=='')this.value='Añade un comentario...';"></div>		
					
                                        <!--div class = "okComent"><button id ="masOp" class ="masOp">Más opciones</button></div-->
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
                                                
                                                
                       <div class = "vermas" id = "vermas" name = "seemore">                           
                                
				<button  id ="btnEditarPu">Editar</button>
                                
				<button  id ="btnBorrarPu">Borrar</button>
                                <script>
                                     function VerInput2(){         
                                        $(".ocultoB").css ("display","inline");
                                     }
                                     $(document).ready(function(){    
                                         $("#btnBorrarPu").click(VerInput2);   
                                     });

                                     function ocultarInput2(){         
                                           $(".ocultoB").css ("display","none");
                                     }
                                     $(document).ready(function(){
                                         $("#btnBorrarPuN").click(ocultarInput2);
                                     });
                                     function ocultarInput3(){                                          
                                           $(".ocultoB").css ("display","none");
                                           $("#byeP").submit(); 
                                     }
                                     $(document).ready(function(){
                                         $("#btnBorrarPuY").click(ocultarInput3);
                                     });
                                     
                                </script>
                                <div id = "lugarBtns" class="ocultoB">                                        
                                        <h3 class = "seguro">¿Está seguro?</h3>
                                        <form name = "byeP" id = "byeP"  action = "BorrarPublicacion" method="POST">
                                        <input type="text" name="idp"  id="idp" style ="display: none" value = "<%=rs2.getString("idPost")%>" >
                                        <button  id ="btnBorrarPuY">Si</button>  </form>   
                                        <button  id ="btnBorrarPuN" class="PosiN">Cancelar</button>
                                </div>
                                
				<button  id ="btnReportPu">Reportar</button>
			</div>
		</div>
          
            </section>
            <%                               
            }
        }
            %>
        </div>
        
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
			 </table>
			 </div>
		 </div>
 </div>

<div class = "c">
<a href="#" class="cd-top"><img src="go_top.png"></a>
</div>
<script src = "js/SCROLL.js"></script>

<script src = "js/topRight.js"></script>

</body>
</html>