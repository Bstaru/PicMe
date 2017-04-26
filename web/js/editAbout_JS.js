
function VerInput(){         
      $(".oculto").css ("display","inline");         
      $(".ocultoFoto").css ("display","inline");     
}
$(document).ready(function(){    
    $("#btnEdit").click(VerInput);    
});

function ocultarInput(){         
      $(".oculto").css ("display","none");
      $(".ocultoFoto").css ("display","none");
      
      var des= $("#descrip").val();
      var picP= $("#subirFotoP").val();
      var picC= $("#subirFotoC").val();
      if((des!="") && (picP!="") && (picC!="") ){     
      $("#subirImgs").submit();
        }
      else{
           alert('Por favor llene todos los campos.');
      }
}
$(document).ready(function(){
    $("#btnOk").click(ocultarInput);
});

var verFotoP = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('perfil');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  
 var verFotoC = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('portada');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  


