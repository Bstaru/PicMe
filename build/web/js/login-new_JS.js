
window.addEventListener('load',function(){
    //alert('cargado');
    document.getElementById('btnlogin').addEventListener('click', function(){
        
       var email = document.getElementById('mail').value;
       var contra = document.getElementById('password').value;
        
       var bandera = false;  
        
       if(email.length > 0 && contra.length > 0){
          bandera = true;
       }
       if(bandera){
            document.getElementById('formuLog').submit();
       }else{
            alert('Por favor llene todos los campos.');
       }
    });
}); 
function ValidarLogin(){
    
      $("#mail").css ("border-color","#ffffff");
      $("#password").css ("border-color","#ffffff");
      $(".flechita1").css ("display","none");
      $(".flechita2").css ("display","none");
      
    var correo= $("#mail").val();
    var contra = $("#password").val();
    
    if((correo!="") && (contra != "")){         
    $("#formuLog").submit();
    }
    else{
        if(correo==""){
            $("#mail").css ("border-color","#fc6a6a");
            $(".flechita1").css ("display","inline");
        }
        if( /^\s*$/.test(correo)){
            $("#mail").css ("border-color","#f2f259");
        }
         if(contra==""){
            $("#password").css ("border-color","#fc6a6a");
             $(".flechita2").css ("display","inline");
        }
    }
}
$(document).ready(function(){
    $("#btnlogin").click(ValidarLogin);
});


function ValidarNuevo(){
    
    $("#correo").css ("border-color", "#ffffff");
    $("#contra").css ("border-color", "#ffffff");
    $("#nombre").css ("border-color", "#ffffff");
    $("#usuario").css ("border-color", "#fffffff");
    $("#FeNac").css ("border-color", "#ffffff");
    $("#ciudades").css ("border-color", "#ffffff");
    $("#preguntas").css ("border-color", "#ffffff");
    $("#respuesta").css ("border-color", "#ffffff");
     
    var mail= $("#correo").val();
    var pass = $("#contra").val();
    var name= $("#nombre").val();
    var user = $("#usuario").val(); 
    var date= $("#FeNac").val();
    var gend = $("#genero").val(); 
    var city= $("#ciudades").val();
    var quest = $("#pregunta").val(); 
    var answ= $("#respuesta").val();
    var type = $("#tipo").val(); 
    var priv= $("#privado").val();
    var about = $("#acerca").val();
    var imgP = $("#imgP").val();
    var imgC = $("#imgC").val();
    
    
    
    if((mail!="") && (pass!= "") && (name!= "") && (user!= "") && (date!= "") && (gend!= "") && (city!= "") && (quest!= "") && (answ!= "")){         
    $("#llenar").submit();
    }
    else{        
        if(mail==""){
            $("#correo").css ("border-color", "#fc6a6a");
        }
        if(pass==""){
            $("#contra").css ("border-color", "#fc6a6a");
        }
        if(name==""){
            $("#nombre").css ("border-color", "#fc6a6a");
        }
        if(user==""){
            $("#usuario").css ("border-color", "#fc6a6a");
        }        
        if(date==""){
            $("#FeNac").css ("border-color", "#fc6a6a");
        }
        //genero fle6
        if(city==""){
            $("#ciudades").css ("border-color", "#fc6a6a");
        }
        if(quest==""){
            $("#preguntas").css ("border-color", "#fc6a6a");
        }
        if(answ==""){
            $("#respuesta").css ("border-color", "#fc6a6a");
        }
    }    
}
$(document).ready(function(){
    $("#llenar").click(ValidarNuevo);
});
